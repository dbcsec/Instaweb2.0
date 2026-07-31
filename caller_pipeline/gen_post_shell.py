#!/usr/bin/env python3
"""Generate shell script with curl commands for lead append."""
import json, hashlib, os, re

SHARED_DIR = "/home/team/shared"
VALID_SOURCES = {"polsia", "instaweb", "manual", "caller"}

ARTIFACT_FILES = [
    ("send_ready_final.json", True),
    ("fresh_scraped_leads.json", True),
    ("send_ready_prospects.json", True),
    ("verified_leads.json", True),
    ("lead_products/verified_leads.json", True),
    ("all_phone_leads.json", False),  # large, lower priority
    ("bulk_new_leads.json", False),
    ("new_leads.json", False),
    ("massive_leads.json", False),
    ("clean_leads_deduped.json", False),
    ("all_leads_merged.json", False),
    ("verified_500_leads.json", False),
    ("lead_products/master_leads.csv", False),
]

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

# Load & normalize
print("Loading & normalizing...")
seen = set()
normalized = []
skipped = 0
for fname, _ in ARTIFACT_FILES:
    leads = load_artifact(fname)
    print(f"  {fname}: {len(leads)}")
    for raw in leads:
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
            "industry": ind or "",
            "email": em or "",
            "demo_url": demo,
            "source": src,
            "notes": str(raw.get("notes") or raw.get("description") or "")[:500],
        })

print(f"Unique leads: {len(normalized)}, skipped: {skipped}")

# Generate shell script
script_path = os.path.join(SHARED_DIR, "post_leads.sh")
with open(script_path, 'w') as f:
    f.write("#!/bin/bash\n")
    f.write(f"# Auto-generated lead POST script — {len(normalized)} leads\n")
    f.write("API='https://www.instaweb.agency/api/caller/leads'\n")
    f.write("COUNT=0\n")
    f.write("OK=0\n")
    f.write("DUP=0\n")
    f.write("ERR=0\n\n")
    
    for lead in normalized:
        payload = json.dumps(lead)
        escaped = payload.replace("'", "'\\''")
        f.write(f"RESP=$(curl -s --max-time 15 -X POST \"$API\" -H 'Content-Type: application/json' -d '{escaped}' 2>/dev/null)\n")
        f.write(f"STATUS=$(echo \"$RESP\" | python3 -c \"import sys,json; print(json.load(sys.stdin).get('status','error'))\" 2>/dev/null)\n")
        f.write(f"case \"$STATUS\" in\n")
        f.write(f"  inserted|inserted_force) OK=$((OK+1)) ;;\n")
        f.write(f"  duplicate|merged) DUP=$((DUP+1)) ;;\n")
        f.write(f"  *) ERR=$((ERR+1)) ;;\n")
        f.write(f"esac\n")
        f.write(f"COUNT=$((COUNT+1))\n")
        f.write(f"if [ $((COUNT % 100)) -eq 0 ]; then echo \"  $COUNT/{len(normalized)} (ok=$OK dup=$DUP err=$ERR)\"; fi\n\n")
    
    f.write(f"echo \"DONE: $COUNT leads (ok=$OK dup=$DUP err=$ERR)\"\n")

os.chmod(script_path, 0o755)
print(f"\nShell script: {script_path}")
print(f"Leads to POST: {len(normalized)}")
print(f"Run: bash {script_path}")
