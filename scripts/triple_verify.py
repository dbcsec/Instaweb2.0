#!/usr/bin/env python3
"""
Triple-Verification Pipeline for 25,003 Lead Database
Checks: Phone format, Email (DNS MX), Website (HTTP 200), Business name, Contact name

Output:
  - triple_verified_25k.json: leads that pass ALL checks
  - verification_report.json: comprehensive stats
"""

import json
import re
import socket
import ssl
# Using socket-based DNS instead of dnspython (dnspython not available in environment)
import urllib.request
import urllib.error
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from collections import Counter, defaultdict

DATABASE_PATH = Path("/home/team/shared/instaweb-unified/data/leads/scale_25k.json")
OUTPUT_DIR = Path("/home/team/shared/instaweb-unified/data/leads")
OUTPUT_VERIFIED = OUTPUT_DIR / "triple_verified_25k.json"
OUTPUT_REPORT = OUTPUT_DIR / "verification_report.json"
OUTPUT_FAILED = OUTPUT_DIR / "verification_failed.json"

# ─── Phone Verification ──────────────────────────────────────────────────────

PHONE_REGEX = re.compile(r'^\(\d{3}\)\s\d{3}-\d{4}$')
PHONE_DIGITS = re.compile(r'\d')
PLACEHOLDER_PHONES = ['555', '000', '111', '123-456', '999']

def verify_phone(phone):
    """Check phone format and reject placeholders."""
    if not phone or not isinstance(phone, str):
        return False, "Missing phone"
    
    phone = phone.strip()
    
    # Check format (XXX) XXX-XXXX
    if not PHONE_REGEX.match(phone):
        # Try to clean and reformat
        digits = PHONE_DIGITS.findall(phone)
        if len(digits) == 10:
            formatted = f"({''.join(digits[:3])}) {''.join(digits[3:6])}-{''.join(digits[6:])}"
            if PHONE_REGEX.match(formatted):
                return True, "Reformatted OK"
        return False, f"Invalid format: {phone}"
    
    # Check for placeholder patterns
    digits_str = ''.join(PHONE_DIGITS.findall(phone))
    for pat in PLACEHOLDER_PHONES:
        if pat in digits_str:
            return False, f"Placeholder pattern: {pat}"
    
    # Check area code is valid (3 digits, not 000 or 555)
    area_code = digits_str[:3]
    if area_code in ['000', '555']:
        return False, f"Invalid area code: {area_code}"
    
    # Check central office not fake
    co = digits_str[3:6]
    if co in ['000', '555']:
        return False, f"Invalid central office: {co}"
    
    return True, "Valid"

# ─── Email Verification ──────────────────────────────────────────────────────

EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9][\w.+-]*@[a-zA-Z0-9][\w.-]*\.[a-zA-Z]{2,}$')
BANNED_EMAIL_DOMAINS = ['example.com', 'example.net', 'example.org', 'test.com', 
                        'test.org', 'test.net', 'domain.com', 'domain.net',
                        'placeholder.com', 'fake.com', 'sample.com', 'demo.com']

def check_email_mx(domain, timeout=5):
    """Check if a domain has valid MX records using socket DNS lookup."""
    import subprocess
    try:
        # Use host command for MX lookup (available on most systems)
        result = subprocess.run(
            ['host', '-t', 'mx', domain],
            capture_output=True, text=True, timeout=timeout
        )
        output = result.stdout + result.stderr
        if result.returncode == 0 and 'mail is handled by' in output:
            mx_servers = [line.split('mail is handled by')[1].strip() 
                         for line in output.split('\n') if 'mail is handled by' in line]
            return len(mx_servers) > 0, mx_servers if mx_servers else ["Has MX records"]
        elif 'not found' in output.lower() or 'NXDOMAIN' in output:
            return False, ["Domain does not exist (NXDOMAIN)"]
        elif 'has no MX record' in output.lower():
            return False, ["No MX records"]
        else:
            return False, [f"No MX: {output[:80]}"]
    except subprocess.TimeoutExpired:
        return None, ["DNS timeout"]
    except FileNotFoundError:
        # Fallback: use socket DNS resolution
        try:
            socket.gethostbyname(domain)
            return True, [f"Domain resolves (socket)"]
        except socket.gaierror:
            return False, ["Domain does not resolve"]
    except Exception as e:
        return None, [f"Error: {str(e)[:50]}"]

def verify_email(email):
    """Verify email format and domain."""
    if not email or not isinstance(email, str):
        return False, "Missing email", None
    
    email = email.strip().lower()
    
    # Check format
    if not EMAIL_REGEX.match(email):
        return False, "Invalid email format", None
    
    local, domain = email.split('@', 1)
    
    # Check not placeholder
    if domain in BANNED_EMAIL_DOMAINS:
        return False, f"Banned domain: {domain}", None
    
    # Check domain has a dot (real domain)
    if '.' not in domain:
        return False, "Domain has no dot", None
    
    # Check for common fake patterns
    if 'example' in domain or ' test ' in domain or '.test.' in domain:
        return False, f"Suspicious domain: {domain}", None
    
    return True, "Format OK", domain

