#!/usr/bin/env python3
"""
Instaweb Agency — Fast Lead Append via Direct Turso
====================================================
Same dedup as /api/caller/leads (SHA-256 hash), but uses direct
Turso DB pipeline for batch inserts. Much faster than one-by-one API calls.
"""

import json, hashlib, os, re, time
from datetime import datetime, timezone
from urllib.request import Request, urlopen
from urllib.error import URLError

# === CONFIG ===
API_TOK_PATH = "/home/team/shared/instaweb-unified/API-TOK"
SHARED_DIR = "/home/team/shared"

# Parse API-TOK
def parse_tok():
    d = {}
    with open(API_TOK_PATH) as f:
        for line in f:
            line = line.strip()
            if line.startswith('#') or '=' not in line:
                continue
            k, v = line.split('=', 1)
            d[k.strip()] = v.strip()
    return d

TOK = parse_tok()
# The API uses the TEAM_DB (agent-team-84564803-cto), NOT the instaweb-dbcsec one
# But the TURSO_TOKEN from API-TOK should work for both
TURSO_URL = "libsql://agent-team-84564803-cto.aws-us-west-2.turso.io"
TURSO_TOKEN = TOK.get("TURSO_TOKEN", "")
API_URL = TURSO_URL.replace("libsql://", "https://") + "/v2/pipeline"

def db_execute(sql):
    """Execute SQL via Turso pipeline API. Returns (rows, cols) or (None, None) on error."""
    body = json.dumps({"requests": [{"type": "execute", "stmt": {"sql": sql}}]})
    req = Request(API_URL, data=body.encode(), headers={
        "Authorization": f"Bearer {TURSO_TOKEN}",
        "Content-Type": "application/json"
    })
    try:
        resp = urlopen(req, timeout=30)
        data = json.loads(resp.read())
        result = data.get("results", [{}])[0].get("response", {}).get("result", {})
        rows = result.get("rows", [])
        cols = result.get("cols", [])
        return rows, cols
    except Exception as e:
        print(f"  DB ERROR: {e}")
        return None, None

def db_query_val(sql):
    """Execute SQL and return single scalar value."""
    rows, cols = db_execute(sql)
    if rows and rows[0]:
        cell = rows[0][0]
        if isinstance(cell, dict) and 'value' in cell:
            return cell['value']
        return cell
    return None

def escape(s):
    return (str(s) or '').replace("'", "''")

def normalize_phone(phone):
    if not phone: return ""
    digits = re.sub(r'\D', '', str(phone))
    if len(digits) == 10: digits = '1' + digits
    if len(digits) == 11 and digits[0] == '1': return '+' + digits
    return '+' + digits

def normalize_name(name):
    if not name: return ""
    suffixes = ['llc','inc','co','the','&','corp','corporation','ltd','limited']
    s = name.lower()
    s = re.sub(r'[^a-z0-9\s]', '', s)
    s = re.sub(r'\s+', ' ', s).strip()
    for sfx in suffixes:
        s = re.sub(r'\s+' + re.escape(sfx) + r'$', '', s)
    return s.strip()

def normalize_city(city):
    return (city or '').lower().strip()

def normalize_state(state):
    return (state or '').lower().strip()[:2]

def compute_lead_id(biz, phone, city, state):
    key = f"{normalize_name(biz)}|{normalize_phone(phone)}|{normalize_city(city)},{normalize_state(state)}"
    return hashlib.sha256(key.encode()).hexdigest()

# === Load leads from artifacts ===
ARTIFACT_FILES = [
    "fresh_scraped_leads.json", "send_ready_prospects.json", "all_phone_leads.json",
    "all_leads_merged.json", "new_leads.json", "verified_500_leads.json",
    "verified_leads.json", "send_ready_final.json", "bulk_new_leads.json",
    "massive_leads.json", "clean_leads_deduped.json",
    "lead_products/verified_leads.json", "lead_products/master_leads.csv"
]

def load_artifact(path):
    path = os.path.join(SHARED_DIR, path)
    if not os.path.exists(path):
        return []
    try:
        if path.endswith('.csv'):
            import csv
            with open(path, newline='') as f:
                return list(csv.DictReader(f))
        with open(path) as f:
            data = json.load(f)
        if isinstance(data, list): return data
        if isinstance(data, dict):
            for k in ['leads','prospects','results','data']:
                if k in data: return data[k]
            if 'business_name' in data: return [data]
        return []
    except:
        return []

print("=" * 60)
print("Fast Lead Append — Direct Turso")
print(f"Started: {datetime.now(timezone.utc).isoformat()}")
print("=" * 60)

# 1. Get current state
print("\n[1] Current DB state...")
total_before = db_query_val("SELECT COUNT(*) FROM leads_pool") or 0
print(f"  leads_pool: {total_before} rows")

existing_rows, existing_cols = db_execute("SELECT lead_id FROM leads_pool")
existing_ids = set()
if existing_rows:
    for row in existing_rows:
        cell = row[0]
        existing_ids.add(cell['value'] if isinstance(cell, dict) else cell)
print(f"  Fetched {len(existing_ids)} existing IDs")

