module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate');
  if (req.method === 'OPTIONS') return res.status(200).end();
  try {
    const DB_URL = process.env.TEAM_DB_URL || process.env.TURSO_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
    const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || process.env.TURSO_TOKEN || '';
    const apiUrl = DB_URL.replace('libsql://', 'https://');
    const resp = await fetch(`${apiUrl}/v2/pipeline`, {
      method: 'POST',
      headers: {'Authorization': `Bearer ${DB_TOKEN}`, 'Content-Type': 'application/json'},
      body: JSON.stringify({requests: [
        {type:'execute', stmt:{sql:"SELECT COUNT(*) as val FROM leads"}},
        {type:'execute', stmt:{sql:"SELECT COALESCE(status,'new') as s, COUNT(*) as c FROM leads GROUP BY s ORDER BY c DESC"}},
        {type:'execute', stmt:{sql:"SELECT COUNT(*) as val FROM clients"}},
        {type:'execute', stmt:{sql:"SELECT COALESCE(industry,'Other') as i, COUNT(*) as c FROM leads GROUP BY i ORDER BY c DESC LIMIT 6"}},
        {type:'execute', stmt:{sql:"SELECT COUNT(*) as val FROM leads WHERE phone_verified=1"}},
        {type:'execute', stmt:{sql:"SELECT COUNT(*) as val FROM leads WHERE email IS NOT NULL"}},
      ]})
    });
    if (!resp.ok) throw new Error(`DB ${resp.status}`);
    const data = await resp.json();
    const r = data?.results || [];
    res.status(200).json({
      status:'ok', total_leads: r[0]?.response?.result?.rows?.[0]?.[0] ?? 0,
      status_breakdown: (r[1]?.response?.result?.rows||[]).map(row=>({status:row[0],count:row[1]})),
      total_clients: r[2]?.response?.result?.rows?.[0]?.[0] ?? 0,
      top_industries: (r[3]?.response?.result?.rows||[]).map(row=>({industry:row[0],count:row[1]})),
      phone_verified: r[4]?.response?.result?.rows?.[0]?.[0] ?? 0,
      has_email: r[5]?.response?.result?.rows?.[0]?.[0] ?? 0,
      timestamp: new Date().toISOString()
    });
  } catch(err) {
    res.status(200).json({status:'error', message:err.message, timestamp:new Date().toISOString()});
  }
};
