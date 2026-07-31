#!/usr/bin/env python3
"""Generate demos for all new leads from bulk_new_leads.json that don't have demos yet.
Uses existing slugify logic and templates. Preserves everything existing."""
import json, os, re, sys

BASE_DIR = "/home/team/shared/instaweb-unified"
OUTPUT_DIR = f"{BASE_DIR}/data/demos/mass_output"
TRADE_TEMPLATE = f"{BASE_DIR}/templates/elite-trade.html"
FOOD_TEMPLATE = f"{BASE_DIR}/templates/elite-food.html"
MANIFEST_PATH = f"{BASE_DIR}/data/demos/demo_manifest.json"
LEADS_PATH = "/home/team/shared/bulk_new_leads.json"

TEMPLATE_MAP = {
    "hvac": TRADE_TEMPLATE, "plumbing": TRADE_TEMPLATE, "roofing": TRADE_TEMPLATE,
    "electrical": TRADE_TEMPLATE, "automotive": TRADE_TEMPLATE, "landscaping": TRADE_TEMPLATE,
    "restaurant": FOOD_TEMPLATE, "salon": FOOD_TEMPLATE, "dental": FOOD_TEMPLATE,
    "legal": FOOD_TEMPLATE
}

INDUSTRY_SERVICES = {
    "hvac": [
        ("snowflake", "AC Repair & Installation", "Call for pricing"),
        ("fire", "Heating & Furnace", "Call for pricing"),
        ("fan", "Duct Cleaning", "Call for pricing"),
        ("wrench", "Maintenance Plans", "Call for pricing"),
    ],
    "plumbing": [
        ("wrench", "Emergency Repairs", "Call for pricing"),
        ("droplet", "Water Heater Installs", "Call for pricing"),
        ("grip-lines", "Drain Cleaning", "Call for pricing"),
        ("toilet", "Fixture Installation", "Call for pricing"),
    ],
    "roofing": [
        ("house", "Residential Roofing", "Call for pricing"),
        ("building", "Commercial Roofing", "Call for pricing"),
        ("bolt-lightning", "Storm Damage Repair", "Call for pricing"),
        ("magnifying-glass", "Free Inspection", "Free"),
    ],
    "electrical": [
        ("bolt", "Emergency Repairs", "Call for pricing"),
        ("lightbulb", "Panel Upgrades", "Call for pricing"),
        ("plug", "Wiring & Rewiring", "Call for pricing"),
        ("house-chimney", "Smart Home Setup", "Call for pricing"),
    ],
    "restaurant": [
        ("utensils", "Signature Dishes", "$$"),
        ("calendar-check", "Reservations", "Free"),
        ("truck", "Delivery & Takeout", "Order online"),
        ("champagne-glasses", "Catering", "Inquire"),
    ],
    "salon": [
        ("scissors", "Hair Styling", "Call for pricing"),
        ("hand-sparkles", "Nail Services", "Call for pricing"),
        ("spa", "Spa Treatments", "Call for pricing"),
        ("calendar-check", "Book Online", "Free"),
    ],
    "dental": [
        ("tooth", "General Dentistry", "Call for pricing"),
        ("face-smile", "Cosmetic Dentistry", "Call for pricing"),
        ("truck-medical", "Emergency Care", "Call for pricing"),
        ("calendar-check", "Book Appointment", "Free"),
    ],
    "landscaping": [
        ("tree", "Lawn Care & Maintenance", "Call for pricing"),
        ("mountain", "Hardscaping", "Call for pricing"),
        ("pen-ruler", "Design & Installation", "Call for pricing"),
        ("file-invoice", "Free Estimate", "Free"),
    ],
    "automotive": [
        ("oil-can", "Oil Changes", "Call for pricing"),
        ("car", "Auto Repairs", "Call for pricing"),
        ("soap", "Detailing", "Call for pricing"),
        ("calendar-check", "Book Service", "Free"),
    ],
    "legal": [
        ("gavel", "Personal Injury", "Free consultation"),
        ("people-group", "Family Law", "Free consultation"),
        ("briefcase", "Business Law", "Free consultation"),
        ("file-signature", "Free Consultation", "Free"),
    ],
}

CUISINE_MAP = {
    "restaurant": "American", "salon": "European", "dental": "Continental", "legal": "International"
}

IND_DISPLAY_MAP = {
    "hvac": "HVAC", "plumbing": "Plumbing", "roofing": "Roofing",
    "electrical": "Electrical", "restaurant": "Restaurant", "salon": "Salon",
    "dental": "Dental", "landscaping": "Landscaping", "automotive": "Automotive",
    "legal": "Legal"
}

