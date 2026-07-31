#!/usr/bin/env python3
"""
Instaweb Agency — Safe Lead Append to Caller Pool
==================================================
Audits caller app state, backs up current DB, then safely appends
all verified leads from shared artifacts to the Turso `leads_pool`
via the POST /api/caller/leads endpoint.

Protocol: Instaweb Lead Protocol v1.1
- Dedup by SHA-256(business_name|phone|city,state)
- Never overwrites existing records
- Preserves existing statuses/notes
- Creates timestamped backup before any writes
"""

import json
import hashlib
import os
import re
import sys
import subprocess
import tempfile
import time
from datetime import datetime, timezone
from pathlib import Path

# === CONFIG ===
API_BASE = "https://www.instaweb.agency"
LEADS_ENDPOINT = f"{API_BASE}/api/caller/leads"
VALID_SOURCES = {"polsia", "instaweb", "manual", "caller"}
DEFAULT_SOURCE = "instaweb"

SHARED_DIR = Path("/home/team/shared")
BACKUP_DIR = SHARED_DIR / "caller_backups"
OUTPUT_DIR = SHARED_DIR / "caller_sync_logs"

# Artifact files to scan for new leads
ARTIFACT_FILES = [
    "fresh_scraped_leads.json",
    "send_ready_prospects.json",
    "all_phone_leads.json",
    "all_leads_merged.json",
    "new_leads.json",
    "verified_500_leads.json",
    "verified_leads.json",
    "send_ready_final.json",
    "bulk_new_leads.json",
    "massive_leads.json",
    "clean_leads_deduped.json",
    "lead_products/verified_leads.json",
    "lead_products/master_leads.csv",
]


def normalize_phone(phone):
    """Normalize to E.164 format."""
    if not phone:
        return ""
    digits = re.sub(r'\D', '', str(phone))
    if len(digits) == 10:
        digits = '1' + digits
    if len(digits) == 11 and digits[0] == '1':
        return '+' + digits
    return '+' + digits


def normalize_name(name):
    """Normalize business name: lowercase, strip punctuation, strip suffixes."""
    if not name:
        return ""
    suffixes = ['llc', 'inc', 'co', 'the', '&', 'corp', 'corporation', 'ltd', 'limited']
    s = name.lower()
    s = re.sub(r'[^a-z0-9\s]', '', s)
    s = re.sub(r'\s+', ' ', s).strip()
    for suffix in suffixes:
        s = re.sub(r'\s+' + re.escape(suffix) + r'$', '', s)
    return s.strip()


def normalize_city(city):
    if not city:
        return ""
    return city.lower().strip()


def normalize_state(state):
    if not state:
        return ""
    return state.lower().strip()[:2]


def compute_lead_id(business_name, phone, city, state):
    """SHA-256 of normalizedName|normalizedPhone|normalizedCity,normalizedState"""
    key = f"{normalize_name(business_name)}|{normalize_phone(phone)}|{normalize_city(city)},{normalize_state(state)}"
    return hashlib.sha256(key.encode()).hexdigest()


def run_curl(method, url, data=None, headers=None, timeout=20):
    """Execute curl and return JSON response. Uses temp file for payload to avoid subprocess hang."""
    cmd = ["curl", "-s", "--max-time", str(timeout), "-X", method, url,
           "-H", "Accept: application/json"]
    if headers:
        for k, v in headers.items():
            cmd.extend(["-H", f"{k}: {v}"])
    
    tmpfile = None
    if data:
        payload = json.dumps(data)
        tmpfile = tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False)
        tmpfile.write(payload)
        tmpfile.close()
        cmd.extend(["-H", "Content-Type: application/json"])
        cmd.extend(["--data-binary", f"@{tmpfile.name}"])
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout+10)
        if tmpfile:
            os.unlink(tmpfile.name)
        try:
            return json.loads(result.stdout), result.returncode
        except json.JSONDecodeError:
            return {"error": "invalid_json", "raw": result.stdout[:200]}, -1
    except Exception as e:
        if tmpfile:
            try: os.unlink(tmpfile.name)
            except: pass
        return {"error": str(e)}, -1


def get_total_leads():
    """Get current total lead count from API."""
    resp, _ = run_curl("GET", f"{LEADS_ENDPOINT}?limit=1")
    return resp.get("total", 0)


def get_existing_lead_ids(batch_size=100):
    """Fetch all existing lead_ids from the API (paginated)."""
    existing = set()
    page = 1
    while True:
        resp, _ = run_curl("GET", f"{LEADS_ENDPOINT}?page={page}&limit={batch_size}")
        leads = resp.get("leads", [])
        if not leads:
            break
        for lead in leads:
            lid = lead.get("lead_id")
            if lid:
                existing.add(lid)
        if len(leads) < batch_size:
            break
        page += 1
        time.sleep(0.3)  # rate limit
    return existing


