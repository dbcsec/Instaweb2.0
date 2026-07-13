module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'no-cache');
  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).end({error:'POST only'});
  
  const DB_URL = process.env.TEAM_DB_URL || 'libsql://agent-team-84564803-cto.aws-us-west-2.turso.io';
  const DB_TOKEN = process.env.TEAM_DB_AUTH_TOKEN || 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODEyMDMxMDcsImlkIjoiMDE5ZWI3ZmEtN2UwMS03NDg4LWEyODctMjIzOWNkMWQxZWU0IiwicmlkIjoiY2Q5MDIyYTItMmFmMS00NmY0LWIyYTUtZDc1ODQxNTk0YTI0In0.I74NzuKD7PUSeNbJjA9b8jbZhUywKjbM4QIl0oDFCMs6rLtfToT7Cj25LGXh2zsw2759tLL5mPRsr4GsyOpYBQ';
  const apiUrl = DB_URL.replace('libsql://', 'https://');
  
  try {
    const body = req.body || [];
    const timestamp = new Date().toISOString();
    
    // Create table if not exists, then insert each call log
    const queries = [{
      type: 'execute',
      stmt: { sql: "CREATE TABLE IF NOT EXISTS call_logs (id INTEGER PRIMARY KEY AUTOINCREMENT, business_name TEXT, phone TEXT, contact_name TEXT, email TEXT, status TEXT, notes TEXT, synced_at TEXT)" }
    }];
    
    for (const log of body) {
      queries.push({
        type: 'execute',
        stmt: {
          sql: "INSERT INTO call_logs (business_name, phone, contact_name, email, status, notes, synced_at) VALUES (?, ?, ?, ?, ?, ?, ?)",
          args: [log.business||'', log.phone||'', log.contact||'', log.email||'', log.status||'', log.notes||'', timestamp]
        }
      });
    }
    
    await fetch(`${apiUrl}/v2/pipeline`, {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${DB_TOKEN}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({ requests: queries })
    });
    
    res.status(200).json({ ok: true, saved: body.length, timestamp });
  } catch(err) {
    res.status(200).json({ ok: false, error: err.message });
  }
};