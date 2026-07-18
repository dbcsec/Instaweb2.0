// POST /api/caller/leads — Ingest leads with dedup per Instaweb Lead Protocol v1
// GET /api/caller/leads — List leads (paginated, optional ?source= filter)
// GET /api/caller/leads/:id — Get single lead by lead_id

// Helper: extract plain value from Turso typed cell
function val(cell, fallback = 0) {
  if (cell && typeof cell === 'object' && cell.value !== undefined) {
    const v = cell.value;
    if (cell.type === 'integer') return Number(v);
    return v;
  }
  return cell ?? fallback;
}

// Normalize business name per protocol: lowercase, strip punctuation, strip suffixes
function normalizeName(name) {
  if (!name) return '';
  const suffixes = ['llc','inc','co','the','&','corp','corporation','ltd','limited'];
  let s = name.toLowerCase().replace(/[^a-z0-9\s]/g, '').replace(/\s+/g, ' ').trim();
  // Strip trailing suffixes
  for (const suffix of suffixes) {
    const re = new RegExp('\\s+' + suffix + '$');
    s = s.replace(re, '');
  }
  return s.trim();
}

// Normalize phone to E.164
function normalizePhone(phone) {
  if (!phone) return '';
  let digits = phone.replace(/\D/g, '');
  if (digits.length === 10) digits = '1' + digits;
  if (digits.length === 11 && digits[0] === '1') return '+' + digits;
  return '+' + digits; // best effort
}

// Normalize city: lowercase, strip punctuation, trim
function normalizeCity(city) {
  if (!city) return '';
  return city.toLowerCase().replace(/[^a-z\s]/g, '').trim();
}

// Normalize state: lowercase, two-letter
function normalizeState(state) {
  if (!state) return '';
  return state.toLowerCase().slice(0, 2);
}

