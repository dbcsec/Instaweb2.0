#!/usr/bin/env python3
"""Deploy Instaweb Agency to Vercel via REST API (upload then deploy)."""
import hashlib
import json
import os
import sys
import time
import urllib.request
import urllib.error

TOKEN = "REPLACE_WITH_VERCEL_TOKEN"
BASE = "/home/team/shared/instaweb-unified"


def api_call(method, path, data=None, headers_extra=None, raw_response=False):
    url = f"https://api.vercel.com{path}"
    headers = {"Authorization": f"Bearer {TOKEN}"}
    if headers_extra:
        headers.update(headers_extra)
    if isinstance(data, dict):
        data = json.dumps(data).encode("utf-8")
        if "Content-Type" not in headers:
            headers["Content-Type"] = "application/json"
    req = urllib.request.Request(url, data=data, headers=headers, method=method)
    try:
        with urllib.request.urlopen(req, timeout=300) as resp:
            body = resp.read()
            if raw_response:
                return resp.status, body
            return resp.status, json.loads(body) if body else {}
    except urllib.error.HTTPError as e:
        body = e.read()
        try:
            return e.code, json.loads(body)
        except:
            return e.code, {"error": body.decode("utf-8", errors="replace")[:500]}


def walk_files():
    """Yield (relpath, content) for every file in the project."""
    for root, dirs, fnames in os.walk(BASE):
        if ".git" in root.split(os.sep):
            continue
        for fname in fnames:
            fpath = os.path.join(root, fname)
            relpath = os.path.relpath(fpath, BASE)
            with open(fpath, "rb") as f:
                content = f.read()
            if len(content) > 50 * 1024 * 1024:
                print(f"  SKIP (too large): {relpath}")
                continue
            yield relpath, content


if __name__ == "__main__":
    print("=" * 50)
    print("INSTAWEB AGENCY - VERCEL UPLOAD & DEPLOY")
    print("=" * 50)

    # Check auth
    status, user_data = api_call("GET", "/v2/user")
    if status == 200:
        user = user_data.get("user", {})
        print(f"✅ Authenticated: {user.get('name')} ({user.get('email')})")
    else:
        print(f"❌ Auth failed: {user_data}")
        sys.exit(1)

    # Phase 1: Upload all files
    print("\n📤 Phase 1: Uploading files (one-by-one)...")
    file_refs = []
    total = 0
    skipped = 0

    for relpath, content in walk_files():
        sha = hashlib.sha1(content).hexdigest()
        size = len(content)

        # First check if file already exists on Vercel
        status, check = api_call("GET", f"/v2/now/files/{sha}")
        if status == 200:
            # File already exists, just reference it
            file_refs.append({"file": relpath, "sha": sha, "size": size, "mode": "100644"})
            total += 1
            if total % 500 == 0:
                print(f"  Referenced {total} files (already on Vercel)...")
            continue

        # Upload the file
        status, resp = api_call(
            "POST",
            f"/v2/now/files",
            data=content,
            headers_extra={"Content-Type": "application/octet-stream"},
        )
        if status in (200, 201):
            file_refs.append({"file": relpath, "sha": sha, "size": size, "mode": "100644"})
            total += 1
        else:
            print(f"  FAILED {relpath}: {resp}")
            skipped += 1

        if total % 200 == 0:
            print(f"  Uploaded {total} files...")

    print(f"\n📊 Upload complete: {total} files uploaded, {skipped} skipped")

    # Phase 2: Create deployment
    print("\n🚀 Phase 2: Creating deployment...")
    deployment = {
        "name": "instaweb-agency",
        "files": file_refs,
        "projectSettings": {
            "framework": None,
            "buildCommand": None,
            "outputDirectory": ".",
        },
        "target": "production",
    }

    status, result = api_call("POST", "/v13/deployments", deployment)

    if status in (200, 201):
        url = result.get("url", "")
        ready = result.get("readyState", "")
        deploy_id = result.get("id", "")
        print(f"\n✅ DEPLOYMENT CREATED!")
        print(f"   URL: https://{url}")
        print(f"   State: {ready}")

        # Poll until ready
        print("\n⏳ Waiting for deployment to go live...")
        for i in range(60):
            time.sleep(3)
            s, check = api_call("GET", f"/v13/deployments/{deploy_id}")
            state = check.get("readyState", "")
            if state == "READY":
                print(f"\n✅ INSTAWEB AGENCY IS LIVE!")
                print(f"   https://{url}")
                print(f"   Also at: https://instaweb.agency (if domain linked)")
                break
            elif state in ("ERROR", "CANCELED"):
                print(f"\n❌ Deployment failed: {state}")
                err = check.get("error", {})
                print(json.dumps(err, indent=2))
                break
            if i % 10 == 0:
                print(f"  Building... ({state})")
    else:
        print(f"\n❌ Deployment failed: {status}")
        print(json.dumps(result, indent=2)[:2000])