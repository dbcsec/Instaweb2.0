#!/usr/bin/env python3
"""
Instaweb Agency — Safe Lead Append (urllib-based)
===================================================
Posts leads to the caller API using urllib (avoids subprocess hang).
Dedup via lead_id per Instaweb Lead Protocol v1.1.
"""

import json, hashlib, os, re, time
from datetime import datetime, timezone
from urllib.request import Request, urlopen
from urllib.error import HTTPError, URLError

SHARED_DIR = "/home/team/shared"
LEADS_API = "https://www.instaweb.agency/api/caller/leads"
VALID_SOURCES = {"polsia", "instaweb", "manual", "caller"}
BATCH_SIZE = 50

ARTIFACT_FILES = [
    "fresh_scraped_leads.json", "send_ready_prospects.json", "all_phone_leads.json",
    "all_leads_merged.json", "new_leads.json", "verified_500_leads.json",
    "verified_leads.json", "send_ready_final.json", "bulk_new_leads.json",
    "massive_leads.json", "clean_leads_deduped.json",
    "lead_products/verified_leads.json", "lead_products/master_leads.csv"
]

# === Normalization (matches API's normalizeName/normalizePhone etc) ===
def normalize_phone(p):
    if not p: return ""
    d = re.sub(r'\D', '', str(p))
    if len(d) == 10: d = '1' + d
    if len(d) == 11 and d[0] == '1': return '+' + d
    return '+' + d

def normalize_name(n):
    if not n: return ""
    sfx = ['llc','inc','co','the','&','corp','corporation','ltd','limited']
    s = n.lower(); s = re.sub(r'[^a-z0-9\s]', '', s); s = re.sub(r'\s+', ' ', s).strip()
    for x in sfx: s = re.sub(r'\s+' + re.escape(x) + r'$', '', s)
    return s.strip()

def norm_city(c): return (c or '').lower().strip()
def norm_state(s): return (s or '').lower().strip()[:2]

def lead_id(biz, phone, city, state):
    k = f"{normalize_name(biz)}|{normalize_phone(phone)}|{norm_city(city)},{norm_state(state)}"
    return hashlib.sha256(k.encode()).hexdigest()

# === Load ===
def load_artifact(path):
    path = os.path.join(SHARED_DIR, path)
    if not os.path.exists(path): return []
    try:
        if path.endswith('.csv'):
            import csv
            with open(path, newline='') as f: return list(csv.DictReader(f))
        with open(path) as f: data = json.load(f)
        if isinstance(data, list): return data
        if isinstance(data, dict):
            for k in ['leads','prospects','results','data']:
                if k in data: return data[k]
            if 'business_name' in data: return [data]
        return []
    except: return []

def is_valid(lead):
    b = (lead.get("business_name") or lead.get("name") or lead.get("company") or "").strip()
    p = lead.get("phone") or lead.get("phone_number") or lead.get("tel") or ""
    c = (lead.get("city") or "").strip()
    if not b or not p or not c: return False
    if len(normalize_phone(p)) < 11: return False
    if b.lower() in {"sponsored","test","example","sample","null","undefined","none"}: return False
    if len(b) < 2: return False
    return True

# === API calls via urllib ===
def api_get(url, timeout=20):
    req = Request(url, headers={"Accept": "application/json"})
    try:
        resp = urlopen(req, timeout=timeout)
        return json.loads(resp.read())
    except Exception as e:
        print(f"  API GET error: {e}")
        return {}

def api_post(url, data, timeout=20):
    body = json.dumps(data).encode()
    req = Request(url, data=body, headers={"Content-Type": "application/json", "Accept": "application/json"})
    try:
        resp = urlopen(req, timeout=timeout)
        return json.loads(resp.read())
    except HTTPError as e:
        try:
            return json.loads(e.read())
        except:
            return {"status": "error", "http_status": e.code}
    except Exception as e:
        return {"status": "error", "message": str(e)}

# === Fetch existing IDs ===
def get_existing_ids():
    ids = set()
    page = 1
    while True:
        resp = api_get(f"{LEADS_API}?page={page}&limit=100")
        leads = resp.get("leads", [])
        if not leads: break
        for l in leads:
            lid = l.get("lead_id")
            if lid: ids.add(lid)
        if len(leads) < 100: break
        page += 1
        time.sleep(0.2)
    return ids

# === MAIN ===
print("=" * 60)
print("Safe Lead Append — urllib-based")
print(f"Started: {datetime.now(timezone.utc).isoformat()}")
print("=" * 60)

# 1. Current state
print("\n[1] Fetching existing leads...")
resp = api_get(f"{LEADS_API}?limit=1")
total_before = resp.get("total", 0)
print(f"  Current leads: {total_before}")

existing = get_existing_ids()
print(f"  Fetched {len(existing)} IDs for dedup")

