#!/usr/bin/env node
/**
 * Append-Only Lead Importer
 * Imports leads into leads_pool with strict append-only semantics.
 * Never overwrites existing records. Supports dry-run mode.
 *
 * Usage:
 *   node scripts/lead-infra/import.js <manifest.json> [--dry-run] [--batch-size=500]
 *
 * SAFETY: In dry-run mode, outputs exactly what WOULD happen without
 * touching the database. No production writes unless --dry-run is absent.
 */

const fs = require('fs');

// ── Config ──────────────────────────────────────────────
const DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || '';
const API_URL = DB_URL.replace('libsql://', 'https://');
const BATCH_SIZE = 500;

const VERIFICATION_FIELDS = [
  'website_http', 'phone_source', 'email_present',
  'email_domain_mx', 'mailbox_validation'
];
const BUYER_FIELDS = ['buyer_id', 'product_tier'];

// ── Helpers ─────────────────────────────────────────────
function escape(s) {
  return (s || '').replace(/'/g, "''");
}

async function dbQuery(sql) {
  const resp = await fetch(API_URL + '/v2/pipeline', {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer ' + DB_TOKEN,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      requests: [{ type: 'execute', stmt: { sql } }]
    })
  });
  return await resp.json();
}

function val(cell, fallback = null) {
  if (cell && typeof cell === 'object' && cell.value !== undefined) {
    const v = cell.value;
    if (cell.type === 'integer') return Number(v);
    return v;
  }
  return cell ?? fallback;
}

// ── Import Logic ────────────────────────────────────────
async function checkDuplicate(leadId, phone) {
  // Check by lead_id
  const idResp = await dbQuery(
    "SELECT lead_id, business_name, source FROM leads_pool WHERE lead_id = '" + escape(leadId) + "'"
  );
  const idRows = idResp?.results?.[0]?.response?.result?.rows || [];
  if (idRows.length > 0) {
    return { exists: true, reason: 'duplicate_lead_id', existing: idRows[0] };
  }

  // Check by phone (potential conflict)
  if (phone) {
    const phoneResp = await dbQuery(
      "SELECT lead_id, business_name, phone FROM leads_pool WHERE phone = '" + escape(phone) + "'"
    );
    const phoneRows = phoneResp?.results?.[0]?.response?.result?.rows || [];
    if (phoneRows.length > 0) {
      return { exists: true, reason: 'duplicate_phone', existing: phoneRows[0] };
    }
  }

  return { exists: false };
}

function buildInsertSQL(record, now) {
  const fields = [
    'lead_id', 'business_name', 'phone', 'city', 'state',
    'industry', 'email', 'demo_url', 'source', 'notes', 'metadata',
    'first_seen_at', 'last_updated_at',
    ...VERIFICATION_FIELDS,
    ...BUYER_FIELDS
  ];

  const values = fields.map(f => {
    if (f === 'first_seen_at') return escape(record.first_seen_at || now);
    if (f === 'last_updated_at') return escape(now);
    if (f === 'metadata' && typeof record.metadata === 'object') {
      return escape(JSON.stringify(record.metadata));
    }
    return escape(record[f] || '');
  });

  return "INSERT INTO leads_pool (" + fields.join(', ') + ") VALUES ('" + values.join("', '") + "')";
}