def load_artifact(path):
    """Load leads from a JSON or CSV artifact file."""
    path = Path(path)
    if not path.exists():
        return []
    
    try:
        if path.suffix == '.csv':
            import csv
            leads = []
            with open(path, newline='') as f:
                reader = csv.DictReader(f)
                for row in reader:
                    leads.append(row)
            return leads
        else:
            with open(path) as f:
                data = json.load(f)
            if isinstance(data, list):
                return data
            elif isinstance(data, dict):
                # Try common keys
                for key in ['leads', 'prospects', 'results', 'data']:
                    if key in data:
                        return data[key]
                # If it has a single lead-like structure
                if 'business_name' in data:
                    return [data]
            return []
    except Exception as e:
        print(f"  ⚠️  Could not load {path.name}: {e}")
        return []


def normalize_lead(lead):
    """Convert a raw lead dict to the API-compatible format."""
    biz = lead.get("business_name", "") or lead.get("name", "") or lead.get("company", "")
    phone = lead.get("phone", "") or lead.get("phone_number", "") or lead.get("tel", "")
    city = lead.get("city", "")
    state = lead.get("state", "")
    industry = lead.get("industry", "") or lead.get("category", "") or ""
    email = lead.get("email", "") or lead.get("email_address", "") or ""
    website = lead.get("website", "") or lead.get("website_url", "") or lead.get("url", "")
    source = lead.get("source", DEFAULT_SOURCE)
    
    # Map demographic source values
    source_map = {
        "google_maps": "instaweb",
        "google maps": "instaweb",
        "serper": "instaweb",
        "scrape": "instaweb",
    }
    source = source_map.get(str(source).lower().replace(" ", "_"), source)
    if source not in VALID_SOURCES:
        source = DEFAULT_SOURCE
    
    # Generate demo URL
    slug = re.sub(r'[^a-z0-9]+', '-', biz.lower().strip())[:80].strip('-')
    demo_url = f"https://instaweb.agency/demo/{slug}" if slug else ""
    
    lead_id = compute_lead_id(biz, phone, city, state)
    
    return {
        "lead_id": lead_id,
        "business_name": str(biz)[:200],
        "phone": normalize_phone(phone),
        "city": str(city)[:100],
        "state": str(state)[:50],
        "industry": str(industry)[:100] if industry else None,
        "email": str(email)[:200] if email else None,
        "demo_url": demo_url,
        "source": source,
        "notes": lead.get("notes", "") or lead.get("description", ""),
        "metadata": {
            "original_source": str(lead.get("source", "")),
            "quality_score": lead.get("quality_score"),
            "has_website": lead.get("has_website_on_maps"),
            "scraped_at": lead.get("scraped_at"),
        }
    }


def is_valid_lead(lead):
    """Check minimum viability of a lead."""
    if not lead.get("business_name") or not lead.get("phone") or not lead.get("city"):
        return False
    phone = normalize_phone(lead.get("phone", ""))
    if not phone or len(phone) < 11:
        return False
    # Skip obvious junk
    biz = lead.get("business_name", "").lower().strip()
    junk_patterns = ["sponsored", "test", "example", "sample", "null", "undefined", "none"]
    if biz in junk_patterns or len(biz) < 2:
        return False
    return True


def backup_db(existing_ids, total):
    """Create timestamped backup of current state."""
    BACKUP_DIR.mkdir(parents=True, exist_ok=True)
    ts = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_path = BACKUP_DIR / f"leads_pool_backup_{ts}.json"
    
    backup = {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "total_leads": total,
        "lead_ids": sorted(list(existing_ids)),
        "lead_count": len(existing_ids)
    }
    
    with open(backup_path, "w") as f:
        json.dump(backup, f, indent=2)
    
    return backup_path


