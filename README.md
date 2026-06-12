# Instaweb Agency — Mirror Repository

**Business:** Premium website development for service-based businesses (HVAC, Roofing, Restaurants)
**Website:** https://www.instaweb.agency
**Outreach:** info@instaweb.agency
**Pricing:** $399 setup + $248/mo recurring
**Target Markets:** Texas, Arizona, New York

## Repository Structure

```
├── BUSINESS PLAN.md      # Full business plan & strategy
├── LICENSE.md
├── README.md             # This file
├── configs/              # Team configuration files
│   └── mirror-config.sh  # Mirroring sync configuration
├── data/
│   ├── leads/            # Raw scraped leads (CSV/JSON)
│   ├── enriched/         # Enriched leads with contact info
│   └── demos/            # Generated demo websites (zip/html)
├── docs/
│   ├── MIRRORING-PROTOCOL.md    # Mirroring compliance protocol
│   └── RECOVERY-AUDIT.md        # Sandbox audit & recovery report
├── scripts/
│   ├── mirror-sync.sh    # Automated mirror sync script
│   └── monitor-mirror.sh # Mirroring compliance monitor
└── templates/
    ├── modern-trade/     # "Modern Trade" (HVAC/Roofing) templates
    └── elegant-food/     # "Elegant Food" (Restaurants) templates
```

## Mirroring Rule

**ALL** files, scripts, templates, lead data, and demo assets produced by any team member MUST be mirrored to this GitHub repository immediately upon creation or update. This ensures business continuity and a single source of truth.

See [docs/MIRRORING-PROTOCOL.md](docs/MIRRORING-PROTOCOL.md) for the full protocol.

## Branches

- `agency-os` — Main branch for all mirrored assets