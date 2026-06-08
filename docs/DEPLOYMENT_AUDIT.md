# Instaweb — Deployment & Domain Status Audit

**Audit Date:** 2026-06-08
**Auditor:** agent-ops-optimizer
**Task ID:** 08645917-b297-4f2e-a739-bcaa659285e6

---

## 1. Current Architecture Overview

```
┌─────────────────────┐     ┌─────────────────────────────┐
│  instaweb.agency    │────→│  GoDaddy Domain Parking     │
│  (CUSTOM DOMAIN)    │     │  (DPS/2.0 — NOT Vercel)     │
└─────────────────────┘     └─────────────────────────────┘

┌─────────────────────┐     ┌─────────────────────────────┐
│  instaweb-brand     │────→│  NOT DEPLOYED               │
│  (Vercel Project)   │     │  (HTTP 404 DEPLOYMENT_NOT_FOUND)
└─────────────────────┘     └─────────────────────────────┘

┌─────────────────────┐     ┌─────────────────────────────┐
│  instaweb-demo-sites│────→│  Vercel — LIVE ✅          │
│  (Vercel Project)   │     │  HTTP 200, 1MB content     │
└─────────────────────┘     └─────────────────────────────┘
```

## 2. DNS Status — `instaweb.agency`

| Record | Value | Status |
|--------|-------|--------|
| A | `13.248.243.5` | ❌ GoDaddy Parking / AWS |
| A | `76.223.105.230` | ❌ GoDaddy Parking / AWS |
| CNAME | Not configured | ❌ Missing |

**Required DNS changes to point to Vercel:**
- Remove current A records
- Add CNAME record: `instaweb.agency` → `cname.vercel-dns.com`
- Or add A records pointing to Vercel's IPs: `76.76.21.21` / `76.76.21.123`

## 3. Vercel Projects

### Project 1: `instaweb-demo-sites` ✅ LIVE
- **URL:** https://instaweb-demo-sites.vercel.app/
- **Status:** ✅ HTTP 200 — Serving content (1,086,474 bytes)
- **Server:** Vercel (edge caching HIT)
- **Content:** Demo site index page
- **Config:** `vercel.json` with `cleanUrls: true`
- **Individual demo pages:** ❌ Returns 404 — files may need correct routing or deployment path

### Project 2: `instaweb-brand` ❌ NOT DEPLOYED
- **URL:** https://instaweb-brand.vercel.app/
- **Status:** ❌ HTTP 404 — `DEPLOYMENT_NOT_FOUND`
- **Local files:** Present at `/home/team/shared/instaweb-brand-site/`
  - `index.html` (71,073 bytes)
  - `package.json` with name "instaweb-brand"
  - `vercel.json` configured for static HTML
  - `BRAND_GUIDELINES.md`
  - Assets: `instaweb-og-image.png`, `preview-hero.png`
- **Action needed:** Deploy to Vercel via CLI or Vercel dashboard

## 4. Domain Configuration

| Domain | HTTPS | Serving | Notes |
|--------|-------|---------|-------|
| `instaweb.agency` | ✅ 200 | GoDaddy Parking | ❌ Needs to point to Vercel |
| `www.instaweb.agency` | ⚠️ | No response | ❌ Not configured |
| `instaweb-demo-sites.vercel.app` | ✅ 200 | Vercel ✅ Live | Working demo site deployment |
| `instaweb-brand.vercel.app` | ❌ 404 | Not deployed | ❌ Needs deployment |
| Individual demo pages | ❌ 404 | Vercel | ❌ Routing issue |

## 5. Recommendations

1. **Deploy brand site:** Run `vercel --prod` from `/home/team/shared/instaweb-brand-site/`
2. **Fix demo routing:** Ensure `vercel.json` in the demo output has proper rewrites for SPA-style routing
3. **Configure `instaweb.agency` DNS:**
   - Option A: Add CNAME `instaweb.agency` → `cname.vercel-dns.com`
   - Option B: Add A records to Vercel IPs: `76.76.21.21`, `76.76.21.123`
   - Wait for DNS propagation (5-30 min for TTL)
4. **Add `www.instaweb.agency`** as a redirect or separate CNAME
5. **Link custom domain** in Vercel project settings after DNS changes

## 6. Quick Reference

```bash
# Deploy brand site to Vercel
cd /home/team/shared/instaweb-brand-site
npx vercel --prod

# Deploy demo engine output
cd /home/team/shared/instaweb-demo-engine/output
npx vercel --prod

# DNS check
nslookup instaweb.agency
dig instaweb.agency CNAME
```