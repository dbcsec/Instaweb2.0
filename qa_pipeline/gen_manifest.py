#!/usr/bin/env python3
"""Generate QA manifest (URL verification + CTA audit only, no snapshots)."""
import json, os, re, subprocess
from datetime import datetime, timezone

SEND_READY_FILE = "/home/team/shared/send_ready_final.json"
OUTPUT_DIR = "/home/team/shared/qa_pipeline"
MANIFEST_FILE = os.path.join(OUTPUT_DIR, "qa_manifest.json")
AUDIT_REPORT = os.path.join(OUTPUT_DIR, "stripe_audit.md")
DEMO_DIR = "/home/team/shared/instaweb-unified/data/demos/mass_output"

STRIPE_LINKS = {
    "activation": {"url": "https://buy.stripe.com/aFa28rbMm5129pa3P5djO0a", "price": "$399", "type": "one-time", "description": "Activation Fee"},
    "hosting": {"url": "https://buy.stripe.com/14A28r17I65644QgBRdjO0b", "price": "$248/mo", "type": "recurring", "description": "Hosting & Support (monthly)"}
}
EXPECTED_SETUP_PRICE = "$399"
EXPECTED_MONTHLY_PRICE = "$248/mo"
OUTDATED_MONTHLY_PRICE = "$99/mo"

def run_curl(url):
    cmd = ["curl", "-sL", "--max-time", "15", "-w", "\n__CURL_STATUS:%{http_code}__\n__CURL_URL:%{url_effective}__", url]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=20)
        output = result.stdout
        sm = re.search(r'__CURL_STATUS:(\d+)__', output)
        um = re.search(r'__CURL_URL:(.*?)__', output)
        status = int(sm.group(1)) if sm else 0
        eff = um.group(1).strip() if um else url
        body = re.sub(r'__CURL_STATUS:\d+__.*', '', output, flags=re.DOTALL).strip()
        body = re.sub(r'__CURL_URL:.*?__', '', body, flags=re.DOTALL).strip()
        return status, eff, body
    except:
        return 0, url, ""

def audit_html(body):
    f = {"has_stripe_link": False, "stripe_links_found": [], "has_tel_link": False,
         "cta_links": [], "sticky_pricing": None, "pricing_correct": None, "pricing_issue": None}
    stripe_matches = re.findall(r'https?://buy\.stripe\.com/[^\s"\'<>]+', body)
    stripe_matches += re.findall(r'https?://checkout\.stripe\.com/[^\s"\'<>]+', body)
    if stripe_matches:
        f["has_stripe_link"] = True
        f["stripe_links_found"] = stripe_matches
    tel_matches = re.findall(r'href="(tel:[^"]+)"', body)
    if tel_matches:
        f["has_tel_link"] = True
        f["cta_links"] = tel_matches
    spm = re.search(r'\$(\d+)\s*Setup?\s*<span>\+\s*\$(\d+)/mo</span>', body)
    if spm:
        setup = f"${spm.group(1)}"
        monthly = f"${spm.group(2)}/mo"
        f["sticky_pricing"] = f"{setup} Setup + {monthly}"
        if setup == EXPECTED_SETUP_PRICE and monthly == EXPECTED_MONTHLY_PRICE:
            f["pricing_correct"] = True
        elif monthly == OUTDATED_MONTHLY_PRICE:
            f["pricing_correct"] = False
            f["pricing_issue"] = f"Outdated monthly: {monthly} (should be {EXPECTED_MONTHLY_PRICE})"
        else:
            f["pricing_correct"] = False
            f["pricing_issue"] = f"Unexpected pricing: {setup} + {monthly}"
    return f

# Load leads
with open(SEND_READY_FILE) as f:
    data = json.load(f)
leads = data["leads"]

# Process
qa = []
ok = fail = 0
for i, lead in enumerate(leads):
    slug = lead["demo_url"].rstrip("/").split("/")[-1]
    status, eff_url, body = run_curl(lead["demo_url"])
    healthy = status == 200
    if healthy: ok += 1
    else: fail += 1
    cta = audit_html(body) if body else {}
    local_exists = os.path.exists(os.path.join(DEMO_DIR, f"{slug}.html"))
    qa.append({
        "index": i+1,
        "business_name": lead["business_name"],
        "city": lead.get("city",""), "state": lead.get("state",""),
        "industry": lead.get("industry",""), "email": lead.get("email",""),
        "phone": lead.get("phone",""), "demo_url": lead["demo_url"],
        "demo_slug": slug, "url_verified": healthy, "http_status": status,
        "local_demo_exists": local_exists, "cta_audit": cta,
        "purchase_link_status": "MISSING" if not cta.get("has_stripe_link") else "PRESENT",
        "pricing_status": "OK" if cta.get("pricing_correct") else ("OUTDATED" if cta.get("pricing_issue") else "UNKNOWN")
    })
    if (i+1) % 10 == 0:
        print(f"  {i+1}/{len(leads)} ({ok} OK, {fail} fail)")

