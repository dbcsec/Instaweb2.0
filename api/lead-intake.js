// POST /api/lead-intake/validate — Validate batch of leads
// POST /api/lead-intake/import — Import approved leads

const DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODEyMDMxMDcsImlkIjoiMDE5ZWI3ZmEtN2UwMS03NDg4LWEyODctMjIzOWNkMWQxZWU0IiwicmlkIjoiY2Q5MDIyYTItMmFmMS00NmY0LWIyYTUtZDc1ODQxNTk0YTI0In0.I74NzuKD7PUSeNbJjA9b8jbZhUywKjbM4QIl0oDFCMs6rLtfToT7Cj25LGXh2zsw2759tLL5mPRsr4GsyOpYBQ';
const apiUrl = DB_URL.replace('libsql://', 'https://');

function val(cell, fallback) {
  if (cell && typeof cell === 'object' && cell.value !== undefined) {
    return cell.value;
  }
  return cell ?? fallback ?? null;
}

async function dbQuery(sql) {
  const resp = await fetch(apiUrl + '/v2/pipeline', {
    method: 'POST',
    headers: { 'Authorization': 'Bearer ' + DB_TOKEN, 'Content-Type': 'application/json' },
    body: JSON.stringify({ requests: [{ type: 'execute', stmt: { sql: sql } }] })
  });
  return await resp.json();
}

function escape(s) {
  if (s === null || s === undefined) return '';
  return String(s).replace(/'/g, "''");
}

function normalizePhone(phone) {
  if (!phone) return '';
  let digits = phone.replace(/\D/g, '');
  if (digits.length === 10) digits = '1' + digits;
  if (digits.length === 11 && digits[0] === '1') return '+' + digits;
  return '+' + digits;
}

function extractDomain(url) {
  if (!url) return '';
  try {
    const u = new URL(url.startsWith('http') ? url : 'https://' + url);
    return u.hostname.replace(/^www\./, '').toLowerCase();
  } catch { return ''; }
}

// Suspicious patterns for quarantine
const SUSPICIOUS_PATTERNS = [
  /test/i, /fake/i, /demo/i, /example/i, /xxx/i, /porn/i,
  /asdf/i, /qwerty/i, /aaaa/i, /zzzz/i, /test[0-9]/i,
];

function isSuspicious(lead) {
  const name = (lead.business_name || '').toLowerCase();
  const phone = (lead.phone || '');
  
  // Repeated characters in name (>5 same char)
  if (/(.)\1{5,}/.test(name)) return 'Repeated characters in name';
  
  // Known fake patterns
  for (const pat of SUSPICIOUS_PATTERNS) {
    if (pat.test(name)) return 'Matches junk pattern: ' + pat.source;
  }
  
  // All-numeric name
  if (/^\d+$/.test(name.replace(/\s/g, ''))) return 'All-numeric business name';
  
  // Phone is all zeros or sequential
  const digits = phone.replace(/\D/g, '');
  if (/^0{7,}$/.test(digits)) return 'Phone is all zeros';
  if (/^(\d)\1{6,}$/.test(digits)) return 'Phone is repeated digit';
  
  return null;
}

function validateLead(lead) {
  const errors = [];
  
  if (!lead.business_name || !lead.business_name.trim()) {
    errors.push('Missing business name');
  }
  
  // Phone validation (optional but validate format if present)
  if (lead.phone && lead.phone.trim()) {
    const digits = lead.phone.replace(/\D/g, '');
    if (digits.length < 10) errors.push('Phone too short (< 10 digits)');
  }
  
  // Email validation (optional but validate format)
  if (lead.email && lead.email.trim()) {
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(lead.email)) {
      errors.push('Invalid email format');
    }
  }
  
  // URL validation (optional)
  if (lead.website && lead.website.trim()) {
    try { new URL(lead.website.startsWith('http') ? lead.website : 'https://' + lead.website); }
    catch { errors.push('Invalid website URL'); }
  }
  
  return errors;
}

module.exports = async function handler(req, res) {
  // CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  
  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const url = new URL(req.url, 'http://localhost');
  const path = url.pathname.replace(/\/$/, '');

  try {
    if (path === '/api/lead-intake/validate') {
      return await handleValidate(req, res);
    }
    if (path === '/api/lead-intake/import') {
      return await handleImport(req, res);
    }
    return res.status(404).json({ error: 'Not found' });
  } catch (err) {
    return res.status(500).json({ status: 'error', message: err.message });
  }
};

