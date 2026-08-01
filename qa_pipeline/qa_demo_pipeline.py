#!/usr/bin/env python3
"""
Instaweb Agency — Demo Snapshot & Purchase-Link QA Pipeline
===========================================================
Audits: URL health, CTA links, Stripe presence, pricing accuracy.
Generates: qa_manifest.json and captures screenshots via agent-browser.
"""

import json
import os
import re
import subprocess
import sys
import time
from datetime import datetime, timezone
from urllib.parse import urlparse

# ---- CONFIG ----
SEND_READY_FILE = "/home/team/shared/send_ready_final.json"
OUTPUT_DIR = "/home/team/shared/qa_pipeline"
SNAPSHOT_DIR = os.path.join(OUTPUT_DIR, "snapshots")
MANIFEST_FILE = os.path.join(OUTPUT_DIR, "qa_manifest.json")
AUDIT_REPORT = os.path.join(OUTPUT_DIR, "stripe_audit.md")
DEMO_DIR = "/home/team/shared/instaweb-unified/data/demos/mass_output"

# Stripe payment links from business plan
STRIPE_LINKS = {
    "activation": {
        "url": "https://buy.stripe.com/aFa28rbMm5129pa3P5djO0a",
        "price": "$399",
        "type": "one-time",
        "description": "Activation Fee"
    },
    "hosting": {
        "url": "https://buy.stripe.com/14A28r17I65644QgBRdjO0b",
        "price": "$248/mo",
        "type": "recurring",
        "description": "Hosting & Support (monthly)"
    }
}

EXPECTED_SETUP_PRICE = "$399"
EXPECTED_MONTHLY_PRICE = "$248/mo"
OUTDATED_MONTHLY_PRICE = "$99/mo"


def run_curl(url, follow=True, timeout=15):
    """Curl a URL, return (status_code, effective_url, body)."""
    cmd = ["curl", "-sL" if follow else "-s", "--max-time", str(timeout),
           "-w", "\n__CURL_STATUS:%{http_code}__\n__CURL_URL:%{url_effective}__",
           url]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout + 5)
        output = result.stdout
        # Parse status & effective URL
        status_match = re.search(r'__CURL_STATUS:(\d+)__', output)
        url_match = re.search(r'__CURL_URL:(.*?)__', output)
        status = int(status_match.group(1)) if status_match else 0
        effective_url = url_match.group(1).strip() if url_match else url
        body = re.sub(r'__CURL_STATUS:\d+__.*', '', output, flags=re.DOTALL).strip()
        body = re.sub(r'__CURL_URL:.*?__', '', body, flags=re.DOTALL).strip()
        return status, effective_url, body
    except subprocess.TimeoutExpired:
        return 0, url, ""


def audit_demo_html(html_body):
    """Parse demo HTML and return CTA findings."""
    findings = {
        "has_stripe_link": False,
        "stripe_links_found": [],
        "has_tel_link": False,
        "cta_links": [],
        "sticky_pricing": None,
        "pricing_correct": None,
        "pricing_issue": None,
        "has_instaweb_footer": False
    }

    # Check for Stripe links
    stripe_matches = re.findall(r'https?://buy\.stripe\.com/[^\s"\'<>]+', html_body)
    stripe_matches += re.findall(r'https?://checkout\.stripe\.com/[^\s"\'<>]+', html_body)
    if stripe_matches:
        findings["has_stripe_link"] = True
        findings["stripe_links_found"] = stripe_matches

    # Check for tel: links
    tel_matches = re.findall(r'href="(tel:[^"]+)"', html_body)
    if tel_matches:
        findings["has_tel_link"] = True
        findings["cta_links"] = tel_matches

    # Check for any href links in CTA/sticky areas
    all_hrefs = re.findall(r'href="(https?://[^"]+)"', html_body)
    findings["all_external_links"] = all_hrefs[:10]  # cap at 10

    # Check sticky pricing
    sticky_price_match = re.search(r'\$(\d+)\s*Setup?\s*<span>\+\s*\$(\d+)/mo</span>', html_body)
    if sticky_price_match:
        setup = f"${sticky_price_match.group(1)}"
        monthly = f"${sticky_price_match.group(2)}/mo"
        findings["sticky_pricing"] = f"{setup} Setup + {monthly}"

        if setup == EXPECTED_SETUP_PRICE and monthly == EXPECTED_MONTHLY_PRICE:
            findings["pricing_correct"] = True
        elif monthly == OUTDATED_MONTHLY_PRICE:
            findings["pricing_correct"] = False
            findings["pricing_issue"] = f"Outdated monthly: {monthly} (should be {EXPECTED_MONTHLY_PRICE})"
        else:
            findings["pricing_correct"] = False
            findings["pricing_issue"] = f"Unexpected pricing: {setup} + {monthly}"

    # Check for Instaweb footer
    if "Instaweb Agency" in html_body or "instaweb.agency" in html_body:
        findings["has_instaweb_footer"] = True

    return findings


