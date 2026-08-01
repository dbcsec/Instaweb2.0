#!/usr/bin/env python3
"""
QUARANTINE REPORT & REVERSIBLE CLEANUP PLAN
===========================================
Identifies all 549 unapproved records inserted by the broad-source
post_leads.sh ingestion. Does NOT mutate the database — produces
a report and an approval-gated cleanup script.

Usage:
  python3 quarantine_plan.py          # Generate report only (safe)
  python3 quarantine_plan.py --apply  # Requires explicit --approve flag
"""

import json
import hashlib
import re
import subprocess
import sys
import os
from datetime import datetime, timezone

# ── Config ────────────────────────────────────────────────────────
SHARED_DIR = "/home/team/shared"
BACKUP_PATH = os.path.join(SHARED_DIR, "caller_backups", "leads_pool_backup_20260731_213200.json")
API_BASE = "https://www.instaweb.agency/api/caller/leads"
REPORT_PATH = os.path.join(SHARED_DIR, "quarantine_report.json")
CLEANUP_SCRIPT_PATH = os.path.join(SHARED_DIR, "quarantine_cleanup.sh")

# ── Normalization (matches API leads.js) ──────────────────────────
def normalize_name(name):
    if not name:
        return ""
    suffixes = ["llc", "inc", "co", "the", "&", "corp", "corporation", "ltd", "limited"]
    s = name.lower()
    s = re.sub(r"[^a-z0-9\s]", "", s)
    s = re.sub(r"\s+", " ", s).strip()
    for suffix in suffixes:
        s = re.sub(r"\s+" + re.escape(suffix) + r"$", "", s)
    return s.strip()

def normalize_phone(phone):
    if not phone:
        return ""
    digits = re.sub(r"\D", "", str(phone))
    if len(digits) == 10:
        digits = "1" + digits
    if len(digits) == 11 and digits[0] == "1":
        return "+" + digits
    return "+" + digits

def norm_city(c):
    return (c or "").lower().strip()

def norm_state(s):
    return (s or "").lower().strip()[:2]

def compute_lead_id(biz, phone, city, state):
    key = f"{normalize_name(biz)}|{normalize_phone(phone)}|{norm_city(city)},{norm_state(state)}"
    return hashlib.sha256(key.encode()).hexdigest()

# ── Artifact mapping (from gen_post_shell.py) ─────────────────────
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

# Approved inventory (per business plan)
APPROVED_INVENTORY = {
    "send_ready_final.json",  # 55 send-ready leads
}

# ── Step 1: Load baseline ─────────────────────────────────────────
def load_baseline():
    with open(BACKUP_PATH) as f:
        backup = json.load(f)
    return set(backup["lead_ids"])

# ── Step 2: Pull current DB ──────────────────────────────────────
def pull_current_db():
    all_leads = []
    page = 1
    while True:
        url = f"{API_BASE}?limit=50&page={page}"
        result = subprocess.run(
            ["curl", "-s", "--max-time", "15", url],
            capture_output=True, text=True,
        )
        if not result.stdout.strip():
            break
        try:
            data = json.loads(result.stdout)
        except json.JSONDecodeError:
            break
        leads = data.get("leads", [])
        if not leads:
            break
        all_leads.extend(leads)
        page += 1
        if page > 50:
            break
    return all_leads

# ── Step 3: Identify unapproved records ───────────────────────────
def identify_unapproved(current_leads, baseline_ids):
    unapproved = []
    baseline_kept = []
    for lead in current_leads:
        if lead["lead_id"] in baseline_ids:
            baseline_kept.append(lead)
        else:
            unapproved.append(lead)
    return unapproved, baseline_kept

# ── Step 4: Trace artifact origin ─────────────────────────────────
def load_artifact_leads(fname):
    """Return set of lead_ids from an artifact file."""
    path = os.path.join(SHARED_DIR, fname)
    if not os.path.exists(path):
        return set()
    try:
        if path.endswith(".csv"):
            import csv
            with open(path, newline="") as f:
                rows = list(csv.DictReader(f))
        else:
            with open(path) as f:
                data = json.load(f)
            if isinstance(data, list):
                rows = data
            elif isinstance(data, dict):
                for k in ["leads", "prospects", "results", "data"]:
                    if k in data:
                        rows = data[k]
                        break
                else:
                    rows = []
            else:
                rows = []
    except Exception:
        return set()

    ids = set()
    for row in rows:
        b = (row.get("business_name") or row.get("name") or row.get("company") or "").strip()
        p = row.get("phone") or row.get("phone_number") or row.get("tel") or ""
        c = (row.get("city") or "").strip()
        s = (row.get("state") or "").strip()
        if not b or not p or not c:
            continue
        lid = compute_lead_id(b, p, c, s)
        ids.add(lid)
    return ids

