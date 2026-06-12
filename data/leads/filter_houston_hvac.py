import json
import os

input_file = '/home/team/shared/instaweb-unified/data/enriched/verified_phone_leads.json'
output_dir = '/home/team/shared/instaweb-unified/data/leads/'
output_file = os.path.join(output_dir, 'houston_hvac_candidates.json')

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

with open(input_file, 'r') as f:
    leads = json.load(f)

houston_hvac = []
for lead in leads:
    industry = lead.get('industry', '').lower()
    city = lead.get('city', '').lower()
    state = lead.get('state_code', '').upper()
    
    is_hvac = 'hvac' in industry or 'air conditioning' in industry or 'heating' in industry
    
    houston_area_cities = [
        'houston', 'pasadena', 'sugar land', 'baytown', 'conroe', 'pearland', 
        'league city', 'missouri city', 'texas city', 'rosenberg', 'galveston',
        'the woodlands', 'spring', 'katy', 'humble', 'cypress', 'kingwood', 'tomball',
        'richmond', 'fulshear', 'stafford', 'bellaire', 'west university place'
    ]
    
    is_houston_area = city in houston_area_cities and state == 'TX'
    
    if is_hvac and is_houston_area:
        houston_hvac.append(lead)

print(f"Found {len(houston_hvac)} HVAC leads in Houston.")

with open(output_file, 'w') as f:
    json.dump(houston_hvac, f, indent=2)

print(f"Saved to {output_file}")
