# Stripe Catalog Audit — 2026-07-31 21:26 UTC

## Payment Links
| Link | Price | Type | HTTP | Live |
|------|-------|------|------|------|
| Activation Fee | $399 | one-time | 200 | ✅ |
| Hosting & Support | $248/mo | recurring | 200 | ✅ |

**URLs:**
- Activation: https://buy.stripe.com/aFa28rbMm5129pa3P5djO0a
- Hosting: https://buy.stripe.com/14A28r17I65644QgBRdjO0b

## Stripe API Keys
- STRIPE_SECRET_KEY: NOT SET
- STRIPE_PUBLISHABLE_KEY: NOT SET

## Blockers
1. **Stripe Connect NOT completed** — Owner must onboard via Finance tab
2. **No Stripe API keys** — Cannot create server-side checkout sessions
3. **Payment links exist** but cannot process live transactions

## Demo CTA Status (55 send-ready demos)
| Metric | Count |
|--------|-------|
| Demos with Stripe links | 0 |
| Demos missing Stripe | 55 |
| Pricing correct ($248/mo) | 0 |
| Pricing outdated ($99/mo) | 48 |

## Recommendations
1. **Fix template pricing**: Update sticky bar $99/mo → $248/mo
2. **Add Stripe links to template**: Embed activation + hosting links in footer
3. **Regenerate demos** after template update
4. **Complete Stripe Connect** before sending campaign emails
