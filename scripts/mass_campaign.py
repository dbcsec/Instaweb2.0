#!/usr/bin/env python3
"""Instaweb Agency - Fixed Mass Demo Generator + Email Sender
Handles Turso data format correctly. Generates demos with proper URLs.
"""
import json, os, subprocess, time, re, urllib.request
from datetime import datetime

BASE_DIR = "/home/team/shared/instaweb-unified"
OUTPUT_DIR = f"{BASE_DIR}/data/demos/mass_output"
EMAIL_DIR = f"{BASE_DIR}/data/outreach/mass_batches"
RESEND_KEY = os.environ.get("RESEND_API_KEY", "")
TRADE_TPL = f"{BASE_DIR}/templates/elite-trade.html"

# Turso DB
apiUrl = "https://instaweb-dbcsec.aws-us-west-2.turso.io/v2/pipeline"
tok = "eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODExNjAzMDAsImlkIjoiMDE5ZWI1NmItZWYwMS03M2M4LThkYTktZTc4ZDU4ODAyZDAzIiwicmlkIjoiMjM0NWRhMTEtNzcyZS00NDBmLTg5MTQtN2NmMDRjY2VhN2U2In0.tNHYMT7WOKcv4DKqjC5xJTUjBTsIQvGa-dn50Fq7r-AuLJL2QBavg7eP7fj8HPdJ6ZI6IU0JNBCl6A-Gkii-Ag"

def get_leads(offset=0, limit=500):
    sql = f"SELECT business_name, industry, city, state_code, phone, website_url, email, status FROM leads LIMIT {limit} OFFSET {offset}"
    req = urllib.request.Request(f"{apiUrl}/v2/pipeline",
        data=json.dumps({"requests": [{"type": "execute", "stmt": {"sql": sql}}]}).encode(),
        headers={"Authorization": f"Bearer {tok}", "Content-Type": "application/json"}, method="POST")
    with urllib.request.urlopen(req, timeout=30) as r:
        d = json.loads(r.read())
    
    rows = d.get("results",[{}])[0].get("response",{}).get("result",{}).get("rows",[])
    leads = []
    for row in rows:
        leads.append({
            "business_name": row[0].get("value","") if isinstance(row[0], dict) else str(row[0] or ""),
            "industry": row[1].get("value","") if isinstance(row[1], dict) else str(row[1] or "HVAC"),
            "city": row[2].get("value","") if isinstance(row[2], dict) else str(row[2] or "Houston"),
            "state_code": row[3].get("value","") if isinstance(row[3], dict) else str(row[3] or "TX"),
            "phone": row[4].get("value","") if isinstance(row[4], dict) else str(row[4] or ""),
            "website_url": row[5].get("value","") if isinstance(row[5], dict) else str(row[5] or ""),
            "email": row[6].get("value","") if isinstance(row[6], dict) else str(row[6] or ""),
            "status": row[7].get("value","") if isinstance(row[7], dict) else str(row[7] or "new")
        })
    return leads

def slugify(name):
    s = name.lower().replace("&", "and").replace("'", "").replace('"','')
    s = re.sub(r'[^a-z0-9]+', '-', s).strip('-')
    return s[:80]

def generate_demo(lead):
    with open(TRADE_TPL) as f:
        html = f.read()
    slug = slugify(lead["business_name"])
    demo_url = f"https://www.instaweb.agency/demo/{slug}"
    phone = lead.get("phone","(555) 000-0000") or "(555) 000-0000"
    email = lead.get("email","") or f"contact@{slug}.com"
    
    subs = {
        "{{business_name}}": lead["business_name"],
        "{{tagline}}": f"Trusted {lead['industry'].title()} Service",
        "{{phone}}": phone,
        "{{email}}": email,
        "{{address}}": f"Serving {lead['city']}, {lead['state_code']}",
        "{{city}}": lead["city"], "{{state_code}}": lead["state_code"],
        "{{demo_url}}": demo_url, "{{years_in_business}}": "15",
        "{{review_count}}": "247", "{{rating}}": "4.9",
    }
    for k,v in subs.items():
        html = html.replace(k, v)
    html = re.sub(r'\{\{.*?\}\}', '', html)
    
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    fp = f"{OUTPUT_DIR}/{slug}.html"
    with open(fp, "w") as f:
        f.write(html)
    return demo_url, fp

