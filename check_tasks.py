#!/usr/bin/env python3
import json, urllib.request
T = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3ODEyMDMxMDcsImlkIjoiMDE5ZWI3ZmEtN2UwMS03NDg4LWEyODctMjIzOWNkMWQxZWU0IiwicmlkIjoiY2Q5MDIyYTItMmFmMS00NmY0LWIyYTUtZDc1ODQxNTk0YTI0In0.I74NzuKD7PUSeNbJjA9b8jbZhUywKjbM4QIl0oDFCMs6rLtfToT7Cj25LGXh2zsw2759tLL5mPRsr4GsyOpYBQ'
d = json.dumps({"requests":[{"type":"execute","stmt":{"sql":"SELECT id, title, status, assigned_to FROM tasks WHERE assigned_to = 'agent-engineer' AND status IN ('in-progress', 'backlog')"}}]})
r = urllib.request.Request('https://agent-team-84564803-cto.aws-us-west-2.turso.io/v2/pipeline', data=d.encode(), headers={'Authorization': 'Bearer '+T, 'Content-Type': 'application/json'})
resp = json.loads(urllib.request.urlopen(r).read().decode())
rows = resp['results'][0]['response']['result']['rows']
for row in rows:
    print(f"ID: {row[0]['value']}, Title: {row[1]['value']}, Status: {row[2]['value']}, Assigned: {row[3]['value']}")
if not rows:
    print("No pending tasks for agent-engineer")
