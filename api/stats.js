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
    res.status(200).json({
      total_leads: r[0]?.response?.result?.rows?.[0]?.[0] ?? 0,
      status_breakdown: (r[1]?.response?.result?.rows||[]).map(x=>({status:x[0],count:x[1]})),
      total_clients: r[2]?.response?.result?.rows?.[0]?.[0] ?? 0,
      phone_verified: r[3]?.response?.result?.rows?.[0]?.[0] ?? 0,
      timestamp: new Date().toISOString()
    });
  } catch(err) {
    res.status(200).json({total_leads:0,total_clients:0,phone_verified:0,timestamp:new Date().toISOString(),error:err.message});
  }
};
