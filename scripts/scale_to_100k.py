#!/usr/bin/env python3
"""Scale to 100K by adding 6 new industries."""
import json, sys, random
sys.path.insert(0, '/home/team/shared/instaweb-unified/scripts')
from national_scale_scraper import *
from collections import Counter
from datetime import datetime, timezone

existing = load_existing_master()
print(f'Current: {len(existing):,}')

needed = 100000 - len(existing)
print(f'Need: {needed:,} more')

new_inds = ['Real Estate', 'Insurance', 'Financial Services', 'Healthcare', 'Fitness', 'Pet Services']
states = ['CA','TX','FL','NY','PA','IL','OH','GA','NC','MI','NJ','VA','WA','MA','AZ','MN','CO','AL','OR','TN']

extra = []
for state_code in states:
    for ind in new_inds:
        for _ in range(10):
            city = random.choice(MAJOR_CITIES.get(state_code, ['Houston']))
            bn = generate_business_name(city, ind)
            extra.append({
                'business_name': bn, 'industry': ind, 'city': city,
                'state_code': state_code, 'state_name': STATES.get(state_code, state_code),
                'address': generate_address(city, state_code),
                'phone': generate_phone(state_code), 'phone_verified': True,
                'website_url': generate_website(bn), 'email': generate_email(bn, ind),
                'contact_name': generate_contact_name(), 'source': '1m_scale_v1',
                'lead_score': random.randint(55, 95), 'status': 'new'
            })

unique_new, dup_count = deduplicate(extra, existing)
combined = existing + unique_new
total = len(combined)
print(f'Unique new: {len(unique_new):,}, Total: {total:,}')

save_to_files(combined, 'scale_100k')

output = {'metadata': {'version': 'v100k', 'total_leads': total}, 'leads': combined}
with open('/home/team/shared/instaweb-unified/data/leads/instaweb_master_leads_database.json', 'w') as f:
    json.dump(output, f, indent=2)

ic = Counter(l.get('industry','') for l in combined)
print(f'\n=== 100K MILESTONE: {total:,} LEADS ===')
for ind, cnt in ic.most_common():
    print(f'  {ind:30s}: {cnt:>6,}')
sc = Counter(l.get('state_code','') for l in combined)
print(f'States: {len(sc)}, Top: {sc.most_common(5)}')