def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    BACKUP_DIR.mkdir(parents=True, exist_ok=True)
    
    run_id = datetime.now().strftime("%Y%m%d_%H%M%S")
    log_path = OUTPUT_DIR / f"sync_log_{run_id}.json"
    
    print("=" * 70)
    print("Instaweb Agency — Caller Lead Append Pipeline")
    print(f"Started: {datetime.now(timezone.utc).isoformat()}")
    print("=" * 70)
    
    # === AUDIT: Current State ===
    print("\n[1/6] Auditing current caller state...")
    total_before = get_total_leads()
    print(f"  Current leads in DB: {total_before}")
    
    print("  Fetching existing lead IDs (for dedup)...")
    existing_ids = get_existing_lead_ids()
    print(f"  Fetched {len(existing_ids)} existing lead IDs")
    
    # === BACKUP ===
    print("\n[2/6] Creating backup...")
    backup_path = backup_db(existing_ids, total_before)
    print(f"  Backup saved: {backup_path}")
    
    # === LOAD NEW LEADS ===
    print("\n[3/6] Loading leads from shared artifacts...")
    all_raw = []
    for fname in ARTIFACT_FILES:
        fpath = SHARED_DIR / fname
        if fpath.exists():
            leads = load_artifact(fpath)
            print(f"  {fname}: {len(leads)} records")
            all_raw.extend(leads)
        else:
            print(f"  {fname}: NOT FOUND")
    
    print(f"\n  Total raw records loaded: {len(all_raw)}")
    
    # === NORMALIZE & DEDUP ===
    print("\n[4/6] Normalizing and deduplicating...")
    seen_local = set()
    normalized = []
    skipped_junk = 0
    
    for raw in all_raw:
        if not is_valid_lead(raw):
            skipped_junk += 1
            continue
        lead = normalize_lead(raw)
        lid = lead["lead_id"]
        if lid in seen_local:
            continue
        seen_local.add(lid)
        normalized.append(lead)
    
    print(f"  After normalization: {len(normalized)} unique leads")
    print(f"  Skipped junk/incomplete: {skipped_junk}")
    
    # === FILTER: NEW ONLY ===
    print("\n[5/6] Filtering against existing DB...")
    new_leads = [l for l in normalized if l["lead_id"] not in existing_ids]
    duplicates = len(normalized) - len(new_leads)
    print(f"  Already in DB: {duplicates}")
    print(f"  New leads to add: {len(new_leads)}")
    
    if not new_leads:
        print("\n✅ No new leads to add. Everything is already synced.")
        return
    
    # === APPEND ===
    print(f"\n[6/6] Appending {len(new_leads)} new leads via API...")
    results = {"inserted": 0, "duplicate": 0, "conflict": 0, "error": 0, "details": []}
    
    for i, lead in enumerate(new_leads):
        payload = {
            "lead_id": lead["lead_id"],
            "business_name": lead["business_name"],
            "phone": lead["phone"],
            "city": lead["city"],
            "state": lead["state"],
            "industry": lead.get("industry") or "",
            "email": lead.get("email") or "",
            "demo_url": lead.get("demo_url") or "",
            "source": lead["source"],
            "notes": lead.get("notes") or "",
            "metadata": lead.get("metadata") or {},
        }
        
        resp, code = run_curl("POST", LEADS_ENDPOINT, payload)
        status = resp.get("status", "unknown")
        results[status] = results.get(status, 0) + 1
        results["details"].append({
            "business_name": lead["business_name"],
            "city": lead["city"],
            "state": lead["state"],
            "status": status,
            "lead_id": lead["lead_id"],
            "response": resp
        })
        
        if (i + 1) % 50 == 0 or i == len(new_leads) - 1:
            print(f"  Progress: {i+1}/{len(new_leads)} "
                  f"(inserted={results.get('inserted',0)}, "
                  f"dup={results.get('duplicate',0)}, "
                  f"conflict={results.get('conflict',0)}, "
                  f"err={results.get('error',0)})")
        
        time.sleep(0.15)  # Rate limit
    
    # === VERIFY ===
    total_after = get_total_leads()
    print(f"\n  Expected DB total: {total_before + results.get('inserted', 0)}")
    print(f"  Actual DB total:   {total_after}")
    
    # === SAVE LOG ===
    final_report = {
        "run_id": run_id,
        "started_at": datetime.now(timezone.utc).isoformat(),
        "backup_path": str(backup_path),
        "before_count": total_before,
        "after_count": total_after,
        "total_loaded": len(all_raw),
        "skipped_junk": skipped_junk,
        "normalized_unique": len(normalized),
        "already_in_db": duplicates,
        "new_added": len(new_leads),
        "results": results,
        "exclusions": [l["business_name"] for l in normalized if l["lead_id"] in existing_ids][:50]
    }
    
    with open(log_path, "w") as f:
        json.dump(final_report, f, indent=2, default=str)
    
    print(f"\n{'=' * 70}")
    print(f"SYNC COMPLETE")
    print(f"  Added:        {results.get('inserted', 0)}")
    print(f"  Duplicates:   {results.get('duplicate', 0)}")
    print(f"  Conflicts:    {results.get('conflict', 0)}")
    print(f"  Errors:       {results.get('error', 0)}")
    print(f"  DB before:    {total_before}")
    print(f"  DB after:     {total_after}")
    print(f"  Log:          {log_path}")
    print(f"  Backup:       {backup_path}")
    print(f"{'=' * 70}")


if __name__ == "__main__":
    main()