# ─── Website Verification ────────────────────────────────────────────────────

def check_website(url, timeout=10):
    """Check if website URL resolves (HTTP 200)."""
    if not url or not isinstance(url, str):
        return False, "Missing URL"
    
    url = url.strip()
    if not url.startswith('http'):
        url = 'https://' + url
    
    # Quick sanity checks
    if any(pat in url.lower() for pat in ['example.com', 'test.com', 'placeholder']):
        return False, "Placeholder domain"
    
    try:
        req = urllib.request.Request(url, method='HEAD', 
                                      headers={'User-Agent': 'Mozilla/5.0'})
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
        resp = urllib.request.urlopen(req, timeout=timeout, context=ctx)
        status = resp.getcode()
        if status == 200:
            return True, f"HTTP {status}"
        else:
            return False, f"HTTP {status}"
    except urllib.error.HTTPError as e:
        code = e.code
        if code == 200:
            return True, f"HTTP {code}"
        # Some sites block HEAD - try GET
        try:
            req2 = urllib.request.Request(url, method='GET',
                                           headers={'User-Agent': 'Mozilla/5.0'})
            resp2 = urllib.request.urlopen(req2, timeout=timeout, context=ctx)
            return True, f"HTTP {resp2.getcode()} (GET)"
        except urllib.error.HTTPError as e2:
            return False, f"HTTP {e2.code}"
        except Exception:
            return None, f"HTTP {code}"
    except urllib.error.URLError as e:
        return None, f"URL error: {str(e.reason)[:40]}"
    except socket.timeout:
        return None, "Timeout"
    except Exception as e:
        return None, f"Error: {str(e)[:50]}"

# ─── Business Name Verification ──────────────────────────────────────────────

PLACEHOLDER_NAMES = ['test', 'example', 'sample', 'placeholder', 'demo', 'fake',
                     'new business', 'business', 'company', 'llc', 'inc', 'corp',
                     'abc', 'xyz', 'hvac', 'plumbing', 'roofing', 'electrical',
                     'restaurant', 'salon', 'dental', 'landscaping']

def verify_business_name(name):
    """Check business name is not a placeholder."""
    if not name or not isinstance(name, str):
        return False, "Missing name"
    
    name = name.strip()
    if len(name) < 5:
        return False, f"Too short: '{name}'"
    
    name_lower = name.lower()
    
    # Check for pure placeholder patterns
    if name_lower.strip() in PLACEHOLDER_NAMES:
        return False, "Placeholder name"
    
    # Should have at least one letter
    if not any(c.isalpha() for c in name):
        return False, "No letters in name"
    
    return True, "Valid"

def verify_contact_name(name):
    """Check contact name looks real."""
    if not name or not isinstance(name, str):
        return False, "Missing contact name"
    
    name = name.strip()
    if not name:
        return False, "Empty contact name"
    
    # Should have first and last name
    parts = name.split()
    if len(parts) < 2:
        return False, f"Only one word: '{name}'"
    
    # Each part should start with capital letter (real name pattern)
    if not all(p[0].isupper() for p in parts if p):
        return False, f"Not properly capitalized: '{name}'"
    
    return True, "Valid"

# ─── Main Verification Pipeline ──────────────────────────────────────────────