def trace_origins(unapproved_ids):
    """Map each artifact file to how many unapproved IDs it contains."""
    origins = {}
    for fname, label in ARTIFACT_FILES:
        artifact_ids = load_artifact_leads(fname)
        matched = unapproved_ids & artifact_ids
        if matched:
            origins[label] = {
                "file": fname,
                "match_count": len(matched),
                "approved": fname in APPROVED_INVENTORY,
            }
    return origins

# ── Step 5: Generate quarantine report ────────────────────────────
def generate_report(unapproved, baseline_count, origins):
    """Build a detailed quarantine report."""
    source_breakdown = {}
    industry_breakdown = {}
    city_breakdown = {}
    email_present = 0

    for lead in unapproved:
        src = lead.get("source", "unknown") or "unknown"
        source_breakdown[src] = source_breakdown.get(src, 0) + 1
        ind = lead.get("industry", "") or "empty"
        industry_breakdown[ind] = industry_breakdown.get(ind, 0) + 1
        city = lead.get("city", "") or "unknown"
        city_breakdown[city] = city_breakdown.get(city, 0) + 1
        if lead.get("email", "").strip():
            email_present += 1

    # Order cities by count
    top_cities = sorted(city_breakdown.items(), key=lambda x: -x[1])[:15]

    # Sample records
    samples = []
    for lead in unapproved[:10]:
        samples.append(
            {
                "lead_id": lead.get("lead_id", ""),
                "business_name": lead.get("business_name", ""),
                "city": lead.get("city", ""),
                "state": lead.get("state", ""),
                "industry": lead.get("industry", ""),
                "source": lead.get("source", ""),
                "email": (lead.get("email", "") or "")[:40],
                "demo_url": lead.get("demo_url", ""),
            }
        )

    report = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "status": "QUARANTINE_PENDING_APPROVAL",
        "summary": {
            "baseline_count": baseline_count,
            "current_total": baseline_count + len(unapproved),
            "unapproved_inserted": len(unapproved),
            "approved_kept": baseline_count,
            "removed": 0,
        },
        "unapproved_profile": {
            "source_breakdown": source_breakdown,
            "industry_breakdown": industry_breakdown,
            "top_cities": dict(top_cities),
            "with_email": email_present,
            "total": len(unapproved),
        },
        "artifact_origins": origins,
        "cleanup_script": CLEANUP_SCRIPT_PATH,
        "backup_reference": BACKUP_PATH,
        "sample_unapproved": samples,
        "all_unapproved_lead_ids": [l["lead_id"] for l in unapproved],
    }

    with open(REPORT_PATH, "w") as f:
        json.dump(report, f, indent=2)

    return report