def slugify(name):
    s = name.lower()
    s = s.replace("&", "and").replace("'", "").replace('"', '')
    s = re.sub(r'[^a-z0-9]+', '-', s).strip('-')
    return s[:80]

def extract_val(val):
    if val is None: return ""
    if isinstance(val, dict):
        return str(val.get("value", val.get("name", "")) or "")
    return str(val)

# Load templates
with open(TRADE_TEMPLATE) as f:
    trade_tpl = f.read()
with open(FOOD_TEMPLATE) as f:
    food_tpl = f.read()

# Load manifest
with open(MANIFEST_PATH) as f:
    manifest = json.load(f)

existing_slugs = set()
for d in manifest:
    url = d.get('demo_url','')
    if url:
        existing_slugs.add(url.split('/')[-1].replace('.html','').lower())

print(f"Existing demo slugs: {len(existing_slugs)}")

# Load leads
with open(LEADS_PATH) as f:
    raw = json.load(f)

if isinstance(raw, dict):
    leads = raw.get('leads', raw.get('results', []))
else:
    leads = raw

print(f"Leads in file: {len(leads)}")

# Process
new_count = 0
skip_count = 0
batch = 500
generated = 0

for lead in leads:
    biz_name = extract_val(lead.get('business_name') or lead.get('name') or '')
    if not biz_name:
        skip_count += 1
        continue

    slug = slugify(biz_name)
    if slug in existing_slugs:
        skip_count += 1
        continue

    industry = extract_val(lead.get('industry') or lead.get('niche') or 'hvac').lower().strip()
    if industry not in TEMPLATE_MAP:
        industry = 'hvac'

    city = extract_val(lead.get('city') or 'Unknown')
    state = extract_val(lead.get('state_code') or lead.get('state') or 'TX')
    phone = extract_val(lead.get('phone') or '')
    email = extract_val(lead.get('email') or '')
    website = extract_val(lead.get('website_url') or lead.get('website') or '')

    # Pick template
    template_content = TEMPLATE_MAP[industry]
    if not os.path.exists(TEMPLATE_MAP[industry]):
        template_content = trade_tpl

    ind_display = IND_DISPLAY_MAP.get(industry, industry.title())
    cuisine = CUISINE_MAP.get(industry, "Delicious")
    services = INDUSTRY_SERVICES.get(industry, INDUSTRY_SERVICES["hvac"])

    # Build services HTML
    services_html = ""
    for icon, name, price in services:
        services_html += f"""
            <div class="service-card">
                <div class="service-icon"><i class="fas fa-{icon}"></i></div>
                <div class="service-info">
                    <h4>{name}</h4>
                    <span class="service-price">{price}</span>
                </div>
            </div>"""

    # Simple replacements
    html = template_content
    replacements = {
        '{{business_name}}': biz_name,
        '{{tagline}}': f"Your Trusted {ind_display} Service in {city}, {state}",
        '{{phone}}': phone or f"(555) 000-0000",
        '{{email}}': email or f"info@{slug.replace('-','')}.com",
        '{{city}}': city,
        '{{state}}': state,
        '{{industry}}': ind_display,
        '{{cuisine}}': cuisine,
        '{{website}}': website or '#',
        '<!-- #services -->': services_html,
        '<!-- /services -->': '',
    }

    for old, new in replacements.items():
        html = html.replace(old, new)

    # Write
    out_path = os.path.join(OUTPUT_DIR, f"{slug}.html")
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, 'w') as f:
        f.write(html)

    # Add to manifest
    demo_url = f"/demo/{slug}"
    manifest.append({
        "business_name": biz_name,
        "phone": phone or "(555) 000-0000",
        "city": city,
        "state": state,
        "industry": industry,
        "email": email or "",
        "demo_url": demo_url,
        "template": "elite-trade" if template_content == TRADE_TEMPLATE else "elite-food"
    })
    existing_slugs.add(slug)
    new_count += 1

    if new_count % 100 == 0:
        print(f"  Generated {new_count} so far...")

print(f"\nDone! Generated {new_count} new demos. Skipped {skip_count} (already had demos or no name).")
print(f"Total manifest entries: {len(manifest)}")

# Save manifest
with open(MANIFEST_PATH, 'w') as f:
    json.dump(manifest, f, indent=2)

print(f"Manifest saved.")
