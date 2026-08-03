#!/usr/bin/env node
/**
 * Batch Lead Exporter
 * Exports leads from leads_pool in batches of 500.
 * Preserves all verification fields, provenance, and buyer info.
 *
 * Usage:
 *   node scripts/lead-infra/export-batch.js [--source=<src>] [--buyer=<id>] [--page=1] [--limit=500]
 */

const DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || '';
const API_URL = DB_URL.replace('libsql://', 'https://');

const VERIFICATION_FIELDS = [
  'website_http', 'phone_source', 'email_present',
  'email_domain_mx', 'mailbox_validation'
];

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

function escape(s) {
  return (s || '').replace(/'/g, "''");
}

async function exportBatch({ source, buyer, page = 1, limit = 500 }) {
  const conditions = [];
  if (source) conditions.push("source = '" + escape(source) + "'");
  if (buyer) conditions.push("buyer_id = '" + escape(buyer) + "'");

  const where = conditions.length > 0 ? ' WHERE ' + conditions.join(' AND ') : '';
  const offset = (page - 1) * limit;

  // Get total count
  const countResp = await dbQuery("SELECT COUNT(*) as total FROM leads_pool" + where);
  const total = val(countResp?.results?.[0]?.response?.result?.rows?.[0]?.[0]) || 0;

  // Fetch page
  const listResp = await dbQuery(
    "SELECT * FROM leads_pool" + where +
    " ORDER BY first_seen_at DESC LIMIT " + limit + " OFFSET " + offset
  );
  const rows = listResp?.results?.[0]?.response?.result?.rows || [];
  const cols = listResp?.results?.[0]?.response?.result?.cols || [];

  const leads = rows.map(row => {
    const obj = {};
    row.forEach((cell, i) => {
      obj[cols[i]?.name || 'col' + i] = val(cell, null);
    });
    return obj;
  });

  // Verification coverage stats for this batch
  const verificationStats = {};
  for (const vf of VERIFICATION_FIELDS) {
    const present = leads.filter(l => l[vf]).length;
    verificationStats[vf] = { present, total: leads.length, coverage: present / leads.length };
  }

  return {
    page,
    limit,
    offset,
    total,
    total_pages: Math.ceil(total / limit),
    returned: leads.length,
    verification_coverage: verificationStats,
    filters: { source: source || null, buyer: buyer || null },
    leads
  };
}

async function main() {
  const args = process.argv.slice(2);
  const source = args.find(a => a.startsWith('--source='))?.split('=')[1] || '';
  const buyer = args.find(a => a.startsWith('--buyer='))?.split('=')[1] || '';
  const page = parseInt(args.find(a => a.startsWith('--page='))?.split('=')[1] || '1');
  const limit = parseInt(args.find(a => a.startsWith('--limit='))?.split('=')[1] || '500');

  console.error(`Exporting: source=${source || 'all'}, buyer=${buyer || 'all'}, page=${page}, limit=${limit}`);

  const result = await exportBatch({ source, buyer, page, limit });

  console.log(JSON.stringify(result, null, 2));
}

main().catch(e => {
  console.error('Fatal error:', e.message);
  process.exit(1);
});