async function importBatch(records, dryRun, now) {
  const report = {
    dry_run: dryRun,
    total: records.length,
    inserted: 0,
    skipped_duplicates: 0,
    skipped_validation: 0,
    errors: 0,
    details: [],
    inserted_ids: []
  };

  for (let i = 0; i < records.length; i++) {
    const record = records[i];
    const leadId = record.lead_id;
    const phone = record._phone_normalized || record.phone;

    if (!leadId) {
      report.skipped_validation++;
      report.details.push({ row: i, status: 'skipped', reason: 'Missing lead_id' });
      continue;
    }

    if (dryRun) {
      // Dry-run: check but don't insert
      const dup = await checkDuplicate(leadId, phone);
      if (dup.exists) {
        report.skipped_duplicates++;
        report.details.push({
          row: i,
          status: 'would_skip',
          reason: dup.reason,
          business_name: record.business_name
        });
      } else {
        report.inserted++;
        report.inserted_ids.push(leadId);
        report.details.push({
          row: i,
          status: 'would_insert',
          business_name: record.business_name,
          city: record.city,
          state: record.state,
          verification_present: VERIFICATION_FIELDS.filter(f => record[f])
        });
      }
    } else {
      // Real mode: check then insert
      try {
        const dup = await checkDuplicate(leadId, phone);
        if (dup.exists) {
          report.skipped_duplicates++;
          report.details.push({
            row: i,
            status: 'skipped',
            reason: dup.reason,
            business_name: record.business_name
          });
          continue;
        }

        const sql = buildInsertSQL(record, now);
        const result = await dbQuery(sql);
        const err = result?.results?.[0];

        if (err?.type === 'error') {
          report.errors++;
          report.details.push({
            row: i,
            status: 'error',
            error: err.error?.message || 'Unknown error',
            business_name: record.business_name
          });
        } else {
          report.inserted++;
          report.inserted_ids.push(leadId);
          report.details.push({
            row: i,
            status: 'inserted',
            business_name: record.business_name,
            city: record.city,
            state: record.state
          });
        }
      } catch (e) {
        report.errors++;
        report.details.push({
          row: i,
          status: 'error',
          error: e.message,
          business_name: record.business_name
        });
      }
    }
  }

  return report;
}

// ── Main ────────────────────────────────────────────────
async function main() {
  const args = process.argv.slice(2);
  const manifestPath = args.find(a => !a.startsWith('--'));
  const dryRun = args.includes('--dry-run');

  if (!manifestPath) {
    console.error('Usage: node scripts/lead-infra/import.js <manifest.json> [--dry-run]');
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
    if (records.leads && Array.isArray(records.leads)) {
      records = records.leads;
    } else {
      console.error('Manifest must be a JSON array or { leads: [...] }');
      process.exit(1);
    }
  }

  const now = new Date().toISOString();
  const mode = dryRun ? 'DRY RUN' : 'LIVE IMPORT';
  console.error(`\n=== ${mode} ===`);
  console.error(`Manifest: ${manifestPath}`);
  console.error(`Records: ${records.length}`);
  console.error(`Database: ${DB_URL}`);
  console.error('');

  // Process in batches
  let fullReport = {
    dry_run: dryRun,
    total: records.length,
    inserted: 0,
    skipped_duplicates: 0,
    skipped_validation: 0,
    errors: 0,
    batches: [],
    inserted_ids: []
  };

  for (let offset = 0; offset < records.length; offset += BATCH_SIZE) {
    const batch = records.slice(offset, offset + BATCH_SIZE);
    const batchNum = Math.floor(offset / BATCH_SIZE) + 1;
    console.error(`Processing batch ${batchNum} (${batch.length} records)...`);

    const batchReport = await importBatch(batch, dryRun, now);
    fullReport.inserted += batchReport.inserted;
    fullReport.skipped_duplicates += batchReport.skipped_duplicates;
    fullReport.skipped_validation += batchReport.skipped_validation;
    fullReport.errors += batchReport.errors;
    fullReport.inserted_ids.push(...batchReport.inserted_ids);
    fullReport.batches.push({
      batch: batchNum,
      offset,
      count: batch.length,
      inserted: batchReport.inserted,
      skipped: batchReport.skipped_duplicates,
      errors: batchReport.errors
    });
  }

  // Summary
  console.error(`\n=== ${mode} COMPLETE ===`);
  console.error(`Total: ${fullReport.total}`);
  console.error(`Would Insert: ${fullReport.inserted}`);
  console.error(`Skipped (duplicates): ${fullReport.skipped_duplicates}`);
  console.error(`Skipped (validation): ${fullReport.skipped_validation}`);
  console.error(`Errors: ${fullReport.errors}`);

  if (dryRun) {
    console.error('\n⚠️  DRY RUN — no records were actually imported.');
    console.error('Remove --dry-run to perform the actual import.');
  }

  console.log(JSON.stringify(fullReport, null, 2));
}

main().catch(e => {
  console.error('Fatal error:', e.message);
  process.exit(1);
});
