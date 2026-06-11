import json
import re

html_file = '/home/team/shared/instaweb-unified/data/leads/expertise_houston_hvac.html'

with open(html_file, 'r') as f:
    content = f.read()

# The data is triple-escaped in the HTML script tag.
# Example: businessName\\\":\\\"Abacus Plumbing...\\\"

providers = []
# Match business names
names = re.findall(r'businessName\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', content)
phones = re.findall(r'phone\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', content)
websites = re.findall(r'businessWebsite\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', content)
cities = re.findall(r'city\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', content)
addresses = re.findall(r'businessAddress\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', content)

# Since we want to make sure they match up, let's use a more robust regex to get the whole object block
# Actually, the findall approach might get them out of sync if some fields are missing.
# Let's try to find each "Provider" block.

provider_blocks = re.split(r'\{\\\\\\\"__typename\\\\\\\":\\\\\\\"Provider\\\\\\\"', content)
for block in provider_blocks[1:]: # Skip the first part before the first provider
    name_match = re.search(r'businessName\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', block)
    phone_match = re.search(r'phone\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', block)
    website_match = re.search(r'businessWebsite\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', block)
    city_match = re.search(r'city\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', block)
    address_match = re.search(r'businessAddress\\\\\\\":\\\\\\\"(.*?)\\\\\\\"', block)
    
    if name_match:
        providers.append({
            "business_name": name_match.group(1).encode('utf-8').decode('unicode_escape'),
            "phone": phone_match.group(1) if phone_match else "N/A",
            "website_url": website_match.group(1) if website_match else "N/A",
            "city": city_match.group(1) if city_match else "Houston",
            "address": address_match.group(1) if address_match else "N/A",
            "industry": "HVAC",
            "state_code": "TX",
            "source": "expertise.com (verified)"
        })

with open('/home/team/shared/instaweb-unified/data/leads/verified_houston_hvac_leads.json', 'w') as f:
    json.dump(providers, f, indent=2)

print(f"Extracted {len(providers)} verified leads.")