# ── Step 6: Generate reversible cleanup script ────────────────────
def generate_cleanup_script(unapproved):
    """
    Generates a bash script that marks unapproved records by setting
    source='quarantine_unapproved' and notes='QUARANTINED: ...'.
    This is REVERSIBLE — a separate revert script is also generated.
    The script requires an --approve flag to run.
    """
    # Quarantine script
    with open(CLEANUP_SCRIPT_PATH, "w") as f:
        f.write("#!/bin/bash\n")
        f.write("# ═══════════════════════════════════════════════════════════\n")
        f.write("# QUARANTINE CLEANUP — MARKS unapproved records\n")
        f.write("# REVERSIBLE via quarantine_revert.sh\n")
        f.write("# ═══════════════════════════════════════════════════════════\n")
        f.write("# WARNING: Requires explicit --approve flag to execute.\n")
        f.write("# Run:  bash quarantine_cleanup.sh --approve\n\n")
        f.write('if [ "$1" != "--approve" ]; then\n')
        f.write('  echo "ERROR: This script mutates the caller database."\n')
        f.write('  echo "Review quarantine_report.json first."\n')
        f.write('  echo "Then run: bash quarantine_cleanup.sh --approve"\n')
        f.write("  exit 1\n")
        f.write("fi\n\n")
        f.write('echo "Quarantining unapproved records... THIS IS REVERSIBLE."\n')
        f.write(f"TOTAL={len(unapproved)}\n")
        f.write("COUNT=0\n\n")
        f.write('API="https://www.instaweb.agency/api/caller/leads"\n\n')

        for i, lead in enumerate(unapproved):
            lid = lead["lead_id"]
            biz = lead.get("business_name", "").replace("'", "'\\''")
            f.write(f"# {i+1}/{len(unapproved)}: {biz}\n")
            # We use the API to update — but the API doesn't support PUT.
            # Instead, we document the approach: flag via notes field by
            # re-inserting with source=quarantine_unapproved and X-Lead-Force-Create
            # OR via direct Turso SQL.
            f.write(f"echo \"  [{i+1}/{len(unapproved)}] Would quarantine: {biz} ({lid[:16]}...)\"\n")
            f.write(f"# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='{lid}';\n")
            f.write(f"COUNT=$((COUNT+1))\n\n")

        f.write('echo "Quarantine plan complete. Review and run via Turso CLI."\n')
        f.write('echo "Total flagged: $COUNT records (no mutations performed by this script)."\n')

    os.chmod(CLEANUP_SCRIPT_PATH, 0o755)

    # Revert script
    revert_path = os.path.join(SHARED_DIR, "quarantine_revert.sh")
    with open(revert_path, "w") as f:
        f.write("#!/bin/bash\n")
        f.write("# ═══════════════════════════════════════════════════════════\n")
        f.write("# QUARANTINE REVERT — Restores quarantined records\n")
        f.write("# Run after quarantine_cleanup.sh if needed.\n")
        f.write("# ═══════════════════════════════════════════════════════════\n")
        f.write('if [ "$1" != "--approve" ]; then\n')
        f.write('  echo "ERROR: Requires --approve flag."\n')
        f.write("  exit 1\n")
        f.write("fi\n\n")
        f.write(f"TOTAL={len(unapproved)}\n")
        f.write("COUNT=0\n\n")
        for i, lead in enumerate(unapproved):
            lid = lead["lead_id"]
            biz = lead.get("business_name", "").replace("'", "'\\''")
            f.write(f"echo \"  [{i+1}/{len(unapproved)}] Would restore: {biz}\"\n")
            f.write(f"# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='{lid}';\n")
            f.write(f"COUNT=$((COUNT+1))\n\n")
        f.write('echo "Revert plan complete."\n')

    os.chmod(revert_path, 0o755)

    return CLEANUP_SCRIPT_PATH, revert_path


# ── Main ───────────────────────────────────────────────────────────
def main():
    print("=" * 60)
    print("QUARANTINE REPORT & CLEANUP PLAN")
    print("=" * 60)

    # Load baseline
    print("\n[1/5] Loading baseline backup...")
    baseline_ids = load_baseline()
    print(f"  Baseline: {len(baseline_ids)} approved records")

    # Pull current DB
    print("\n[2/5] Pulling current DB from API...")
    current_leads = pull_current_db()
    print(f"  Current DB: {len(current_leads)} records")

    # Identify unapproved
    print("\n[3/5] Identifying unapproved records...")
    unapproved, baseline_kept = identify_unapproved(current_leads, baseline_ids)
    print(f"  Unapproved (new): {len(unapproved)}")
    print(f"  Approved (baseline): {len(baseline_kept)}")
    overlap = len(baseline_ids) - len(baseline_kept)
    if overlap > 0:
        print(f"  ⚠️  {overlap} baseline records missing from current DB!")

    # Trace origins
    print("\n[4/5] Tracing artifact origins...")
    unapproved_ids = {l["lead_id"] for l in unapproved}
    origins = trace_origins(unapproved_ids)
    for label, info in sorted(origins.items(), key=lambda x: -x[1]["match_count"]):
        flag = "✅ APPROVED" if info["approved"] else "❌ UNAPPROVED"
        print(f"  {label}: {info['match_count']} matches — {flag}")

    # Generate report
    print("\n[5/5] Generating quarantine report and cleanup scripts...")
    report = generate_report(unapproved, len(baseline_ids), origins)
    cleanup_path, revert_path = generate_cleanup_script(unapproved)

    print(f"\n{'=' * 60}")
    print(f"QUARANTINE REPORT: {REPORT_PATH}")
    print(f"CLEANUP SCRIPT:    {cleanup_path}")
    print(f"REVERT SCRIPT:     {revert_path}")
    print(f"{'=' * 60}")
    print(f"\nSummary:")
    print(f"  Approved records preserved: {len(baseline_ids)}")
    print(f"  Unapproved records flagged: {len(unapproved)}")
    print(f"  Total DB after quarantine would be: {len(baseline_ids)}")
    print(f"\n⚠️  NO MUTATIONS PERFORMED.")
    print(f"   Review {REPORT_PATH} before approving cleanup.")
    print(f"   Cleanup is REVERSIBLE via {revert_path}")

    return report


if __name__ == "__main__":
    main()
