#!/usr/bin/env python3
"""Reconcile newly inserted leads against baseline backup."""
import json, subprocess, sys

# Load baseline IDs
with open('/home/team/shared/caller_backups/leads_pool_backup_20260731_213200.json') as f:
    backup = json.load(f)
baseline_ids = set(backup['lead_ids'])
print(f"Baseline: {len(baseline_ids)} leads", flush=True)

# Pull all current leads from API (paginated)
all_leads = []
page = 1
while True:
    url = f"https://www.instaweb.agency/api/caller/leads?limit=50&page={page}"
    result = subprocess.run(['curl', '-s', '--max-time', '15', url], capture_output=True, text=True)
    if not result.stdout.strip():
        break
    try:
        data = json.loads(result.stdout)
    except:
        break
    leads = data.get('leads', [])
    if not leads:
        break
    all_leads.extend(leads)
    print(f"  Page {page}: {len(leads)} leads (total so far: {len(all_leads)})", flush=True)
    page += 1
    if page > 50:
        break

print(f"\nCurrent DB: {len(all_leads)} leads", flush=True)
current_ids = set(l['lead_id'] for l in all_leads)

# Diff
new_ids = current_ids - baseline_ids
removed_ids = baseline_ids - current_ids
print(f"Newly inserted: {len(new_ids)}", flush=True)
print(f"Removed/deleted: {len(removed_ids)}", flush=True)

# Analyze new leads
new_leads = [l for l in all_leads if l['lead_id'] in new_ids]
source_counts = {}
industry_counts = {}
email_present = 0
demo_present = 0

for l in new_leads:
    src = l.get('source', 'unknown') or 'unknown'
    source_counts[src] = source_counts.get(src, 0) + 1
    ind = l.get('industry', '') or 'empty'
    industry_counts[ind] = industry_counts.get(ind, 0) + 1
    if l.get('email', '').strip():
        email_present += 1
    if l.get('demo_url', '').strip():
        demo_present += 1

print(f"\n=== Source breakdown of {len(new_leads)} new leads ===")
for src, count in sorted(source_counts.items(), key=lambda x: -x[1]):
    print(f"  {src}: {count}")

print(f"\n=== Industry breakdown ===")
for ind, count in sorted(industry_counts.items(), key=lambda x: -x[1]):
    print(f"  '{ind}': {count}")

print(f"\n=== Quality metrics ===")
print(f"  With email: {email_present}/{len(new_leads)}")
print(f"  With demo URL: {demo_present}/{len(new_leads)}")

# Identify which artifact files contributed what
print(f"\n=== Artifact source mapping ===")
ARTIFACT_FILES = [
    ("send_ready_final.json", "send_ready"),
    ("fresh_scraped_leads.json", "fresh_scraped"),  
    ("send_ready_prospects.json", "send_ready_prospects"),
    ("verified_leads.json", "verified_leads"),
    ("lead_products/verified_leads.json", "lead_products_verified"),
    ("all_phone_leads.json", "all_phone"),
    ("bulk_new_leads.json", "bulk_new"),
    ("new_leads.json", "new_leads"),
    ("massive_leads.json", "massive"),
    ("clean_leads_deduped.json", "clean_deduped"),
    ("all_leads_merged.json", "all_merged"),
    ("verified_500_leads.json", "verified_500"),
    ("lead_products/master_leads.csv", "master_csv"),
]

# Generate lead_id for each artifact's leads and see which match
import hashlib, re, os

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

def lead_id(biz, phone, city, state):
    k = f"{normalize_name(biz)}|{normalize_phone(phone)}|{city.lower().strip()},{state.lower().strip()[:2]}"
    return hashlib.sha256(k.encode()).hexdigest()

SHARED_DIR = "/home/team/shared"
new_id_set = set(new_ids)

for fname, label in ARTIFACT_FILES:
    path = os.path.join(SHARED_DIR, fname)
    if not os.path.exists(path):
        continue
    try:
        if path.endswith('.csv'):
            import csv
            with open(path, newline='') as f:
                rows = list(csv.DictReader(f))
        else:
            with open(path) as f:
                data = json.load(f)
            if isinstance(data, list):
                rows = data
            elif isinstance(data, dict):
                found = False
                for k in ['leads','prospects','results','data']:
                    if k in data:
                        rows = data[k]
                        found = True
                        break
                if not found:
                    rows = []
            else:
                rows = []
    except Exception as e:
        print(f"  {label}: ERROR - {e}")
        continue
    
    match_count = 0
    for row in rows:
        b = (row.get("business_name") or row.get("name") or row.get("company") or "").strip()
        p = row.get("phone") or row.get("phone_number") or row.get("tel") or ""
        c = (row.get("city") or "").strip()
        s = (row.get("state") or "").strip()
        if not b or not p or not c:
            continue
        lid = lead_id(b, p, c, s)
        if lid in new_id_set:
            match_count += 1
    
    if match_count > 0:
        print(f"  {label} ({fname}): {match_count} matches in new leads")

# Save detailed report
report = {
    'baseline_count': len(baseline_ids),
    'current_count': len(all_leads),
    'new_count': len(new_ids),
    'removed_count': len(removed_ids),
    'source_breakdown': source_counts,
    'industry_breakdown': industry_counts,
    'quality': {'with_email': email_present, 'with_demo': demo_present, 'total_new': len(new_leads)},
}
with open('/home/team/shared/reconciliation_report.json', 'w') as f:
    json.dump(report, f, indent=2)
print(f"\nFull report: /home/team/shared/reconciliation_report.json")