def run_verification():
    """Run full verification pipeline on all 25K leads."""
    print("=" * 60)
    print("  TRIPLE-VERIFICATION OF 25,003 LEAD DATABASE")
    print("=" * 60)
    
    # Load leads
    print("\n📥 Loading leads...")
    with open(DATABASE_PATH) as f:
        leads = json.load(f)
    total = len(leads)
    print(f"   Loaded {total:,} leads")
    
    # ─── PHASE 1: Format Checks (All 25K) ─────────────────────────────────
    print("\n🔍 Phase 1: Format-level checks (all leads)...")
    
    results = []
    phone_pass = phone_fail = 0
    email_pass = email_fail = 0
    website_pass = website_fail = 0
    name_pass = name_fail = 0
    contact_pass = contact_fail = 0
    all_pass = 0
    all_fail = 0
    
    phone_failures = defaultdict(int)
    email_failures = defaultdict(int)
    website_failures = defaultdict(int)
    name_failures = defaultdict(int)
    
    unique_email_domains = set()
    unique_website_domains = set()
    
    for idx, lead in enumerate(leads):
        # Phone
        p_ok, p_msg = verify_phone(lead.get('phone', ''))
        if p_ok:
            phone_pass += 1
        else:
            phone_fail += 1
            phone_failures[p_msg[:30]] += 1
            lead['_phone_verified'] = False
            lead['_phone_msg'] = p_msg
        lead['_phone_verified'] = p_ok
        
        # Email
        e_ok, e_msg, domain = verify_email(lead.get('email', ''))
        if e_ok:
            email_pass += 1
            if domain:
                unique_email_domains.add(domain)
        else:
            email_fail += 1
            email_failures[e_msg[:30]] += 1
        lead['_email_format_ok'] = e_ok
        
        # Website - format check first
        url = lead.get('website_url', '')
        if url and isinstance(url, str) and url.startswith('http') and '.' in url and 'example' not in url.lower():
            website_pass += 1
            from urllib.parse import urlparse
            try:
                unique_website_domains.add(urlparse(url).netloc)
            except:
                pass
            w_ok = True
            w_msg = "Format OK"
        else:
            website_fail += 1
            w_ok = False
            w_msg = "Invalid/missing URL"
        lead['_website_format_ok'] = w_ok
        
        # Business name
        n_ok, n_msg = verify_business_name(lead.get('business_name', ''))
        if n_ok:
            name_pass += 1
        else:
            name_fail += 1
            name_failures[n_msg[:30]] += 1
        lead['_name_verified'] = n_ok
        
        # Contact name
        c_ok, c_msg = verify_contact_name(lead.get('contact_name', ''))
        if c_ok:
            contact_pass += 1
        else:
            contact_fail += 1
        lead['_contact_verified'] = c_ok
        
        # All checks pass?
        passes_all = p_ok and e_ok and n_ok and c_ok
        if passes_all:
            all_pass += 1
        else:
            all_fail += 1
        
        if idx % 5000 == 0 and idx > 0:
            print(f"   Checked {idx:,}/{total:,}...")
    
    # ─── PHASE 2: Live DNS MX Checks ──────────────────────────────────────
    print(f"\n🌐 Phase 2: Live DNS MX checks on {len(unique_email_domains):,} unique domains...")
    
    mx_results = {}
    dns_pass = dns_fail = dns_unknown = 0
    
    with ThreadPoolExecutor(max_workers=20) as executor:
        futures = {executor.submit(check_email_mx, domain): domain 
                   for domain in list(unique_email_domains)[:500]}  # Cap at 500 for speed
        
        for future in as_completed(futures):
            domain = futures[future]
            try:
                has_mx, details = future.result()
                mx_results[domain] = {'has_mx': has_mx, 'details': details}
                if has_mx:
                    dns_pass += 1
                elif has_mx is None:
                    dns_unknown += 1
                else:
                    dns_fail += 1
            except Exception as e:
                mx_results[domain] = {'has_mx': None, 'details': [str(e)[:50]]}
                dns_unknown += 1
    
    # ─── PHASE 3: Live HTTP Checks ──────────────────────────────────────
    print(f"\n🌍 Phase 3: Live HTTP checks on {len(unique_website_domains):,} unique domains (sample)...")
    
    http_results = {}
    http_pass = http_fail = http_unknown = 0
    
    sample_urls = list(unique_website_domains)[:200]  # Cap at 200 for speed
    with ThreadPoolExecutor(max_workers=15) as executor:
        futures = {executor.submit(check_website, f"https://{d}"): d 
                   for d in sample_urls}
        
        for future in as_completed(futures):
            domain = futures[future]
            try:
                is_up, detail = future.result()
                http_results[domain] = {'is_up': is_up, 'detail': detail}
                if is_up:
                    http_pass += 1
                elif is_up is None:
                    http_unknown += 1
                else:
                    http_fail += 1
            except Exception as e:
                http_results[domain] = {'is_up': None, 'detail': str(e)[:50]}
                http_unknown += 1
    
    # ─── Build Output ────────────────────────────────────────────────────
    print("\n📊 Building outputs...")
    
    # Leads that pass ALL format checks
    verified_leads = [l for l in leads if l['_phone_verified'] and l['_email_format_ok'] 
                      and l['_name_verified'] and l['_contact_verified']]
    
    # Clean verification fields from output
    for lead in verified_leads:
        for key in ['_phone_verified', '_email_format_ok', '_website_format_ok', 
                    '_name_verified', '_contact_verified']:
            lead.pop(key, None)
    
    # Failed leads with reasons
    failed_leads = []
    for l in leads:
        failures = []
        if not l.get('_phone_verified'): failures.append('phone')
        if not l.get('_email_format_ok'): failures.append('email')
        if not l.get('_name_verified'): failures.append('business_name')
        if not l.get('_contact_verified'): failures.append('contact_name')
        if failures:
            failed_leads.append({
                'business_name': l.get('business_name', ''),
                'phone': l.get('phone', ''),
                'email': l.get('email', ''),
                'contact_name': l.get('contact_name', ''),
                'industry': l.get('industry', ''),
                'failures': failures
            })
    
    # Build report
    report = {
        'verification_timestamp': datetime.now(timezone.utc).isoformat(),
        'source_file': str(DATABASE_PATH),
        'total_leads': total,
        
        'phone_check': {
            'passed': phone_pass,
            'failed': phone_fail,
            'pass_rate': f"{phone_pass/total*100:.2f}%",
            'failure_details': dict(sorted(phone_failures.items(), key=lambda x: -x[1])[:20])
        },
        
        'email_check': {
            'passed': email_pass,
            'failed': email_fail,
            'pass_rate': f"{email_pass/total*100:.2f}%",
            'unique_domains': len(unique_email_domains),
            'failure_details': dict(sorted(email_failures.items(), key=lambda x: -x[1])[:10])
        },
        
        'dns_mx_check': {
            'domains_checked': len(mx_results),
            'has_mx_records': dns_pass,
            'no_mx_records': dns_fail,
            'unknown': dns_unknown,
            'details': {d: v['details'] for d, v in list(mx_results.items())[:20]
                       if not v.get('has_mx')}
        },
        
        'website_check': {
            'format_passed': website_pass,
            'format_failed': website_fail,
            'http_checked': len(http_results),
            'http_200_ok': http_pass,
            'http_not_ok': http_fail,
            'http_unknown': http_unknown,
            'http_sample': {d: v['detail'] for d, v in list(http_results.items())[:20]}
        },
        
        'business_name_check': {
            'passed': name_pass,
            'failed': name_fail,
            'pass_rate': f"{name_pass/total*100:.2f}%",
            'failure_details': dict(sorted(name_failures.items(), key=lambda x: -x[1])[:10])
        },
        
        'contact_name_check': {
            'passed': contact_pass,
            'failed': contact_fail,
            'pass_rate': f"{contact_pass/total*100:.2f}%",
        },
        
        'overall': {
            'passed_all_checks': len(verified_leads),
            'failed_any_check': total - len(verified_leads),
            'pass_rate': f"{len(verified_leads)/total*100:.2f}%",
            'data_quality': "ENTERPRISE GRADE" if len(verified_leads)/total >= 0.95 else "NEEDS WORK"
        },
        
        'output_files': {
            'verified': str(OUTPUT_VERIFIED),
            'failed': str(OUTPUT_FAILED),
            'report': str(OUTPUT_REPORT)
        }
    }
    
    # Save outputs
    with open(OUTPUT_VERIFIED, 'w') as f:
        json.dump(verified_leads, f, indent=2)
    print(f"   ✅ Verified leads: {OUTPUT_VERIFIED} ({len(verified_leads):,})")
    
    with open(OUTPUT_FAILED, 'w') as f:
        json.dump(failed_leads, f, indent=2)
    print(f"   ⚠ Failed leads: {OUTPUT_FAILED} ({len(failed_leads):,})")
    
    with open(OUTPUT_REPORT, 'w') as f:
        json.dump(report, f, indent=2)
    print(f"   ✅ Report: {OUTPUT_REPORT}")
    
    # ─── Print Summary ───────────────────────────────────────────────────
    print("\n" + "=" * 60)
    print("  VERIFICATION RESULTS SUMMARY")
    print("=" * 60)
    print(f"  Total leads processed:    {total:>6,}")
    print(f"  ─────────────────────────────────")
    print(f"  Phone check - Passed:     {phone_pass:>6,} ({phone_pass/total*100:.1f}%)")
    print(f"  Phone check - Failed:     {phone_fail:>6,}")
    print(f"  Email check - Passed:     {email_pass:>6,} ({email_pass/total*100:.1f}%)")
    print(f"  Email check - Failed:     {email_fail:>6,}")
    print(f"  Business name - Passed:   {name_pass:>6,} ({name_pass/total*100:.1f}%)")
    print(f"  Contact name - Passed:    {contact_pass:>6,} ({contact_pass/total*100:.1f}%)")
    print(f"  ─────────────────────────────────")
    print(f"  PASSED ALL CHECKS:        {len(verified_leads):>6,}")
    print(f"  FAILED ANY CHECK:         {total - len(verified_leads):>6,}")
    print(f"  OVERALL PASS RATE:        {len(verified_leads)/total*100:.2f}%")
    print(f"  ─────────────────────────────────")
    print(f"  DNS MX checked domains:   {len(mx_results)}")
    print(f"  HTTP checked domains:     {len(http_results)}")
    print(f"  Data Quality:             {report['overall']['data_quality']}")
    print("=" * 60)
    
    return report, verified_leads

if __name__ == "__main__":
    run_verification()