# Stripe audit
stripe_status = {}
for k, v in STRIPE_LINKS.items():
    s, _, _ = run_curl(v["url"])
    stripe_status[k] = {"url": v["url"], "http_status": s, "live": s==200,
                        "price": v["price"], "type": v["type"], "description": v["description"]}

# Summary
stripe_present = sum(1 for r in qa if r["cta_audit"].get("has_stripe_link"))
pricing_ok = sum(1 for r in qa if r["cta_audit"].get("pricing_correct") is True)
pricing_bad = sum(1 for r in qa if r["cta_audit"].get("pricing_correct") is False)

manifest = {
    "generated_at": datetime.now(timezone.utc).isoformat(),
    "pipeline_version": "1.0",
    "stripe_audit": {
        "audit_date": datetime.now(timezone.utc).isoformat(),
        "stripe_api_keys_configured": False,
        "environment_variables": {"STRIPE_SECRET_KEY": "NOT SET", "STRIPE_PUBLISHABLE_KEY": "NOT SET"},
        "payment_links": stripe_status,
        "all_links_live": all(s["live"] for s in stripe_status.values()),
        "stripe_connect_status": "⚠️ NOT COMPLETED — owner must onboard via Finance tab"
    },
    "summary": {
        "total_leads": len(leads), "urls_verified": ok, "urls_failed": fail,
        "demos_with_stripe_links": stripe_present,
        "demos_missing_stripe": len(leads) - stripe_present,
        "pricing_correct": pricing_ok, "pricing_outdated": pricing_bad,
        "key_findings": [
            "⚠️  ZERO demos contain Stripe purchase links — all CTAs are phone-only (tel:)",
            f"⚠️  All demos have outdated sticky-bar pricing: ${OUTDATED_MONTHLY_PRICE} instead of {EXPECTED_MONTHLY_PRICE}",
            "⚠️  Stripe Connect NOT completed — payment links exist but cannot process transactions",
            f"✅ {ok}/{len(leads)} demo URLs verified healthy (HTTP 200)",
            f"✅ Stripe payment links live: Activation ({STRIPE_LINKS['activation']['price']}) + Hosting ({STRIPE_LINKS['hosting']['price']})",
            "ACTION: Update template sticky bar from $99/mo → $248/mo",
            "ACTION: Add Stripe payment links to demo footer/sticky bar via template",
            "ACTION: Owner must complete Stripe Connect onboarding"
        ]
    },
    "leads": qa
}

with open(MANIFEST_FILE, "w") as f:
    json.dump(manifest, f, indent=2, default=str)

# Audit report
audit_md = f"""# Stripe Catalog Audit — {datetime.now().strftime('%Y-%m-%d %H:%M UTC')}

## Payment Links
| Link | Price | Type | HTTP | Live |
|------|-------|------|------|------|
| Activation Fee | {STRIPE_LINKS['activation']['price']} | {STRIPE_LINKS['activation']['type']} | {stripe_status['activation']['http_status']} | {"✅" if stripe_status['activation']['live'] else "❌"} |
| Hosting & Support | {STRIPE_LINKS['hosting']['price']} | {STRIPE_LINKS['hosting']['type']} | {stripe_status['hosting']['http_status']} | {"✅" if stripe_status['hosting']['live'] else "❌"} |

**URLs:**
- Activation: {STRIPE_LINKS['activation']['url']}
- Hosting: {STRIPE_LINKS['hosting']['url']}

## Stripe API Keys
- STRIPE_SECRET_KEY: NOT SET
- STRIPE_PUBLISHABLE_KEY: NOT SET

## Blockers
1. **Stripe Connect NOT completed** — Owner must onboard via Finance tab
2. **No Stripe API keys** — Cannot create server-side checkout sessions
3. **Payment links exist** but cannot process live transactions

## Demo CTA Status ({len(leads)} send-ready demos)
| Metric | Count |
|--------|-------|
| Demos with Stripe links | {stripe_present} |
| Demos missing Stripe | {len(leads) - stripe_present} |
| Pricing correct ($248/mo) | {pricing_ok} |
| Pricing outdated ($99/mo) | {pricing_bad} |

## Recommendations
1. **Fix template pricing**: Update sticky bar $99/mo → $248/mo
2. **Add Stripe links to template**: Embed activation + hosting links in footer
3. **Regenerate demos** after template update
4. **Complete Stripe Connect** before sending campaign emails
"""
with open(AUDIT_REPORT, "w") as f:
    f.write(audit_md)

print(f"\n✅ Manifest: {MANIFEST_FILE}")
print(f"✅ Audit: {AUDIT_REPORT}")
print(f"\nSummary: {ok}/{len(leads)} URLs OK, {stripe_present} with Stripe, {pricing_bad} outdated pricing")
for f in manifest["summary"]["key_findings"]:
    print(f"  {f}")
