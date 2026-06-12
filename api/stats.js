// Instaweb Agency - Live Dashboard Stats API
// Queries Turso DB and returns JSON
module.exports = async (req, res) => {
  // CORS headers
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  try {
    const TURSO_URL = process.env.TURSO_URL || 'libsql://instaweb-dbcsec.aws-us-west-2.turso.io';
    const TURSO_TOKEN = process.env.TURSO_TOKEN || '';
    const apiUrl = TURSO_URL.replace('libsql://', 'https://');
    
    const response = await fetch(`${apiUrl}/v2/pipeline`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${TURSO_TOKEN}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        requests: [
          { type: 'sql', stmt: { sql: "SELECT COUNT(*) as val FROM leads" } },
          { type: 'sql', stmt: { sql: "SELECT status, COUNT(*) as cnt FROM leads GROUP BY status ORDER BY cnt DESC" } },
          { type: 'sql', stmt: { sql: "SELECT COUNT(*) as val FROM clients" } },
          { type: 'sql', stmt: { sql: "SELECT industry, COUNT(*) as cnt FROM leads GROUP BY industry ORDER BY cnt DESC LIMIT 5" } },
          { type: 'sql', stmt: { sql: "SELECT state_code, COUNT(*) as cnt FROM leads GROUP BY state_code ORDER BY cnt DESC LIMIT 5" } },
          { type: 'sql', stmt: { sql: "SELECT COUNT(*) as val FROM leads WHERE phone_verified = 1" } },
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
        status: row[0], count: row[1] 
      })),
      total_clients: r[2]?.response?.result?.rows?.[0]?.[0] ?? 0,
      top_industries: (r[3]?.response?.result?.rows || []).map(row => ({
        industry: row[0], count: row[1]
      })),
      top_states: (r[4]?.response?.result?.rows || []).map(row => ({
        state: row[0], count: row[1]
      })),
      phone_verified: r[5]?.response?.result?.rows?.[0]?.[0] ?? 0,
      timestamp: new Date().toISOString()
    });
  } catch (err) {
    res.status(500).json({ status: 'error', message: err.message });
  }
};
