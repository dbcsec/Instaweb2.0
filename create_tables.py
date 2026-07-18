#!/usr/bin/env python3
import json, urllib.request
T = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODEyMDMxMDcsImlkIjoiMDE5ZWI3ZmEtN2UwMS03NDg4LWEyODctMjIzOWNkMWQxZWU0IiwicmlkIjoiY2Q5MDIyYTItMmFmMS00NmY0LWIyYTUtZDc1ODQxNTk0YTI0In0.I74NzuKD7PUSeNbJjA9b8jbZhUywKjbM4QIl0oDFCMs6rLtfToT7Cj25LGXh2zsw2759tLL5mPRsr4GsyOpYBQ'

def run(sql, label):
    d = json.dumps({"requests":[{"type":"execute","stmt":{"sql": sql}}]})
    r = urllib.request.Request('https://agent-team-84564803-cto.aws-us-west-2.turso.io/v2/pipeline', data=d.encode(), headers={'Authorization': 'Bearer '+T, 'Content-Type': 'application/json'})
    resp = json.loads(urllib.request.urlopen(r).read().decode())
    result = resp['results'][0]
    if result['type'] == 'ok':
        print(f'OK: {label}')
    else:
        print(f'ERROR: {label}: {result["error"]["message"]}')

run("""CREATE TABLE IF NOT EXISTS leads_pool (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  lead_id TEXT UNIQUE NOT NULL,
  business_name TEXT NOT NULL,
  phone TEXT NOT NULL,
  city TEXT, state TEXT, industry TEXT, email TEXT, demo_url TEXT,
  source TEXT NOT NULL DEFAULT 'manual',
  status TEXT NOT NULL DEFAULT 'cold',
  notes TEXT, metadata TEXT,
  first_seen_at TEXT NOT NULL DEFAULT (datetime('now')),
  last_updated_at TEXT NOT NULL DEFAULT (datetime('now')),
  contacted_at TEXT, conflict_flag INTEGER DEFAULT 0
)""", "leads_pool table")

run("""CREATE TABLE IF NOT EXISTS conflict_log (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  lead_id_a TEXT, lead_id_b TEXT,
  business_name_a TEXT, business_name_b TEXT,
  phone TEXT,
  detected_at TEXT NOT NULL DEFAULT (datetime('now')),
  resolved INTEGER DEFAULT 0, resolution TEXT
)""", "conflict_log table")

run("CREATE INDEX IF NOT EXISTS idx_leads_pool_lead_id ON leads_pool(lead_id)", "lead_id index")
run("CREATE INDEX IF NOT EXISTS idx_leads_pool_phone ON leads_pool(phone)", "phone index")
run("CREATE INDEX IF NOT EXISTS idx_leads_pool_status ON leads_pool(status)", "status index")
run("CREATE INDEX IF NOT EXISTS idx_leads_pool_source ON leads_pool(source)", "source index")

print("DONE - All tables created")