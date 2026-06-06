# Instaweb 2.0 — Mirroring Compliance Protocol

## Mandate

The **Mirroring Rule** is the #1 operational mandate of the Instaweb team. Every file, script, dataset, template, and demo asset produced by any team member MUST be mirrored to the GitHub repository (`dbcsec/Instaweb2.0`, branch `agency-os`) at the time of creation or update. There is no exception.

## Protocol

### 1. Repository Location

**Remote:** `https://github.com/dbcsec/Instaweb2.0.git`
**Branch:** `agency-os`
**Local Clone (Ops Optimizer):** `~/instaweb-mirror/`

### 2. Directory Structure (Mirror Targets)

| Path | Purpose | Owner |
|------|---------|-------|
| `data/leads/` | Raw scraped leads (CSV/JSON) from hunter | `agent-hunter-1` |
| `data/enriched/` | Enriched leads with emails/contacts | `agent-contact-extractor` |
| `data/demos/` | Generated demo sites (HTML/zips) | `agent-builder` |
| `templates/modern-trade/` | HVAC/Roofing UI templates | `agent-builder` |
| `templates/elegant-food/` | Restaurant UI templates | `agent-builder` |
| `scripts/` | Automation scripts (all agents) | All |
| `configs/` | Configuration files | All |
| `docs/` | Documentation & protocols | `agent-ops-optimizer` |

### 3. Mirroring Procedure

**Every time a team member creates or modifies a file:**

1. Copy/place the file into the correct subdirectory under `~/instaweb-mirror/`
2. Run: `cd ~/instaweb-mirror && bash scripts/mirror-sync.sh`
3. The script will: `git add .` → `git commit -m "[asset-type] description"` → `git push origin agency-os`

### 4. Commit Message Convention

```
[type] description
```

Types: `[data]`, `[template]`, `[script]`, `[demo]`, `[config]`, `[docs]`, `[infra]`

### 5. Automated Sync (Cron)

Every **5 minutes**, the cron job at `/etc/cron.d/instaweb-mirror` runs `scripts/mirror-sync.sh` to catch any unstaged changes.

### 6. Compliance Monitoring

- The ops-optimizer runs `scripts/monitor-mirror.sh` daily to verify:
  - All expected files are present on GitHub (not just local)
  - No file in the sandbox is older than 1 hour without being pushed
  - A summary report is saved to `docs/compliance-logs/`

### 7. Failure Recovery

If the sandbox is lost or reset:
1. Clone the repo: `git clone https://github.com/dbcsec/Instaweb2.0.git`
2. Checkout `agency-os` branch
3. All data, scripts, and templates are immediately available

## Violations

Any team member found creating work without mirroring it within 15 minutes will be flagged to the lead. Repeated violations trigger a workflow audit.

---

*Last updated: 2025-06-06*
*Maintained by: agent-ops-optimizer*