# 2. Backup
print("\n[2] Backup...")
backup_dir = os.path.join(SHARED_DIR, "caller_backups")
os.makedirs(backup_dir, exist_ok=True)
ts = datetime.now().strftime("%Y%m%d_%H%M%S")
backup_path = os.path.join(backup_dir, f"leads_pool_backup_{ts}.json")
with open(backup_path, 'w') as f:
    json.dump({"timestamp": ts, "total": total_before, "ids": sorted(list(existing)), "count": len(existing)}, f)
print(f"  Saved: {backup_path}")

# 3. Load
print("\n[3] Loading artifacts...")
all_raw = []
for fn in ARTIFACT_FILES:
    leads = load_artifact(fn)
    if leads:
        print(f"  {fn}: {len(leads)} records")
    all_raw.extend(leads)
print(f"  Total raw: {len(all_raw)}")

# 4. Normalize & dedup locally
print("\n[4] Normalizing...")
seen = set()
normalized = []
skipped = 0
for raw in all_raw:
    if not is_valid(raw): skipped += 1; continue
    b = (raw.get("business_name") or raw.get("name") or raw.get("company") or "").strip()[:200]
    p = raw.get("phone") or raw.get("phone_number") or raw.get("tel") or ""
    c = (raw.get("city") or "").strip()[:100]
    s = (raw.get("state") or "").strip()[:50]
    ind = (raw.get("industry") or raw.get("category") or "").strip()[:100]
    em = (raw.get("email") or raw.get("email_address") or "").strip()[:200]
    
    src = str(raw.get("source", "instaweb")).lower().replace(" ", "_").replace("google_maps", "instaweb")
    if src not in VALID_SOURCES: src = "instaweb"
    
    lid = lead_id(b, p, c, s)
    if lid in seen: continue
    seen.add(lid)
    
    slug = re.sub(r'[^a-z0-9]+', '-', b.lower())[:80].strip('-')
    demo = f"https://instaweb.agency/demo/{slug}" if slug else ""
    
    normalized.append({
        "lead_id": lid,
        "business_name": b,
        "phone": normalize_phone(p),
        "city": c,
        "state": s,
        "industry": ind or None,
        "email": em or None,
        "demo_url": demo,
        "source": src,
        "notes": str(raw.get("notes") or raw.get("description") or ""),
        "metadata": {
            "quality_score": raw.get("quality_score"),
            "scraped_at": raw.get("scraped_at")
        }
    })

print(f"  Valid unique: {len(normalized)}")
print(f"  Skipped junk: {skipped}")

# 5. Filter against DB
print("\n[5] Filtering against DB...")
new = [l for l in normalized if l["lead_id"] not in existing]
print(f"  Already in DB: {len(normalized) - len(new)}")
print(f"  New to add: {len(new)}")

if not new:
    print("\n✅ No new leads. Done.")
    exit(0)

# 6. POST new leads
print(f"\n[6] Posting {len(new)} new leads...")
results = {"inserted": 0, "duplicate": 0, "conflict": 0, "merged": 0, "error": 0}
details = []

for i, lead in enumerate(new):
    payload = {k: v for k, v in lead.items() if v is not None}
    resp = api_post(LEADS_API, payload)
    status = resp.get("status", "error")
    results[status] = results.get(status, 0) + 1
    
    if (i+1) % 50 == 0 or i == len(new)-1:
        print(f"  {i+1}/{len(new)} (ins={results.get('inserted',0)}, "
              f"dup={results.get('duplicate',0)}, "
              f"merge={results.get('merged',0)}, "
              f"err={results.get('error',0)})")
    time.sleep(0.08)

# 7. Verify
print("\n[7] Verifying...")
resp2 = api_get(f"{LEADS_API}?limit=1")
total_after = resp2.get("total", 0)

# 8. Report
log_dir = os.path.join(SHARED_DIR, "caller_sync_logs")
os.makedirs(log_dir, exist_ok=True)
log_path = os.path.join(log_dir, f"sync_log_{ts}.json")

report = {
    "run_id": ts,
    "timestamp": datetime.now(timezone.utc).isoformat(),
    "backup_path": backup_path,
    "db_before": total_before,
    "db_after": total_after,
    "artifacts_loaded": len(all_raw),
    "skipped_junk": skipped,
    "normalized_unique": len(normalized),
    "already_in_db": len(normalized) - len(new),
    "new_posted": len(new),
    "results": results,
}
with open(log_path, 'w') as f:
    json.dump(report, f, indent=2, default=str)

print(f"\n{'=' * 60}")
print(f"COMPLETE")
print(f"  Inserted:  {results.get('inserted', 0)}")
print(f"  Duplicates:{results.get('duplicate', 0)}")
print(f"  Merged:    {results.get('merged', 0)}")
print(f"  Errors:    {results.get('error', 0)}")
print(f"  DB before: {total_before}")
print(f"  DB after:  {total_after}")
print(f"  Log:       {log_path}")
print(f"  Backup:    {backup_path}")
print(f"{'=' * 60}")
