#!/usr/bin/env node
/**
 * Lead Manifest Validator
 * Validates lead records against the append-only schema.
 * Preserves provenance, verification fields, and reports issues.
 *
 * Usage:
 *   node scripts/lead-infra/validate.js <manifest.json> [--strict]
 *
 * Required fields: business_name, phone, city, state, lead_id, source
 * Verification fields (preserved if present): website_http, phone_source,
 *   email_present, email_domain_mx, mailbox_validation
 */

const fs = require('fs');
const path = require('path');

// ── Config ──────────────────────────────────────────────
const REQUIRED = ['business_name', 'phone', 'city', 'state', 'lead_id', 'source'];
const VERIFICATION_FIELDS = [
  'website_http', 'phone_source', 'email_present',
  'email_domain_mx', 'mailbox_validation'
];
const OPTIONAL = [
  'industry', 'email', 'demo_url', 'notes', 'metadata',
  'first_seen_at', 'buyer_id', 'product_tier'
];
const VALID_SOURCES = ['polsia', 'instaweb', 'manual', 'caller'];
const VALID_STATES = new Set([
  'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA',
  'KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
  'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT',
  'VA','WA','WV','WI','WY','DC'
]);

// ── Helpers ─────────────────────────────────────────────
function normalizePhone(phone) {
  if (!phone) return '';
  const digits = phone.replace(/\D/g, '');
  if (digits.length < 10 || digits.length > 15) return '';
  if (digits.length === 10) return '+1' + digits;
  if (digits.length === 11 && digits[0] === '1') return '+' + digits;
  return '+' + digits;
}

function escapeStr(s) {
  return (s || '').replace(/'/g, "''");
}

// ── Validation ──────────────────────────────────────────
function validateRecord(record, index) {
  const issues = [];
  const warnings = [];

  // Required fields
  for (const field of REQUIRED) {
    if (!record[field] || !String(record[field]).trim()) {
      issues.push(`Row ${index}: Missing required field: ${field}`);
    }
  }

  // Phone validation
  if (record.phone) {
    const normalized = normalizePhone(record.phone);
    if (!normalized) {
      issues.push(`Row ${index}: Invalid phone: ${record.phone}`);
    }
    record._phone_normalized = normalized;
  }

  // State validation
  if (record.state && !VALID_STATES.has(String(record.state).toUpperCase().slice(0, 2))) {
    warnings.push(`Row ${index}: Unexpected state: ${record.state}`);
  }

  // Source validation
  if (record.source && !VALID_SOURCES.includes(record.source)) {
    warnings.push(`Row ${index}: Non-standard source: ${record.source}`);
  }

  // Lead ID format (SHA-256 hex = 64 chars)
  if (record.lead_id && !/^[a-f0-9]{64}$/.test(record.lead_id)) {
    warnings.push(`Row ${index}: lead_id is not a 64-char hex hash: ${record.lead_id}`);
  }

  // Verification fields: preserve if present, warn if missing
  const missingVerification = VERIFICATION_FIELDS.filter(f => !record[f]);
  if (missingVerification.length > 0) {
    warnings.push(`Row ${index}: Missing verification fields: ${missingVerification.join(', ')}`);
  }

  return { issues, warnings, valid: issues.length === 0 };
}

function validateManifest(records, strict) {
  const report = {
    total: records.length,
    valid: 0,
    invalid: 0,
    issues: [],
    warnings: [],
    verification_summary: {},
    source_counts: {},
    state_counts: {},
    sample_valid: null
  };

  for (let i = 0; i < records.length; i++) {
    const { issues, warnings, valid } = validateRecord(records[i], i);
    if (valid) {
      report.valid++;
      if (!report.sample_valid) report.sample_valid = records[i];
    } else {
      report.invalid++;
      report.issues.push(...issues);
    }
    report.warnings.push(...warnings);

    // Summaries
    const src = records[i].source || 'unknown';
    report.source_counts[src] = (report.source_counts[src] || 0) + 1;
    const st = records[i].state || 'unknown';
    report.state_counts[st] = (report.state_counts[st] || 0) + 1;

    // Verification field summary
    for (const vf of VERIFICATION_FIELDS) {
      if (!report.verification_summary[vf]) {
        report.verification_summary[vf] = { present: 0, missing: 0 };
      }
      if (records[i][vf]) {
        report.verification_summary[vf].present++;
      } else {
        report.verification_summary[vf].missing++;
      }
    }
  }

  return report;
}

// ── Main ────────────────────────────────────────────────
function main() {
  const args = process.argv.slice(2);
  const manifestPath = args[0];
  const strict = args.includes('--strict');

  if (!manifestPath) {
    console.error('Usage: node scripts/lead-infra/validate.js <manifest.json> [--strict]');
    process.exit(1);
  }

  if (!fs.existsSync(manifestPath)) {
    console.error(`File not found: ${manifestPath}`);
    process.exit(1);
  }

  const raw = fs.readFileSync(manifestPath, 'utf-8');
  let records;
  try {
    records = JSON.parse(raw);
  } catch (e) {
    console.error(`Invalid JSON: ${e.message}`);
    process.exit(1);
  }

  if (!Array.isArray(records)) {
    // Maybe wrapped in { leads: [...] }
    if (records.leads && Array.isArray(records.leads)) {
      records = records.leads;
    } else {
      console.error('Manifest must be a JSON array or { leads: [...] }');
      process.exit(1);
    }
  }

  const report = validateManifest(records, strict);

  console.log(JSON.stringify({
    status: report.invalid === 0 ? 'PASS' : 'FAIL',
    summary: {
      total: report.total,
      valid: report.valid,
      invalid: report.invalid,
      warnings: report.warnings.length
    },
    verification_coverage: report.verification_summary,
    source_distribution: report.source_counts,
    state_distribution: report.state_counts,
    sample_valid_record: report.sample_valid ? {
      business_name: report.sample_valid.business_name,
      city: report.sample_valid.city,
      state: report.sample_valid.state,
      verification_fields_present: VERIFICATION_FIELDS.filter(f => report.sample_valid[f])
    } : null,
    first_5_issues: report.issues.slice(0, 5),
    first_5_warnings: report.warnings.slice(0, 5)
  }, null, 2));

  process.exit(report.invalid > 0 && strict ? 1 : 0);
}

main();