# 2. Create backup
print("\n[2] Backup...")
backup_dir = os.path.join(SHARED_DIR, "caller_backups")
os.makedirs(backup_dir, exist_ok=True)
ts = datetime.now().strftime("%Y%m%d_%H%M%S")
backup_path = os.path.join(backup_dir, f"leads_pool_backup_{ts}.json")
with open(backup_path, 'w') as f:
    json.dump({"timestamp": ts, "total": total_before, "ids": sorted(list(existing_ids)), "count": len(existing_ids)}, f)
print(f"  Saved: {backup_path}")

# 3. Load & normalize
print("\n[3] Loading artifacts...")
all_raw = []
for fname in ARTIFACT_FILES:
    leads = load_artifact(fname)
    if leads:
        print(f"  {fname}: {len(leads)} records")
    all_raw.extend(leads)
print(f"  Total raw: {len(all_raw)}")

VALID_SOURCES = {'polsia','instaweb','manual','caller'}

def is_valid(lead):
    biz = (lead.get("business_name") or lead.get("name") or lead.get("company") or "").strip()
    phone = lead.get("phone") or lead.get("phone_number") or lead.get("tel") or ""
    city = (lead.get("city") or "").strip()
    if not biz or not phone or not city: return False
    if len(normalize_phone(phone)) < 11: return False
    junk = {"sponsored","test","example","sample","null","undefined","none"}
    if biz.lower() in junk or len(biz) < 2: return False
    return True

print("\n[4] Normalizing...")
seen = set()
normalized = []
skipped = 0
for raw in all_raw:
    if not is_valid(raw):
        skipped += 1
        continue
    biz = (raw.get("business_name") or raw.get("name") or raw.get("company") or "").strip()[:200]
    phone = raw.get("phone") or raw.get("phone_number") or raw.get("tel") or ""
    city = (raw.get("city") or "").strip()[:100]
    state = (raw.get("state") or "").strip()[:50]
    industry = (raw.get("industry") or raw.get("category") or "").strip()[:100]
    email = (raw.get("email") or raw.get("email_address") or "").strip()[:200]
    website = (raw.get("website") or raw.get("website_url") or raw.get("url") or "").strip()
    source = str(raw.get("source", "instaweb")).lower().replace(" ", "_").replace("google_maps", "instaweb")
    if source not in VALID_SOURCES:
        source = "instaweb"
    
    lid = compute_lead_id(biz, phone, city, state)
    if lid in seen:
        continue
    seen.add(lid)
    
    slug = re.sub(r'[^a-z0-9]+', '-', biz.lower())[:80].strip('-')
    demo_url = f"https://instaweb.agency/demo/{slug}" if slug else ""
    
    normalized.append({
        "lead_id": lid,
        "business_name": biz,
        "phone": normalize_phone(phone),
        "city": city,
        "state": state,
        "industry": industry or None,
        "email": email or None,
        "demo_url": demo_url,
        "source": source,
        "notes": str(raw.get("notes") or raw.get("description") or ""),
        "quality_score": raw.get("quality_score"),
        "scraped_at": raw.get("scraped_at")
    })

print(f"  Valid unique: {len(normalized)}")
print(f"  Skipped junk: {skipped}")

# 4. Filter new
print("\n[5] Filtering new leads...")
new_leads = [l for l in normalized if l["lead_id"] not in existing_ids]
dupes = len(normalized) - len(new_leads)
print(f"  Already in DB: {dupes}")
print(f"  New to insert: {len(new_leads)}")

if not new_leads:
    print("\n✅ No new leads. Exiting.")
    exit(0)

# 5. Batch insert in chunks
print(f"\n[6] Inserting {len(new_leads)} leads in batches...")
now = datetime.now(timezone.utc).isoformat()
CHUNK = 100
inserted = 0
errors = 0

for i in range(0, len(new_leads), CHUNK):
    chunk = new_leads[i:i+CHUNK]
    values = []
    for l in chunk:
        meta = json.dumps({
            "quality_score": l["quality_score"],
            "scraped_at": l["scraped_at"]
        })
        vals = (
            f"('{escape(l['lead_id'])}','{escape(l['business_name'])}','{escape(l['phone'])}',"
            f"'{escape(l['city'])}','{escape(l['state'])}',"
            f"'{escape(l['industry'] or '')}','{escape(l['email'] or '')}',"
            f"'{escape(l['demo_url'])}','{escape(l['source'])}',"
            f"'{escape(l['notes'])}','{escape(meta)}',"
            f"'{now}','{now}')"
        )
        values.append(vals)
    
    sql = ("INSERT INTO leads_pool (lead_id, business_name, phone, city, state, "
           "industry, email, demo_url, source, notes, metadata, first_seen_at, last_updated_at) "
           "VALUES " + ",".join(values))
    
    rows, cols = db_execute(sql)
    if rows is not None:
        inserted += len(chunk)
    else:
        errors += len(chunk)
    
    if (i // CHUNK + 1) % 10 == 0:
        print(f"  {i+len(chunk)}/{len(new_leads)} ({inserted} ok, {errors} err)")
    time.sleep(0.05)

# 6. Verify
total_after = db_query_val("SELECT COUNT(*) FROM leads_pool") or 0
print(f"\n{'=' * 60}")
print(f"COMPLETE")
print(f"  Inserted: {inserted}")
print(f"  Errors:   {errors}")
print(f"  DB before: {total_before}")
print(f"  DB after:  {total_after}")
print(f"  Backup:    {backup_path}")
print(f"{'=' * 60}")
