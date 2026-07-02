// Helper: extract plain value from Turso typed cell
function val(cell, fallback = 0) {
  if (cell && typeof cell === 'object' && cell.value !== undefined) {
    const v = cell.value;
    if (cell.type === 'integer') return Number(v);
    if (cell.type === 'real') return Number(v);
    return v;
  }
  return cell ?? fallback;
}

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'no-cache, max-age=5');
  if (req.method === 'OPTIONS') return res.status(200).end();
  
  const DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
  const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODEyMDMxMDcsImlkIjoiMDE5ZWI3ZmEtN2UwMS03NDg4LWEyODctMjIzOWNkMWQxZWU0IiwicmlkIjoiY2Q5MDIyYTItMmFmMS00NmY0LWIyYTUtZDc1ODQxNTk0YTI0In0.I74NzuKD7PUSeNbJjA9b8jbZhUywKjbM4QIl0oDFCMs6rLtfToT7Cj25LGXh2zsw2759tLL5mPRsr4GsyOpYBQ';
  const apiUrl = DB_URL.replace('libsql://', 'https://');
  
  // NOTE: The lead hunter will add email_verified and bounced columns later.
  // We use COALESCE to handle them gracefully (return 0 if column doesn't exist).
  
  try {
    const queries = [
      {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM leads"}},
      {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM leads WHERE status='contacted' OR status='followed_up'"}},
      {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM clients"}},
      {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM leads WHERE phone_verified=1"}},
      {type:'execute', stmt:{sql:"SELECT COALESCE(SUM(monthly_recurring), 0) as mrr FROM clients WHERE status='active'"}},
      {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM leads WHERE email IS NOT NULL AND email != ''"}},
      // Future columns - return 0 if they don't exist
      {type:'execute', stmt:{sql:"SELECT COALESCE(SUM(CASE WHEN bounced=1 THEN 1 ELSE 0 END), 0) FROM leads"}},
      {type:'execute', stmt:{sql:"SELECT COALESCE(SUM(CASE WHEN email_verified=1 THEN 1 ELSE 0 END), 0) FROM leads"}},
    ];
    
    const resp = await fetch(`${apiUrl}/v2/pipeline`, {
      method: 'POST',
      headers: {'Authorization': `Bearer ${DB_TOKEN}`, 'Content-Type': 'application/json'},
      body: JSON.stringify({requests: queries})
    });
    const data = await resp.json();
    const r = data?.results || [];
    
    // Try each result - if a query fails (column doesn't exist), return fallback 0
    let total_leads = 0, emails_sent = 0, clients_count = 0;
    let verified_count = 0, mrr = 0, has_email = 0;
    let bounced_count = 0, email_verified = 0;
    
    try { total_leads = val(r[0]?.response?.result?.rows?.[0]?.[0]); } catch(e) {}
    try { emails_sent = val(r[1]?.response?.result?.rows?.[0]?.[0]); } catch(e) {}
    try { clients_count = val(r[2]?.response?.result?.rows?.[0]?.[0]); } catch(e) {}
    try { verified_count = val(r[3]?.response?.result?.rows?.[0]?.[0]); } catch(e) {}
    try { mrr = Number(val(r[4]?.response?.result?.rows?.[0]?.[0])) || 0; } catch(e) {}
    try { has_email = val(r[5]?.response?.result?.rows?.[0]?.[0]); } catch(e) {}
    try { bounced_count = val(r[6]?.response?.result?.rows?.[0]?.[0]); } catch(e) {}
    try { email_verified = val(r[7]?.response?.result?.rows?.[0]?.[0]); } catch(e) {}
    
    // MRR: round to 2 decimal places
    mrr = Math.round(mrr * 100) / 100;
    
    res.status(200).json({
      total_leads,
      emails_sent,
      bounced_count,
      verified_count,
      clients_count,
      mrr,
      has_email,
      email_verified,
      timestamp: new Date().toISOString()
    });
    
  } catch(err) {
    res.status(200).json({
      total_leads: 0,
      emails_sent: 0,
      bounced_count: 0,
      verified_count: 0,
      clients_count: 0,
      mrr: 0,
      has_email: 0,
      email_verified: 0,
      timestamp: new Date().toISOString(),
      error: err.message
    });
  }
};