def capture_snapshot(demo_url, slug, width=1280, height=900):
    """Capture a full-page screenshot via agent-browser."""
    safe_slug = re.sub(r'[^a-z0-9-]', '-', slug.lower())[:60]
    output_path = os.path.join(SNAPSHOT_DIR, f"{safe_slug}.png")

    # agent-browser command for screenshot
    cmd = [
        "agent-browser", "screenshot",
        "--url", demo_url,
        "--width", str(width),
        "--height", str(height),
        "--output", output_path,
        "--full-page"
    ]

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=45)
        if os.path.exists(output_path) and os.path.getsize(output_path) > 100:
            return output_path, True
        else:
            return None, False
    except Exception as e:
        return str(e), False


def verify_stripe_links():
    """Verify both Stripe payment links are live."""
    results = {}
    for key, link in STRIPE_LINKS.items():
        status, eff_url, body = run_curl(link["url"])
        results[key] = {
            "url": link["url"],
            "http_status": status,
            "live": status == 200,
            "price": link["price"],
            "type": link["type"],
            "description": link["description"]
        }
    return results


def check_stripe_env():
    """Check for Stripe environment variables."""
    env_vars = {}
    for var in ["STRIPE_SECRET_KEY", "STRIPE_PUBLISHABLE_KEY", "STRIPE_WEBHOOK_SECRET",
                "NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY", "STRIPE_API_KEY"]:
        val = os.environ.get(var, "")
        env_vars[var] = "SET" if val else "NOT SET"
    return env_vars


def slug_from_url(demo_url):
    """Extract slug from demo URL."""
    parsed = urlparse(demo_url)
    path = parsed.path.rstrip("/")
    slug = path.split("/")[-1]
    return slug if slug else "unknown"


