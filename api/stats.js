// Helper: extract plain value from Turso typed cell
function val(cell, fallback = 0) {
  if (cell && typeof cell === 'object' && cell.value !== undefined) {
    const v = cell.value;
    if (cell.type === 'integer') return Number(v);
    return v;
  }
  return cell ?? fallback;
}

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'no-cache');
  if (req.method === 'OPTIONS') return res.status(200).end();
  
  const DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
  const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODEyMDMxMDcsImlkIjoiMDE5ZWI3ZmEtN2UwMS03NDg4LWEyODctMjIzOWNkMWQxZWU0IiwicmlkIjoiY2Q5MDIyYTItMmFmMS00NmY0LWIyYTUtZDc1ODQxNTk0YTI0In0.I74NzuKD7PUSeNbJjA9b8jbZhUywKjbM4QIl0oDFCMs6rLtfToT7Cj25LGXh2zsw2759tLL5mPRsr4GsyOpYBQ';
  const apiUrl = DB_URL.replace('libsql://', 'https://');
  
  try {
    const resp = await fetch(`${apiUrl}/v2/pipeline`, {
      method: 'POST',
      headers: {'Authorization': `Bearer ${DB_TOKEN}`, 'Content-Type': 'application/json'},
      body: JSON.stringify({requests: [
        {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM leads"}},
        {type:'execute', stmt:{sql:"SELECT COALESCE(status,'new') as s,COUNT(*) as c FROM leads GROUP BY s ORDER BY c DESC"}},
        {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM clients"}},
        {type:'execute', stmt:{sql:"SELECT COUNT(*) as v FROM leads WHERE phone_verified=1"}},
      ]})
    });
    const data = await resp.json();
    const r = data?.results || [];
    
    // Extract plain values from Turso typed cells
    const total_leads = val(r[0]?.response?.result?.rows?.[0]?.[0]);
    const total_clients = val(r[2]?.response?.result?.rows?.[0]?.[0]);
    const phone_verified = val(r[3]?.response?.result?.rows?.[0]?.[0]);
    
    // Parse status breakdown (typed format)
    const rawBreakdown = (r[1]?.response?.result?.rows || []);
    const status_breakdown = rawBreakdown.map(x => ({
      status: val(x[0], ''),
      count: val(x[1])
    }));
    
    // Extract contacted count for dashboard compatibility
    const contacted = status_breakdown.find(s => s.status === 'contacted')?.count || 0;
    const followed_up = status_breakdown.find(s => s.status === 'followed_up')?.count || 0;
    
    res.status(200).json({
      total_leads,
      status_breakdown,
      contacted,
      followed_up,
      total_clients,
      phone_verified,
      timestamp: new Date().toISOString()
    });
  } catch(err) {
    res.status(200).json({
      total_leads: 0,
      status_breakdown: [],
      contacted: 0,
      followed_up: 0,
      total_clients: 0,
      phone_verified: 0,
      timestamp: new Date().toISOString(),
      error: err.message
    });
  }
};