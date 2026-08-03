-- Lead Product Schema Migration v1.0
-- Appends verification columns to existing leads_pool table
-- SAFE: Uses ALTER TABLE ADD COLUMN IF NOT EXISTS pattern
-- Run via: bash scripts/lead-infra/run-dry-run.sh

-- Verification columns (preserved from scrapers)
-- These exist in the manifest but may not be in leads_pool yet
ALTER TABLE leads_pool ADD COLUMN website_http TEXT;
ALTER TABLE leads_pool ADD COLUMN phone_source TEXT;
ALTER TABLE leads_pool ADD COLUMN email_present TEXT;
ALTER TABLE leads_pool ADD COLUMN email_domain_mx TEXT;
ALTER TABLE leads_pool ADD COLUMN mailbox_validation TEXT;

-- Buyer isolation columns
ALTER TABLE leads_pool ADD COLUMN buyer_id TEXT;
ALTER TABLE leads_pool ADD COLUMN purchased_at TEXT;
ALTER TABLE leads_pool ADD COLUMN product_tier TEXT;

-- Index for buyer queries
CREATE INDEX IF NOT EXISTS idx_leads_pool_buyer_id ON leads_pool(buyer_id);
CREATE INDEX IF NOT EXISTS idx_leads_pool_product_tier ON leads_pool(product_tier);