async function handleValidate(req, res) {
  let body = '';
  req.on('data', chunk => body += chunk);
  req.on('end', async () => {
    try {
      const { leads } = JSON.parse(body);
      if (!Array.isArray(leads) || leads.length === 0) {
        return res.status(422).json({ status: 'error', message: 'leads array required' });
      }
      
      const results = [];
      
      for (const lead of leads) {
        // Enforce consent defaults
        lead.consent_status = lead.consent_status || 'public_directory';
        lead.opted_in = lead.opted_in || 'false';
        
        // Validate
        const errors = validateLead(lead);
        if (errors.length > 0) {
          results.push({
            ...lead,
            status: 'error',
            errors,
            duplicates: [],
          });
          continue;
        }
        
        // Quarantine check
        const quarantineReason = isSuspicious(lead);
        if (quarantineReason) {
          results.push({
            ...lead,
            status: 'quarantine',
            errors: [quarantineReason],
            duplicates: [],
          });
          continue;
        }
        
        // Dedup checks
        const duplicates = [];
        const normPhone = normalizePhone(lead.phone);
        const domain = extractDomain(lead.website);
        
        // Check phone
        if (normPhone && normPhone !== '+') {
          const phoneResp = await dbQuery(
            "SELECT lead_id, business_name, phone FROM leads_pool WHERE phone = '" + escape(normPhone) + "' LIMIT 3"
          );
          const phoneRows = phoneResp?.results?.[0]?.response?.result?.rows || [];
          for (const row of phoneRows) {
            duplicates.push({
              type: 'phone_match',
              lead_id: val(row[0]),
              business_name: val(row[1]),
              phone: val(row[2]),
            });
          }
        }
        
        // Check domain from website
        if (domain) {
          const domainResp = await dbQuery(
            "SELECT lead_id, business_name, website FROM leads_pool WHERE website LIKE '%" + escape(domain) + "%' LIMIT 3"
          );
          const domainRows = domainResp?.results?.[0]?.response?.result?.rows || [];
          for (const row of domainRows) {
            if (!duplicates.find(d => d.lead_id === val(row[0]))) {
              duplicates.push({
                type: 'domain_match',
                lead_id: val(row[0]),
                business_name: val(row[1]),
              });
            }
          }
        }
        
        // Check name+city
        if (lead.business_name && lead.city) {
          const nameNorm = lead.business_name.toLowerCase().replace(/[^a-z0-9]/g, '');
          const cityNorm = lead.city.toLowerCase().replace(/[^a-z]/g, '');
          const nameResp = await dbQuery(
            "SELECT lead_id, business_name, city FROM leads_pool WHERE LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(business_name,' ',''),'-',''),\"'\",''),'.',''),',','')) = '" +
            escape(nameNorm) + "' AND LOWER(REPLACE(REPLACE(city,' ',''),'-','')) = '" + escape(cityNorm) + "' LIMIT 1"
          );
          const nameRows = nameResp?.results?.[0]?.response?.result?.rows || [];
          for (const row of nameRows) {
            if (!duplicates.find(d => d.lead_id === val(row[0]))) {
              duplicates.push({
                type: 'name_location_match',
                lead_id: val(row[0]),
                business_name: val(row[1]),
                city: val(row[2]),
              });
            }
          }
        }
        
        results.push({
          ...lead,
          status: duplicates.length > 0 ? 'duplicate' : 'ok',
          errors: [],
          duplicates,
        });
      }
      
      return res.status(200).json({ status: 'ok', results });
    } catch (e) {
      return res.status(500).json({ status: 'error', message: e.message });
    }
  });
}

async function handleImport(req, res) {
  let body = '';
  req.on('data', chunk => body += chunk);
  req.on('end', async () => {
    try {
      const { leads } = JSON.parse(body);
      if (!Array.isArray(leads) || leads.length === 0) {
        return res.status(422).json({ status: 'error', message: 'leads array required' });
      }
      
      let imported = 0;
      const errors = [];
      const now = new Date().toISOString();
      
      for (const lead of leads) {
        try {
          const leadId = lead.lead_id || 
            require('crypto').createHash('sha256')
              .update((lead.business_name + '|' + (lead.phone || '') + '|' + (lead.city || '') + ',' + (lead.state || '')).toLowerCase())
              .digest('hex');
          
          // Check if already exists
          const checkResp = await dbQuery(
            "SELECT lead_id FROM leads_pool WHERE lead_id = '" + escape(leadId) + "'"
          );
          const existingRows = checkResp?.results?.[0]?.response?.result?.rows || [];
          if (existingRows.length > 0) {
            errors.push({ business_name: lead.business_name, error: 'Already exists (lead_id match)' });
            continue;
          }
          
          const insertSql = 
            "INSERT INTO leads_pool (lead_id, business_name, phone, city, state, industry, email, website, demo_url, source, notes, metadata, opted_in, consent_status, first_seen_at, last_updated_at, last_activity_at) VALUES ('" +
            escape(leadId) + "','" +
            escape(lead.business_name) + "','" +
            escape(normalizePhone(lead.phone)) + "','" +
            escape(lead.city) + "','" +
            escape(lead.state) + "','" +
            escape(lead.trade || lead.industry || '') + "','" +
            escape(lead.email) + "','" +
            escape(lead.website) + "','" +
            escape(lead.demo_url) + "','" +
            escape(lead.source_url || 'owner_upload') + "','" +
            escape(lead.notes) + "','" +
            escape(JSON.stringify({ scrape_date: lead.scrape_date, source_url: lead.source_url, import_method: 'lead_intake_form' })) + "','" +
            escape(lead.opted_in || 'false') + "','" +
            escape(lead.consent_status || 'public_directory') + "','" +
            escape(lead.scrape_date ? lead.scrape_date + 'T00:00:00Z' : now) + "','" +
            escape(now) + "','" +
            escape(now) + "')";
          
          const insertResp = await dbQuery(insertSql);
          const insertResult = insertResp?.results?.[0];
          if (insertResult?.type === 'error') {
            errors.push({ business_name: lead.business_name, error: insertResult.error?.message || 'Insert error' });
            continue;
          }
          
          imported++;
        } catch (e) {
          errors.push({ business_name: lead.business_name, error: e.message });
        }
      }
      
      return res.status(200).json({
        status: 'ok',
        imported,
        errors: errors.length > 0 ? errors : undefined,
        message: `Imported ${imported} leads` + (errors.length > 0 ? `, ${errors.length} errors` : ''),
      });
    } catch (e) {
      return res.status(500).json({ status: 'error', message: e.message });
    }
  });
}
