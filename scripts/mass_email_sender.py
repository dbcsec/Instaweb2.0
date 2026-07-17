#!/usr/bin/env python3
"""Instaweb Agency - Mass Email Sender
Sends personalized outreach emails via Resend API for generated demo sites.
"""
import json, subprocess, time, os, sys

RESEND_KEY = os.environ.get("RESEND_API_KEY", "")
EMAIL_DIR = "/home/team/shared/instaweb-unified/data/outreach/mass_batches"
SENT_LOG = "/home/team/shared/instaweb-unified/data/outreach/mass_sent_log.json"

def send_email(to, subject, body):
    """Send email via Resend API"""
    import urllib.request
    payload = json.dumps({
        "from": "Instaweb Agency <sales@mail.instaweb.agency>",
        "to": to,
        "subject": subject,
        "text": body
    }).encode()
    req = urllib.request.Request(
        "https://api.resend.com/emails",
        data=payload,
        headers={
            "Authorization": f"Bearer {RESEND_KEY}",
            "Content-Type": "application/json"
        },
        method="POST"
    )
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            return json.loads(r.read())
    except Exception as e:
        return {"error": str(e)}

def send_batch(batch_file, rate_limit=5):
    """Send all emails from a batch file with rate limiting"""
    if not os.path.exists(batch_file):
        print(f"Batch file not found: {batch_file}")
        return
    
    with open(batch_file) as f:
        emails = json.load(f)
    
    print(f"📧 Sending {len(emails)} emails from {batch_file}")
    
    # Load sent log
    sent = set()
    if os.path.exists(SENT_LOG):
        with open(SENT_LOG) as f:
            sent = set(json.load(f))
    
    results = []
    sent_count = 0
    error_count = 0
    
    for i, email in enumerate(emails):
        to = email.get("to", "")
        if not to or to in sent:
            continue
        
        # Rate limit
        if i > 0 and i % rate_limit == 0:
            time.sleep(2)
        
        result = send_email(to, email["subject"], email["body"])
        
        if "id" in result:
            sent_count += 1
            sent.add(to)
            results.append({"to": to, "status": "sent", "id": result["id"]})
        else:
            error_count += 1
            results.append({"to": to, "status": "error", "error": str(result.get("error", ""))})
        
        if (i+1) % 25 == 0:
            print(f"  {i+1}/{len(emails)} - {sent_count} sent, {error_count} errors")
    
    # Save results
    log_file = batch_file.replace(".json", "_sent_log.json")
    with open(log_file, "w") as f:
        json.dump(results, f, indent=2)
    
    # Update sent log
    with open(SENT_LOG, "w") as f:
        json.dump(list(sent), f, indent=2)
    
    print(f"\n✅ Complete: {sent_count} sent, {error_count} errors")
    return sent_count, error_count

if __name__ == "__main__":
    batch = sys.argv[1] if len(sys.argv) > 1 else "1"
    rate = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    batch_file = f"{EMAIL_DIR}/batch_{batch}_emails.json"
    send_batch(batch_file, rate)