// Instaweb Agency - Live Dashboard Stats API
// Queries team Turso DB and returns live JSON
module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate');

  if (req.method === 'OPTIONS') return res.status(200).end();

  try {
    // Use team Turso credentials from env vars
    const TEAM_DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
    const TEAM_DB_AUTH_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || '';
    
    const apiUrl = TEAM_DB_URL.replace('libsql://', 'https://');
    
    const response = await fetch(`${apiUrl}/v2/pipeline`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${TEAM_DB_AUTH_TOKEN}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        requests: [
          { type: 'execute', stmt: { sql: "SELECT COUNT(*) as val FROM leads" } },
          { type: 'execute', stmt: { sql: "SELECT COALESCE(status,'unknown') as status, COUNT(*) as cnt FROM leads GROUP BY status ORDER BY cnt DESC" } },
          { type: 'execute', stmt: { sql: "SELECT COUNT(*) as val FROM clients" } },
          { type: 'execute', stmt: { sql: "SELECT COALESCE(industry,'Other') as industry, COUNT(*) as cnt FROM leads GROUP BY industry ORDER BY cnt DESC LIMIT 6" } },
          { type: 'execute', stmt: { sql: "SELECT COALESCE(state_code,'Unknown') as state, COUNT(*) as cnt FROM leads GROUP BY state_code ORDER BY cnt DESC LIMIT 5" } },
          { type: 'execute', stmt: { sql: "SELECT COUNT(*) as val FROM leads WHERE phone_verified = 1" } },
          { type: 'execute', stmt: { sql: "SELECT COUNT(*) as val FROM leads WHERE email IS NOT NULL" } },
        ]
      }),
    });

    if (!response.ok) throw new Error(`Turso: ${response.status}`);

    const data = await response.json();
    const r = data?.results || [];
    
    res.status(200).json({
      status: 'ok',
      total_leads: r[0]?.response?.result?.rows?.[0]?.[0] ?? 0,
      status_breakdown: (r[1]?.response?.result?.rows || []).map(row => ({ 
        status: String(row[0] ?? 'unknown'), count: Number(row[1] ?? 0) 
      })),
      total_clients: r[2]?.response?.result?.rows?.[0]?.[0] ?? 0,
      top_industries: (r[3]?.response?.result?.rows || []).map(row => ({
        industry: String(row[0] ?? 'Other'), count: Number(row[1] ?? 0)
      })),
      top_states: (r[4]?.response?.result?.rows || []).map(row => ({
        state: String(row[0] ?? 'Unknown'), count: Number(row[1] ?? 0)
      })),
      phone_verified: r[5]?.response?.result?.rows?.[0]?.[0] ?? 0,
      has_email: r[6]?.response?.result?.rows?.[0]?.[0] ?? 0,
      timestamp: new Date().toISOString()
    });
  } catch (err) {
    res.status(500).json({ status: 'error', message: err.message });
  }
};