// Compute SHA256 lead_id per protocol
async function computeLeadId(businessName, phone, city, state) {
  const input = normalizeName(businessName) + '|' + normalizePhone(phone) + '|' + normalizeCity(city) + ',' + normalizeState(state);
  const encoder = new TextEncoder();
  const data = encoder.encode(input);
  const hashBuffer = await crypto.subtle.digest('SHA-256', data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
}

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'no-cache');
  if (req.method === 'OPTIONS') return res.status(200).end();

  const DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
  const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODEyMDMxMDcsImlkIjoiMDE5ZWI3ZmEtN2UwMS03NDg4LWEyODctMjIzOWNkMWQxZWU0IiwicmlkIjoiY2Q5MDIyYTItMmFmMS00NmY0LWIyYTUtZDc1ODQxNTk0YTI0In0.I74NzuKD7PUSeNbJjA9b8jbZhUywKjbM4QIl0oDFCMs6rLtfToT7Cj25LGXh2zsw2759tLL5mPRsr4GsyOpYBQ';
  const apiUrl = DB_URL.replace('libsql://', 'https://');

  try {
    // --- GET: List leads ---
    if (req.method === 'GET') {
      const url = new URL(req.url, 'http://localhost');
      const source = url.searchParams.get('source') || '';
      const page = parseInt(url.searchParams.get('page')) || 1;
      const limit = parseInt(url.searchParams.get('limit')) || 50;
      const offset = (page - 1) * limit;
      
      let sql = 'SELECT * FROM leads_pool';
      let countSql = 'SELECT COUNT(*) as total FROM leads_pool';
      if (source) {
        sql += " WHERE source = '" + source.replace(/'/g, "''") + "'";
        countSql += " WHERE source = '" + source.replace(/'/g, "''") + "'";
      }
      sql += ' ORDER BY first_seen_at DESC LIMIT ' + limit + ' OFFSET ' + offset;
      
      const payload = JSON.stringify({requests: [
        {type:'execute', stmt:{sql: countSql}},
        {type:'execute', stmt:{sql: sql}}
      ]});
      const resp = await fetch(apiUrl + '/v2/pipeline', {
        method: 'POST',
        headers: {'Authorization': 'Bearer ' + DB_TOKEN, 'Content-Type': 'application/json'},
        body: payload
      });
      const data = await resp.json();
      const r = data?.results || [];
      const total = val(r[0]?.response?.result?.rows?.[0]?.[0]) || 0;
      const rows = r[1]?.response?.result?.rows || [];
      
      const leads = rows.map(row => {
        const obj = {};
        const cols = r[1]?.response?.result?.cols || [];
        row.forEach((cell, i) => {
          obj[cols[i]?.name || 'col' + i] = val(cell, null);
        });
        return obj;
      });
      
      return res.status(200).json({leads, total, page, limit, total_pages: Math.ceil(total / limit)});
    }
    
    // --- GET by ID: /api/caller/leads/:id ---
    if (req.method === 'GET' && req.url.includes('/api/caller/leads/')) {
      const parts = req.url.split('/');
      const leadId = parts[parts.length - 1];
      // Check if it's a simple /api/caller/leads without an ID
      if (leadId === 'leads' || leadId === '') {
        // Already handled above
      } else {
        const sql = "SELECT * FROM leads_pool WHERE lead_id = '" + leadId.replace(/'/g, "''") + "'";
        const payload = JSON.stringify({requests: [{type:'execute', stmt:{sql: sql}}]});
        const resp = await fetch(apiUrl + '/v2/pipeline', {
          method: 'POST',
          headers: {'Authorization': 'Bearer ' + DB_TOKEN, 'Content-Type': 'application/json'},
          body: payload
        });
        const data = await resp.json();
        const rows = data?.results?.[0]?.response?.result?.rows || [];
        if (rows.length === 0) return res.status(404).json({error: 'Lead not found'});
        const cols = data?.results?.[0]?.response?.result?.cols || [];
        const lead = {};
        rows[0].forEach((cell, i) => { lead[cols[i]?.name || 'col' + i] = val(cell, null); });
        return res.status(200).json(lead);
      }
    }
    
    // --- POST: Ingest lead ---
    if (req.method === 'POST') {
      let body = '';
      await new Promise(resolve => {
        req.on('data', chunk => { body += chunk; });
        req.on('end', resolve);
      });
      let input;
      try { input = JSON.parse(body); } catch(e) {
        return res.status(422).json({status: 'error', message: 'Invalid JSON body'});
      }
      
      // Validate required fields
      const required = ['business_name', 'phone', 'city', 'state', 'source', 'lead_id'];
      for (const field of required) {
        if (!input[field] || !input[field].toString().trim()) {
          return res.status(422).json({status: 'error', message: 'Missing required field: ' + field});
        }
      }
      
      // Validate source enum
      const validSources = ['polsia', 'instaweb', 'manual', 'caller'];
      if (!validSources.includes(input.source)) {
        return res.status(422).json({status: 'error', message: 'Invalid source. Must be one of: ' + validSources.join(', ')});
      }
      
      const leadId = input.lead_id;
      const phone = normalizePhone(input.phone);
      
      // Rule 1: Check exact match by lead_id
      const checkSql = "SELECT * FROM leads_pool WHERE lead_id = '" + leadId.replace(/'/g, "''") + "'";
      const checkPayload = JSON.stringify({requests: [{type:'execute', stmt:{sql: checkSql}}]});
      const checkResp = await fetch(apiUrl + '/v2/pipeline', {
        method: 'POST',
        headers: {'Authorization': 'Bearer ' + DB_TOKEN, 'Content-Type': 'application/json'},
        body: checkPayload
      });
      const checkData = await checkResp.json();
      const existingRows = checkData?.results?.[0]?.response?.result?.rows || [];
      
      if (existingRows.length > 0) {
        return res.status(200).json({status: 'duplicate', lead_id: leadId});
      }
      
      // Rule 2: Check same phone, different name
      const phoneCheckSql = "SELECT * FROM leads_pool WHERE phone = '" + phone.replace(/'/g, "''") + "'";
      const phonePayload = JSON.stringify({requests: [{type:'execute', stmt:{sql: phoneCheckSql}}]});
      const phoneResp = await fetch(apiUrl + '/v2/pipeline', {
        method: 'POST',
        headers: {'Authorization': 'Bearer ' + DB_TOKEN, 'Content-Type': 'application/json'},
        body: phonePayload
      });
      const phoneData = await phoneResp.json();
      const phoneRows = phoneData?.results?.[0]?.response?.result?.rows || [];
      const phoneCols = phoneData?.results?.[0]?.response?.result?.cols || [];
      
      if (phoneRows.length > 0) {
        const existing = {};
        phoneRows[0].forEach((cell, i) => { existing[phoneCols[i]?.name || 'col' + i] = val(cell, null); });
        
        const existingNorm = normalizeName(existing.business_name || '');
        const incomingNorm = normalizeName(input.business_name);
        
        if (existingNorm !== incomingNorm && existing.lead_id !== leadId) {
          // Log conflict
          const conflictSql = "INSERT INTO conflict_log (lead_id_a, lead_id_b, business_name_a, business_name_b, phone) VALUES ('" +
            existing.lead_id.replace(/'/g, "''") + "', '" +
            leadId.replace(/'/g, "''") + "', '" +
            (existing.business_name || '').replace(/'/g, "''") + "', '" +
            (input.business_name || '').replace(/'/g, "''") + "', '" +
            phone.replace(/'/g, "''") + "')";
          
          await fetch(apiUrl + '/v2/pipeline', {
            method: 'POST',
            headers: {'Authorization': 'Bearer ' + DB_TOKEN, 'Content-Type': 'application/json'},
            body: JSON.stringify({requests: [{type:'execute', stmt:{sql: conflictSql}}]})
          });
          
          return res.status(409).json({
            status: 'conflict',
            message: 'Same phone, different business name',
            existing: {lead_id: existing.lead_id, business_name: existing.business_name},
            incoming: {lead_id: leadId, business_name: input.business_name}
          });
        }
      }
      
      // Insert
      const now = new Date().toISOString();
      const insertSql = "INSERT INTO leads_pool (lead_id, business_name, phone, city, state, industry, email, demo_url, source, notes, metadata, first_seen_at, last_updated_at) VALUES ('" +
        leadId.replace(/'/g, "''") + "', '" +
        (input.business_name || '').replace(/'/g, "''") + "', '" +
        phone.replace(/'/g, "''") + "', '" +
        (input.city || '').replace(/'/g, "''") + "', '" +
        (input.state || '').replace(/'/g, "''") + "', '" +
        (input.industry || '').replace(/'/g, "''") + "', '" +
        (input.email || '').replace(/'/g, "''") + "', '" +
        (input.demo_url || '').replace(/'/g, "''") + "', '" +
        input.source.replace(/'/g, "''") + "', '" +
        (input.notes || '').replace(/'/g, "''") + "', '" +
        (input.metadata ? JSON.stringify(input.metadata).replace(/'/g, "''") : '') + "', '" +
        (input.first_seen_at || now) + "', '" + now + "')";
      
      const insertResp = await fetch(apiUrl + '/v2/pipeline', {
        method: 'POST',
        headers: {'Authorization': 'Bearer ' + DB_TOKEN, 'Content-Type': 'application/json'},
        body: JSON.stringify({requests: [{type:'execute', stmt:{sql: insertSql}}]})
      });
      const insertData = await insertResp.json();
      const insertResult = insertData?.results?.[0];
      
      if (insertResult?.type === 'error') {
        return res.status(500).json({status: 'error', message: insertResult.error.message});
      }
      
      return res.status(200).json({status: 'inserted', lead_id: leadId});
    }
    
    return res.status(405).json({error: 'Method not allowed'});
    
  } catch(err) {
    return res.status(500).json({status: 'error', message: err.message});
  }
};