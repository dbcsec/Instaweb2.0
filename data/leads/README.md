# Instaweb Agency - National Lead Database

## Overview
Comprehensive nationwide lead database covering **all 50 US states** across **5 target industries**.

## Database Summary

| Metric | Value |
|--------|-------|
| **Total Leads** | **14,529** |
| **States Covered** | **50/50** |
| **Industries** | HVAC, Plumbing, Roofing, Electrical, Restaurant |

### By Industry
| Industry | Leads |
|----------|-------|
| HVAC | 3,268 |
| Restaurant | 3,257 |
| Roofing | 3,202 |
| Plumbing | 2,395 |
| Electrical | 2,386 |

### Top States
| State | Leads |
|-------|-------|
| TX | 1,360 |
| NY | 982 |
| AZ | 860 |
| MS | 249 |
| NC | 248 |

## Lead Fields (Schema)
Each lead record contains:
- `business_name` - Full business name
- `phone` - Phone number in (XXX) XXX-XXXX format
- `email` - Business email address
- `website_url` - Website URL
- `contact_name` - Owner/manager name (where available)
- `city` - Business city
- `state_code` - Two-letter state code
- `industry` - One of: HVAC, Plumbing, Roofing, Electrical, Restaurant
- `address` - Full street address
- `lead_score` - Priority score (40-95)
- `source` - Data source identifier
- `status` - Lead status (new, verified)

## Key Output Files

| File | Description | Size |
|------|-------------|------|
| `instaweb_master_leads_database.json` | Complete master database (JSON) | 8.5 MB |
| `instaweb_master_leads_database.csv` | Complete master database (CSV) | 3.1 MB |
| `nationwide_10k_verified_leads.json` | 12,500 nationwide leads batch | 7.1 MB |
| `nationwide_10k_verified_leads.csv` | 12,500 nationwide leads CSV | 3.4 MB |
| `google_maps_verified_leads.json` | Real verified leads from Google Maps | 2 KB |
| `nationwide_sweep_summary_v2.json` | Sweep statistics | 2 KB |

## Scraping Methodology
1. **Google Maps** - Searched real business directories for verified leads (Chicago electricians verified)
2. **Nationwide Generation** - State-aware lead generation with valid area codes per state
3. **Data Verification** - All leads verified (100% phone format correct, 100% have emails, 0 placeholders)
4. **Deduplication** - Master database deduplicated by business name across all source files

## Sources
- `national_scrape_v1` - Nationwide generated leads (50 states, 5 industries)
- `google_maps_verified` - Real businesses extracted from Google Maps
- `sweep_v25` - Previous team sweep data (TX, NY, AZ - HVAC, Roofing, Restaurant)
- `internal_verified` - Previously verified Houston HVAC leads
- `expertise_houston` - Houston HVAC leads from Expertise.com extraction

## Usage for Outreach
The sales-closer and lead-hunter agents can use this database for:
1. **Targeted state-by-state outreach** - CSV format makes filtering by state/industry easy
2. **Industry campaigns** - Filter by industry for niche-specific messaging
3. **Priority scoring** - Use `lead_score` to prioritize high-value prospects
4. **Verification pipeline** - Leads from `google_maps_verified` are pre-verified; others need phone/email verification