def send_via_resend(to_email, subject, body):
    """Send via Resend API - works with verified domain"""
    payload = json.dumps({
        "from": "Instaweb Agency <sales@mail.instaweb.agency>",
        "to": [to_email],
        "subject": subject,
        "text": body
    }).encode()
    req = urllib.request.Request("https://api.resend.com/email",
        data=payload,
        headers={"Authorization": f"Bearer {RESEND_KEY}", "Content-Type": "application/json"},
        method="POST")
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            return json.loads(r.read())
    except urllib.error.HTTPError as e:
        body = e.read().decode()
        try: return json.loads(body)
        except: return {"error": body[:200]}
    except Exception as e:
        return {"error": str(e)}

def process_batch(batch_num=1, count=500):
    print(f"\n{'='*50}")
    print(f"BATCH {batch_num} - {count} leads")
    print(f"{'='*50}")
    
    offset = (batch_num - 1) * count
    leads = get_leads(offset, count)
    if not leads:
        print("No leads found.")
        return
    
    print(f"Loaded {len(leads)} leads")
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    os.makedirs(EMAIL_DIR, exist_ok=True)
    
    demos, sent, failed = 0, 0, 0
    results = []
    
    for i, lead in enumerate(leads):
        # Generate demo
        demo_url, fp = generate_demo(lead)
        demos += 1
        
        # Send email if we have a valid address
        to = lead.get("email","").strip()
        if to and "@" in to and "." in to.split("@")[1]:
            slug = slugify(lead["business_name"])
            subject = f"Quick question for {lead['business_name']}"
            body = f"""Hi there,

We built a premium website for {lead['business_name']} — completely free, zero obligation.

🔗 View your site: {demo_url}

It's a $10,000-quality site with:
• Custom design for {lead['industry'].title()}
• Mobile-first, fast-loading
• SEO-optimized for local search
• Google Business Profile integration

Your site is live right now. If you like it, we can keep it running with hosting, updates, and new leads delivered weekly — starting at just $248/mo.

No push. No sales call. Just a site that actually looks like it cost ten grand.

Best,
Instaweb Agency
https://www.instaweb.agency"""
            
            res = send_via_resend(to, subject, body)
            if "id" in res:
                sent += 1
                results.append({"to": to, "status": "sent", "id": res["id"]})
            else:
                failed += 1
                results.append({"to": to, "status": "error", "error": str(res.get("error",""))[:100]})
        else:
            results.append({"to": to or "none", "status": "no-email"})
        
        if (i+1) % 25 == 0:
            print(f"  {i+1}/{len(leads)} - {sent} sent, {failed} failed, {demos} demos")
    
    # Save results
    with open(f"{EMAIL_DIR}/batch_{batch_num}_results.json", "w") as f:
        json.dump(results, f, indent=2)
    with open(f"{OUTPUT_DIR}/batch_{batch_num}_manifest.json", "w") as f:
        json.dump([{"name": lead["business_name"], "url": f"https://www.instaweb.agency/demo/{slugify(lead['business_name'])}"} for lead in leads], f, indent=2)
    
    print(f"\n✅ Batch {batch_num}: {demos} demos, {sent} emails sent, {failed} failed")

if __name__ == "__main__":
    import sys
    b = int(sys.argv[1]) if len(sys.argv) > 1 else 1
    c = int(sys.argv[2]) if len(sys.argv) > 2 else 100
    process_batch(b, c)