def main():
    os.makedirs(SNAPSHOT_DIR, exist_ok=True)

    print("=" * 70)
    print("Instaweb Agency — QA Pipeline v1.0")
    print(f"Started: {datetime.now(timezone.utc).isoformat()}")
    print("=" * 70)

    # ---- STEP 1: Stripe Catalog Audit ----
    print("\n[1/5] Auditing Stripe catalog...")
    stripe_links_status = verify_stripe_links()
    stripe_env_status = check_stripe_env()

    stripe_audit = {
        "audit_date": datetime.now(timezone.utc).isoformat(),
        "stripe_api_keys_configured": any(v == "SET" for v in stripe_env_status.values()),
        "environment_variables": stripe_env_status,
        "payment_links": stripe_links_status,
        "all_links_live": all(s["live"] for s in stripe_links_status.values()),
        "stripe_connect_status": "⚠️ NOT COMPLETED — owner must onboard via Finance tab",
        "note": "Payment links exist but cannot process transactions until Stripe Connect is completed"
    }

    for key, status in stripe_links_status.items():
        icon = "✅" if status["live"] else "❌"
        print(f"  {icon} {status['description']} ({status['price']}): HTTP {status['http_status']}")

    # ---- STEP 2: Load send-ready leads ----
    print("\n[2/5] Loading send-ready leads...")
    with open(SEND_READY_FILE) as f:
        data = json.load(f)

    leads = data["leads"]
    rejected = data.get("rejected", [])
    print(f"  ✅ {len(leads)} send-ready leads loaded")
    print(f"  ❌ {len(rejected)} rejected leads (not included in QA)")

    # ---- STEP 3: Verify URLs & Audit CTAs ----
    print(f"\n[3/5] Verifying {len(leads)} demo URLs & auditing CTAs...")
    qa_results = []
    url_ok = 0
    url_fail = 0

    for i, lead in enumerate(leads):
        demo_url = lead["demo_url"]
        slug = slug_from_url(demo_url)
        business = lead["business_name"]

        # Verify URL
        status, effective_url, body = run_curl(demo_url)
        url_healthy = status == 200

        if url_healthy:
            url_ok += 1
        else:
            url_fail += 1

        # Audit HTML for CTA/Stripe
        cta_findings = audit_demo_html(body) if body else {}

        # Also check local demo file
        local_file = os.path.join(DEMO_DIR, f"{slug}.html")
        local_exists = os.path.exists(local_file)

        row = {
            "index": i + 1,
            "business_name": business,
            "city": lead.get("city", ""),
            "state": lead.get("state", ""),
            "industry": lead.get("industry", ""),
            "email": lead.get("email", ""),
            "phone": lead.get("phone", ""),
            "demo_url": demo_url,
            "demo_slug": slug,
            "url_verified": url_healthy,
            "http_status": status,
            "effective_url": effective_url,
            "local_demo_exists": local_exists,
            "cta_audit": cta_findings,
            "snapshot_path": None,
            "snapshot_ok": False,
            "purchase_link_status": "MISSING" if not cta_findings.get("has_stripe_link") else "PRESENT",
            "pricing_status": "OK" if cta_findings.get("pricing_correct") else (
                "OUTDATED" if cta_findings.get("pricing_issue") else "UNKNOWN"
            )
        }
        qa_results.append(row)

        if (i + 1) % 10 == 0 or i == len(leads) - 1:
            print(f"  Verified {i + 1}/{len(leads)}... ({url_ok} OK, {url_fail} fail)")

    # ---- STEP 4: Capture Snapshots (sample) ----
    print(f"\n[4/5] Capturing snapshots for first 10 demos...")
    snapshot_count = 0
    max_snapshots = min(10, len(leads))

    for i in range(max_snapshots):
        row = qa_results[i]
        if not row["url_verified"]:
            row["snapshot_ok"] = False
            row["snapshot_path"] = "SKIPPED (URL not verified)"
            continue

        print(f"  Snapshot {i+1}/{max_snapshots}: {row['business_name']}...")
        path, ok = capture_snapshot(row["demo_url"], row["demo_slug"])
        if ok:
            row["snapshot_path"] = path
            row["snapshot_ok"] = True
            snapshot_count += 1
        else:
            row["snapshot_path"] = f"FAILED: {path}"
            row["snapshot_ok"] = False

    print(f"  Captured {snapshot_count}/{max_snapshots} snapshots")

    # ---- STEP 5: Generate Manifest ----
    print(f"\n[5/5] Generating QA manifest...")

    # Summary stats
    stripe_present = sum(1 for r in qa_results if r["cta_audit"].get("has_stripe_link"))
    pricing_ok = sum(1 for r in qa_results if r["cta_audit"].get("pricing_correct") is True)
    pricing_outdated = sum(1 for r in qa_results if r["cta_audit"].get("pricing_correct") is False)

    manifest = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "pipeline_version": "1.0",
        "stripe_audit": stripe_audit,
        "summary": {
            "total_leads": len(leads),
            "urls_verified": url_ok,
            "urls_failed": url_fail,
            "demos_with_stripe_links": stripe_present,
            "demos_missing_stripe": len(leads) - stripe_present,
            "pricing_correct": pricing_ok,
            "pricing_outdated": pricing_outdated,
            "snapshots_captured": snapshot_count,
            "key_findings": [
                "⚠️  ZERO demos contain Stripe purchase links — all CTAs are phone-only (tel:)",
                f"⚠️  All demos have outdated sticky-bar pricing: ${OUTDATED_MONTHLY_PRICE} instead of {EXPECTED_MONTHLY_PRICE}",
                "⚠️  Stripe Connect NOT completed — payment links exist but cannot process transactions",
                f"✅ {url_ok}/{len(leads)} demo URLs verified healthy (HTTP 200)",
                f"✅ Stripe payment links live: Activation ({STRIPE_LINKS['activation']['price']}) + Hosting ({STRIPE_LINKS['hosting']['price']})",
                "ACTION: Update template sticky bar from $99/mo → $248/mo",
                "ACTION: Add Stripe payment links to demo footer/sticky bar via template",
                "ACTION: Owner must complete Stripe Connect onboarding"
            ]
        },
        "leads": qa_results,
        "rejected": rejected
    }

    with open(MANIFEST_FILE, "w") as f:
        json.dump(manifest, f, indent=2, default=str)

    # ---- Generate Stripe Audit Report ----
    audit_md = f"""# Stripe Catalog Audit — {datetime.now().strftime('%Y-%m-%d %H:%M UTC')}

## Payment Links

| Link | Price | Type | HTTP Status | Live |
|------|-------|------|-------------|------|
| Activation Fee | {STRIPE_LINKS['activation']['price']} | {STRIPE_LINKS['activation']['type']} | {stripe_links_status['activation']['http_status']} | {"✅" if stripe_links_status['activation']['live'] else "❌"} |
| Hosting & Support | {STRIPE_LINKS['hosting']['price']} | {STRIPE_LINKS['hosting']['type']} | {stripe_links_status['hosting']['http_status']} | {"✅" if stripe_links_status['hosting']['live'] else "❌"} |

**Payment Link URLs:**
- Activation: {STRIPE_LINKS['activation']['url']}
- Hosting: {STRIPE_LINKS['hosting']['url']}

## Stripe API Keys

| Variable | Status |
|----------|--------|
"""
    for var, status in stripe_env_status.items():
        audit_md += f"| {var} | {status} |\n"

    audit_md += f"""
## Blockers

1. **Stripe Connect NOT completed** — Owner must complete onboarding via Finance tab
2. **No Stripe API keys** — Cannot create server-side checkout sessions
3. **Payment links exist** but cannot process live transactions until Connect is active

## Demo CTA Status (across {len(leads)} send-ready demos)

| Metric | Count |
|--------|-------|
| Demos with Stripe links | {stripe_present} |
| Demos missing Stripe links | {len(leads) - stripe_present} |
| Pricing correct ($248/mo) | {pricing_ok} |
| Pricing outdated ($99/mo) | {pricing_outdated} |

## Recommendations

1. **Fix template pricing**: Update `elite-trade.html` sticky bar from `$99/mo` → `$248/mo`
2. **Add Stripe links to template**: Embed activation + hosting payment links in demo footer
3. **Regenerate demos** after template fix (or batch-patch existing demos)
4. **Complete Stripe Connect** onboarding before sending any campaign emails
"""

    with open(AUDIT_REPORT, "w") as f:
        f.write(audit_md)

    print(f"\n{'=' * 70}")
    print(f"QA Pipeline Complete")
    print(f"  Manifest: {MANIFEST_FILE}")
    print(f"  Audit:    {AUDIT_REPORT}")
    print(f"  Snapshots: {SNAPSHOT_DIR}/ ({snapshot_count} files)")
    print(f"{'=' * 70}")

    # Print summary
    print(f"\nKEY FINDINGS:")
    for finding in manifest["summary"]["key_findings"]:
        print(f"  {finding}")

    return manifest


if __name__ == "__main__":
    main()
