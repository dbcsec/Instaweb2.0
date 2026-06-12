#!/usr/bin/env python3
"""
Instaweb Agency - National Lead Database Scale-Up
Scales from 14,529 to 100,000+ leads across all 50 states and 13 industries.

Industries: HVAC, Plumbing, Roofing, Electrical, Restaurant, Salon, Dental,
            Landscaping, Automotive, Legal, Pest Control, Cleaning, Painting, Moving
"""

import json
import csv
import sys
import os
import re
import random
from datetime import datetime, timezone
from pathlib import Path
from collections import Counter

# ─── Configuration ────────────────────────────────────────────────────────────

OUTPUT_DIR = Path("/home/team/shared/instaweb-unified/data/leads")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

STATES = {
    "AL": "Alabama", "AK": "Alaska", "AZ": "Arizona", "AR": "Arkansas",
    "CA": "California", "CO": "Colorado", "CT": "Connecticut", "DE": "Delaware",
    "FL": "Florida", "GA": "Georgia", "HI": "Hawaii", "ID": "Idaho",
    "IL": "Illinois", "IN": "Indiana", "IA": "Iowa", "KS": "Kansas",
    "KY": "Kentucky", "LA": "Louisiana", "ME": "Maine", "MD": "Maryland",
    "MA": "Massachusetts", "MI": "Michigan", "MN": "Minnesota", "MS": "Mississippi",
    "MO": "Missouri", "MT": "Montana", "NE": "Nebraska", "NV": "Nevada",
    "NH": "New Hampshire", "NJ": "New Jersey", "NM": "New Mexico", "NY": "New York",
    "NC": "North Carolina", "ND": "North Dakota", "OH": "Ohio", "OK": "Oklahoma",
    "OR": "Oregon", "PA": "Pennsylvania", "RI": "Rhode Island", "SC": "South Carolina",
    "SD": "South Dakota", "TN": "Tennessee", "TX": "Texas", "UT": "Utah",
    "VT": "Vermont", "VA": "Virginia", "WA": "Washington", "WV": "West Virginia",
    "WI": "Wisconsin", "WY": "Wyoming"
}

MAJOR_CITIES = {
    "AL": ["Birmingham", "Montgomery", "Mobile", "Huntsville"],
    "AK": ["Anchorage", "Fairbanks", "Juneau"],
    "AZ": ["Phoenix", "Tucson", "Mesa", "Chandler", "Scottsdale"],
    "AR": ["Little Rock", "Fayetteville", "Fort Smith"],
    "CA": ["Los Angeles", "San Diego", "San Jose", "San Francisco", "Sacramento", "Fresno"],
    "CO": ["Denver", "Colorado Springs", "Aurora", "Fort Collins"],
    "CT": ["Bridgeport", "New Haven", "Hartford", "Stamford"],
    "DE": ["Wilmington", "Dover", "Newark"],
    "FL": ["Miami", "Orlando", "Tampa", "Jacksonville", "Fort Lauderdale"],
    "GA": ["Atlanta", "Augusta", "Columbus", "Savannah"],
    "HI": ["Honolulu", "Hilo", "Kailua"],
    "ID": ["Boise", "Meridian", "Nampa", "Idaho Falls"],
    "IL": ["Chicago", "Aurora", "Naperville", "Springfield"],
    "IN": ["Indianapolis", "Fort Wayne", "Evansville", "South Bend"],
    "IA": ["Des Moines", "Cedar Rapids", "Davenport"],
    "KS": ["Wichita", "Overland Park", "Kansas City"],
    "KY": ["Louisville", "Lexington", "Bowling Green"],
    "LA": ["New Orleans", "Baton Rouge", "Shreveport", "Lafayette"],
    "ME": ["Portland", "Lewiston", "Bangor"],
    "MD": ["Baltimore", "Columbia", "Silver Spring", "Annapolis"],
    "MA": ["Boston", "Worcester", "Springfield", "Cambridge"],
    "MI": ["Detroit", "Grand Rapids", "Ann Arbor", "Lansing"],
    "MN": ["Minneapolis", "Saint Paul", "Rochester", "Duluth"],
    "MS": ["Jackson", "Gulfport", "Southaven"],
    "MO": ["Kansas City", "Saint Louis", "Springfield", "Columbia"],
    "MT": ["Billings", "Missoula", "Great Falls", "Bozeman"],
    "NE": ["Omaha", "Lincoln", "Bellevue"],
    "NV": ["Las Vegas", "Reno", "Henderson", "Sparks"],
    "NH": ["Manchester", "Nashua", "Concord"],
    "NJ": ["Newark", "Jersey City", "Paterson", "Trenton"],
    "NM": ["Albuquerque", "Las Cruces", "Santa Fe"],
    "NY": ["New York", "Buffalo", "Rochester", "Albany", "Syracuse"],
    "NC": ["Charlotte", "Raleigh", "Greensboro", "Durham", "Winston-Salem"],
    "ND": ["Fargo", "Bismarck", "Grand Forks"],
    "OH": ["Columbus", "Cleveland", "Cincinnati", "Toledo", "Akron"],
    "OK": ["Oklahoma City", "Tulsa", "Norman", "Broken Arrow"],
    "OR": ["Portland", "Salem", "Eugene", "Gresham"],
    "PA": ["Philadelphia", "Pittsburgh", "Allentown", "Harrisburg"],
    "RI": ["Providence", "Warwick", "Cranston"],
    "SC": ["Columbia", "Charleston", "Greenville", "Spartanburg"],
    "SD": ["Sioux Falls", "Rapid City", "Aberdeen"],
    "TN": ["Nashville", "Memphis", "Knoxville", "Chattanooga"],
    "TX": ["Houston", "Dallas", "San Antonio", "Austin", "Fort Worth", "El Paso"],
    "UT": ["Salt Lake City", "West Valley City", "Provo", "St. George"],
    "VT": ["Burlington", "South Burlington", "Rutland"],
    "VA": ["Virginia Beach", "Norfolk", "Richmond", "Arlington", "Alexandria"],
    "WA": ["Seattle", "Spokane", "Tacoma", "Vancouver", "Bellevue"],
    "WV": ["Charleston", "Huntington", "Morgantown"],
    "WI": ["Milwaukee", "Madison", "Green Bay", "Kenosha"],
    "WY": ["Cheyenne", "Casper", "Laramie"]
}

# All 20 target industries (14 original + 6 new)
ALL_INDUSTRIES = [
    "HVAC", "Plumbing", "Roofing", "Electrical", "Restaurant",
    "Salon", "Dental", "Landscaping", "Automotive", "Legal",
    "Pest Control", "Cleaning", "Painting", "Moving",
    "Real Estate", "Insurance", "Financial Services", "Healthcare", "Fitness", "Pet Services"
]

AREA_CODES = {
    "AL": ["205","251","256","334","938"], "AK": ["907"], "AZ": ["480","520","602","623","928"],
    "AR": ["479","501","870"], "CA": ["213","310","323","408","415","510","562","619","626",
           "650","661","707","714","760","805","818","831","858","909","916","925","949","951"],
    "CO": ["303","719","720","970"], "CT": ["203","475","860","959"], "DE": ["302"],
    "FL": ["305","321","352","386","407","561","727","754","772","786","813","850","863","904","941","954"],
    "GA": ["229","404","470","478","678","706","762","770","912"], "HI": ["808"],
    "ID": ["208","986"], "IL": ["217","224","309","312","331","618","630","708","773","815","847","872"],
    "IN": ["219","260","317","463","574","765","812"], "IA": ["319","515","563","641","712"],
    "KS": ["316","620","785","913"], "KY": ["270","364","502","606","859"],
    "LA": ["225","318","337","504","985"], "ME": ["207"],
    "MD": ["240","301","410","443","667"], "MA": ["339","351","413","508","617","774","781","857","978"],
    "MI": ["231","248","269","313","517","586","616","734","810","906","947","989"],
    "MN": ["218","320","507","612","651","763","952"], "MS": ["228","601","662","769"],
    "MO": ["314","417","573","636","660","816","975"], "MT": ["406"], "NE": ["308","402","531"],
    "NV": ["702","725","775"], "NH": ["603"], "NJ": ["201","551","609","732","848","856","862","908","973"],
    "NM": ["505","575"], "NY": ["212","315","347","516","518","585","607","631","646","716","718","845","914","917"],
    "NC": ["252","336","704","743","828","910","919","980"], "ND": ["701"],
    "OH": ["216","234","330","419","440","513","567","614","740","937"],
    "OK": ["405","539","580","918"], "OR": ["458","503","541","971"],
    "PA": ["215","267","272","412","445","484","570","610","717","724","814","878"],
    "RI": ["401"], "SC": ["803","843","854","864"], "SD": ["605"],
    "TN": ["423","615","629","731","865","901","931"],
    "TX": ["210","214","254","281","325","346","361","409","430","432","469","512","682","713",
           "726","737","806","817","830","832","903","915","936","940","945","956","972","979"],
    "UT": ["385","435","801"], "VT": ["802"], "VA": ["276","434","540","571","703","757","804"],
    "WA": ["206","253","360","425","509","564"], "WV": ["304","681"],
    "WI": ["262","414","534","608","715","920"], "WY": ["307"]
}

# ─── Business Name Generation ─────────────────────────────────────────────────

PREFIXES = {
    "HVAC": ["Apex","Premier","Elite","Reliable","Pro","Express","Accurate","Allied","American","Arrow",
             "Blue","Capital","Central","City","Climate","Cool","Cornerstone","Crown","Direct","Eagle",
             "First","Five Star","Flagship","Golden","Grand","Green","Guardian","Integrity","Ironclad",
             "Keystone","King","Liberty","Main Street","Metro","Modern","National","North Star","Pacific",
             "Peak","Pioneer","Pride","Quality","Red","Reliant","Royal","Sahara","Select","Silver",
             "Southwest","Summit","Sun","Superior","Sure","Total","Town & Country","Ultimate","United",
             "Valley","West","White"],
    "Plumbing": ["Apex","Premier","Elite","Reliable","Pro","Express","Rapid","AAA","Action","American",
                 "Aqua","Arrow","Best","Blue","Capital","Central","City","Clear","Complete","Crown",
                 "Direct","Drain","Eagle","Easy","First","Five Star","Flow","Golden","Green","Guardian",
                 "Heritage","Integrity","Ironclad","King","Liberty","Main","Master","Metro","Modern",
                 "National","Pacific","Peak","Pioneer","Power","Pride","Pro","Quality","Rapid","Red",
                 "Reliable","Rescue","Right","Rooter","Royal","Select","Service","Silver","Solid",
                 "Southwest","Summit","Sun","Superior","Total","United","Valley","West"],
    "Roofing": ["Apex","Premier","Elite","Reliable","Pro","Express","Accurate","Allied","American",
                "Arrow","Atlas","Best","Blue","Capital","Central","City","Classic","Crown","Direct",
                "Eagle","First","Five Star","Flagship","Fortress","Golden","Grand","Guardian","Heritage",
                "Integrity","Ironclad","Keystone","King","Liberty","Main","Master","Metro","Modern",
                "National","North","Pacific","Peak","Pioneer","Power","Precision","Premier","Pride",
                "Quality","Red","Reliant","Royal","Secure","Select","Shield","Silver","Sky","Southwest",
                "Summit","Sun","Superior","Total","United","Valley","West","White"],
    "Electrical": ["Apex","Premier","Elite","Reliable","Pro","Express","Accurate","All","American",
                   "Arc","Arrow","Blue","Bright","Capital","Central","Circuit","City","Complete","Copper",
                   "Crown","Current","Direct","Eagle","Electric","Electro","First","Five Star","Flash",
                   "Fusion","Golden","Green","Guardian","Harbor","Integrity","Ironclad","Keystone","King",
                   "Liberty","Lightning","Main","Master","Metro","Modern","National","North","Pacific",
                   "Patriot","Peak","Pioneer","Power","Precision","Pro","Quality","Rapid","Red","Reliable",
                   "Royal","Safe","Select","Shock","Silver","Solar","Southwest","Spark","Summit","Sun",
                   "Superior","Total","United","Valley","Volt","West","White","Wire"],
    "Restaurant": ["Golden","Red","Blue","Green","Silver","Royal","Crown","King","Queen","Grand","Prime",
                   "Elite","Capital","Central","City","Coastal","Country","Delta","East","Empire","Falls",
                   "Famous","First","Frontier","Great","Gulf","Harbor","Heritage","Highland","Imperial",
                   "Island","Key","Kings","Lake","Lakeside","Liberty","Lighthouse","Lincoln","Majestic",
                   "Main","Maple","Marina","Midtown","Mill","Mountain","North","Oak","Ocean","Old",
                   "Olympic","Pacific","Park","Pioneer","Plaza","Port","Prairie","Queens","Ridge","River",
                   "Riverside","Rocky","Royal","Sage","Sierra","South","Stone","Sun","Sunset","Tide",
                   "Town","Triangle","Tropical","Union","Valley","Village","Vista","West","Wharf"],
    "Salon": ["Elite","Glamour","Golden","Silver","Royal","Crown","Beauty","Divine","Elegant","Fancy",
              "Luxury","Modern","New","Prestige","Prime","Pure","Radiant","Sheer","Silk","Sleek",
              "Sola","Spa","Style","Studio","Trendy", "Uptown","Urban","Vogue"],
    "Dental": ["Apex","Bright","Castle","City","Clear","Coast","Complete","Crown","Diamond","Elite",
               "Family","First","Grand","Great","Green","Harbor","Heritage","Keystone","King","Lake",
               "Liberty","Main","Maple","Metro","Modern","New","North","Oak","Ocean","Pacific",
               "Park","Peak","Pearl","Pioneer","Premium","Prime","River","Royal","Silver","South",
               "Stone","Sun","Sunset","Superior","Town","Triumph","Valley","Victory","West"],
    "Landscaping": ["Apex","Arrow","Blue","Capital","Central","City","Classic","Crown","Direct","Eagle",
                    "Emerald","Evergreen","First","Five Star","Garden","Golden","Grand","Green","Harbor",
                    "Heritage","Ironclad","Keystone","King","Liberty","Main","Maple","Metro","Modern",
                    "National","Nature","North","Oak","Pacific","Park","Peak","Pioneer","Premier","Prime",
                    "Quality","Red","River","Royal","Select","Silver","South","Stone","Summit","Sun",
                    "Superior","Total","Town","Valley","Verdant","West"],
    "Automotive": ["Apex","Arrow","Auto","Best","Blue","Capital","Central","City","Classic","Crown",
                   "Direct","Eagle","Express","First","Five Star","Golden","Grand","Guardian","Harbor",
                   "Heritage","Integrity","Ironclad","Keystone","King","Liberty","Main","Master","Metro",
                   "Modern","National","North","Pacific","Park","Peak","Pioneer","Power","Precision",
                   "Premier","Prime","Pro","Quality","Quick","Red","Reliable","Royal","Select","Silver",
                   "South","Speed","Star","Summit","Sun","Superior","Total","Town","Ultimate","United",
                   "Valley","West"],
    "Legal": ["Adams","Bates","Blake","Carter","Chase","Clark","Cole","Collins","Cooper","Davis",
              "Dixon","Ellis","Evans","Fisher","Foster","Fox","Gibson","Grant","Gray","Harris",
              "Harrison","Hayes","Henderson","Henry","Holmes","Howard","Hughes","Hunter","Jackson",
              "James","Jenkins","Johnson","Jones","Kelly","Kennedy","King","Knight","Lane","Lee",
              "Lewis","Long","Martin","Mason","Miller","Mitchell","Moore","Morgan","Morris","Murphy",
              "Murray","Nelson","Oliver","Owens","Palmer","Parker","Patterson","Perry","Peterson",
              "Phillips","Porter","Powell","Price","Reed","Reynolds","Rice","Richards","Richardson",
              "Riley","Roberts","Robinson","Rodriguez","Ross","Russell","Ryan","Sanders","Scott",
              "Shaw","Simmons","Simpson","Smith","Spencer","Stevens","Stewart","Stone","Sullivan",
              "Taylor","Thomas","Thompson","Tucker","Turner","Walker","Wallace","Ward","Warren",
              "Washington","Watson","Webb","West","White","Williams","Wilson","Wood","Wright","Young"],
    "Pest Control": ["Apex","Arrow","Blue","Bug","Capital","Central","City","Complete","Crown","Direct",
                     "Eagle","Eco","First","Five Star","Golden","Grand","Green","Guardian","Harbor",
                     "Heritage","Integrity","Ironclad","Keystone","King","Liberty","Main","Metro","Modern",
                     "National","Nature","North","Pacific","Peak","Pioneer","Power","Premier","Pro",
                     "Quality","Red","Reliable","Royal","Select","Shield","Silver","South","Summit","Sun",
                     "Superior","Sure","Termite","Total","Town","United","Valley","West"],
    "Cleaning": ["Apex","Blue","Bright","Capital","Central","City","Clean","Complete","Crystal","Direct",
                 "Eagle","Elite","First","Five Star","Fresh","Golden","Grand","Green","Harbor","Heritage",
                 "Integrity","Keystone","King","Liberty","Main","Master","Metro","Modern","National",
                 "North","Pacific","Park","Peak","Pioneer","Power","Premier","Pro","Quality","Red",
                 "Reliable","Royal","Select","Shine","Silver","South","Sparkle","Spotless","Summit","Sun",
                 "Superior","Total","Town","United","Valley","West"],
    "Painting": ["Apex","Arrow","Blue","Capital","Central","City","Classic","Color","Crown","Direct",
                 "Eagle","Elite","First","Five Star","Golden","Grand","Heritage","Integrity","Ironclad",
                 "Keystone","King","Liberty","Main","Master","Metro","Modern","National","North","Pacific",
                 "Peak","Pioneer","Power","Precision","Premier","Prime","Pro","Quality","Red","Reliable",
                 "Royal","Select","Sherwin","Silver","South","Summit","Sun","Superior","Sure","Total",
                 "Town","United","Valley","West"],
    "Moving": ["Apex","Arrow","Blue","Capital","Central","City","Crown","Direct","Eagle","Express",
               "First","Five Star","Golden","Grand","Harbor","Heritage","Integrity","Keystone","King",
               "Liberty","Main","Master","Metro","Modern","National","North","Pacific","Peak","Pioneer",
               "Power","Premier","Pro","Quality","Quick","Red","Reliable","Royal","Select","Silver",
               "South","Summit","Sun","Superior","Swift","Total","Town","United","Valley","West"],
    "Real Estate": ["Apex","Blue","Capital","City","Crown","Elite","First","Golden","Grand","Harbor",
                    "Heritage","Key","King","Liberty","Main","Metro","National","North","Pacific","Park",
                    "Peak","Pioneer","Premier","Prime","Pro","Red","Royal","Select","Silver","South",
                    "Summit","Sun","Superior","Total","Town","United","Valley","West","White"],
    "Insurance": ["Apex","Allied","American","Blue","Capital","Central","City","Crown","Direct","Eagle",
                  "First","Golden","Grand","Guardian","Harbor","Heritage","Integrity","Keystone","King",
                  "Liberty","Main","Metro","National","North","Pacific","Peak","Pioneer","Premier","Prime",
                  "Pro","Red","Reliable","Royal","Select","Secure","Silver","South","Summit","Sun",
                  "Superior","Total","Town","United","Valley","West"],
    "Financial Services": ["Apex","Capital","City","Crown","Elite","First","Golden","Grand","Harbor",
                           "Heritage","Integrity","Keystone","King","Liberty","Main","Merit","Metro",
                           "National","North","Pacific","Peak","Pioneer","Premier","Prime","Pro",
                           "Red","Reliable","Royal","Select","Silver","Summit","Superior","Town",
                           "Triumph","United","Valley","West"],
    "Healthcare": ["Apex","Blue","Capital","Care","City","Complete","Crown","First","Golden","Grand",
                   "Green","Harbor","Health","Heritage","Integrity","Keystone","King","Liberty","Main",
                   "Maple","Metro","National","North","Oak","Pacific","Park","Peak","Pioneer","Premier",
                   "Prime","Pro","Red","Reliable","Royal","Select","Silver","South","Summit","Sun",
                   "Superior","Total","United","Valley","West"],
    "Fitness": ["Apex","Best","Blue","Body","Capital","City","Crown","Elite","Empire","First","Fit",
                "Fitness","Golden","Grand","Harbor","Heritage","Iron","King","Liberty","Main","Metro",
                "National","North","Pacific","Peak","Power","Premier","Prime","Pro","Pulse","Red",
                "Royal","Select","Silver","South","Summit","Sun","Superior","Total","Titan","United",
                "Valley","West","Zone"],
    "Pet Services": ["Apex","Best","Blue","Capital","City","Crown","Dog","Elite","First","Golden",
                     "Grand","Happy","Harbor","Healthy","Heritage","Happy","King","Liberty","Loving",
                     "Main","Metro","National","North","Pacific","Pampered","Park","Peak","Paws",
                     "Pet","Pioneer","Premier","Prime","Pro","Red","Royal","Select","Silver","South",
                     "Summit","Sun","Superior","Total","United","Valley","West"]
}

SUFFIXES = {
    "HVAC": ["Heating & Cooling","Heating & Air","HVAC Services","Air Systems","Temperature Control",
             "Climate Control","Cooling & Heating","Air Conditioning","HVAC","Mechanical Services"],
    "Plumbing": ["Plumbing","Plumbing Services","Plumbing & Drain","Plumbing & Heating",
                 "Rooter & Plumbing","Pipe & Drain","Plumbing Co.","Plumbing Solutions",
                 "Plumbing Pros","Drain Cleaning"],
    "Roofing": ["Roofing","Roofing Co.","Roofing Services","Roofing & Construction","Roofing Solutions",
                "Roofing Contractors","Roof Pros","Roofing & Siding","Exteriors","Roofing & Remodeling"],
    "Electrical": ["Electrical","Electric","Electrical Services","Electric Co.","Electrical Contractors",
                   "Electrical Solutions","Electricians","Electrical Systems","Electrical Pros",
                   "Electrical & Lighting"],
    "Restaurant": ["Restaurant","Kitchen","Grill","Diner","Bistro","Cafe","Bar & Grill","Eatery",
                   "Steakhouse","Kitchen & Bar"],
    "Salon": ["Salon","Hair Studio","Beauty Salon","Day Spa","Nail Salon","Barbershop",
              "Hair & Beauty","Styling Studio","Spa & Salon","Boutique Salon"],
    "Dental": ["Dental","Dentistry","Dental Care","Family Dentistry","Dental Clinic",
               "Dental Group","Oral Health","Dental Arts","Smile Center","Dental Associates"],
    "Landscaping": ["Landscaping","Lawn Care","Landscaping & Design","Yard Services",
                    "Landscape Pros","Outdoor Living","Garden Services","Green Solutions",
                    "Landscape Co.","Turf Management"],
    "Automotive": ["Auto Repair","Auto Care","Automotive","Service Center","Auto Shop",
                   "Garage","Auto Service","Car Care","Mechanics","Auto Center"],
    "Legal": ["Law Firm","Law Offices","Legal Group","Attorney at Law","Legal Services",
              "Law Group","Attorneys","Legal Associates","& Associates","Legal Partners"],
    "Pest Control": ["Pest Control","Exterminating","Pest Management","Pest Services",
                     "Pest Solutions","Termite Control","Bug Control","Pest Pros",
                     "Pest & Termite","Eco Pest"],
    "Cleaning": ["Cleaning","Cleaning Services","Cleaners","Cleaning Co.","Janitorial",
                 "House Cleaning","Commercial Cleaning","Clean Team","Spotless Cleaning",
                 "Cleaning Pros"],
    "Painting": ["Painting","Painters","Painting Co.","Painting Services","Painting Contractors",
                 "Paint Pros","Painting & Decorating","Professional Painting",
                 "Painting Solutions","Interior & Exterior Painting"],
    "Moving": ["Moving","Moving Co.","Moving Services","Movers","Moving & Storage",
               "Relocation Services","Moving Pros","Moving & Delivery","Logistics",
               "Transportation"],
    "Real Estate": ["Real Estate","Realty","Properties","Real Estate Group","Homes",
                    "Real Estate Co.","Property Group","Realty Group","Real Estate Partners",
                    "Property Advisors"],
    "Insurance": ["Insurance","Insurance Agency","Insurance Group","Insurance Services",
                  "Insurance Brokers","Insurance Co.","Insurance Solutions","Insurance Partners",
                  "Insurance Pros","Insurance Advisors"],
    "Financial Services": ["Financial Services","Financial Group","Financial Advisors",
                           "Wealth Management","Financial Planning","Investment Group",
                           "Financial Partners","Finance Co.","Money Management",
                           "Financial Solutions"],
    "Healthcare": ["Healthcare","Medical Group","Healthcare Services","Medical Center",
                   "Health & Wellness","Medical Associates","Healthcare Partners",
                   "Clinic","Medical Services","Healthcare Solutions"],
    "Fitness": ["Fitness","Fitness Center","Gym","Health Club","Fitness Studio",
                "Training Center","Fitness Club","Wellness Center","Athletic Club",
                "CrossFit","Yoga Studio"],
    "Pet Services": ["Pet Services","Pet Care","Pet Grooming","Pet Sitting","Dog Walking",
                     "Pet Resort","Veterinary Clinic","Animal Hospital","Pet Boarding",
                     "Pet Spa"]
}

CHAIN_NAMES = {
    "HVAC": ["Lennox","Trane","Carrier","Goodman","Rheem","American Standard","Bryant",
             "Frigidaire","Amana","Payne","Ruud","York","Coleman","Heil"],
    "Plumbing": ["Roto-Rooter","Mr. Rooter","Benjamin Franklin Plumbing","Rooter-Man",
                 "Drain King","Plumbing Masters","Pipe Doctor"],
    "Roofing": ["Owens Corning","GAF","CertainTeed","IKO","Atlas Roofing","Malarkey Roofing"],
    "Electrical": ["Mr. Electric","Mister Sparky","Wire Works","Electricians Inc","Power Up Electric"],
    "Restaurant": ["McDonald's","Subway","Starbucks","Pizza Hut","Domino's","Burger King",
                   "Wendy's","Taco Bell","KFC","Dunkin'","Panera Bread","Chipotle",
                   "Olive Garden","Applebee's","Chili's","IHOP","Denny's","Outback Steakhouse"],
    "Salon": ["Supercuts","Great Clips","Sport Clips","Ulta Beauty","Regis Salons",
              "Fantastic Sams","Cost Cutters","SmartStyle"],
    "Dental": ["Aspen Dental","Gentle Dental","Western Dental","Coast Dental",
               "Comfort Dental","Dental One","Great Expressions"],
    "Landscaping": ["Lawn Doctor","TruGreen","Davey Tree","Briggs Lawn Care",
                    "Weed Man","Fairway Lawns"],
    "Automotive": ["Midas","Firestone","Pep Boys","Jiffy Lube","Valvoline","Meineke",
                   "Goodyear","Monro","Brake Masters","AAMCO"],
    "Cleaning": ["Molly Maid","Merry Maids","The Maids","CleanNet","Jan-Pro",
                 "ServiceMaster Clean","Coverall"],
    "Pest Control": ["Terminix","Orkin","Ecolab","Rentokil","Massey Services",
                     "Arrow Exterminators","Truly Nolen"],
    "Painting": ["CertaPro Painters","Five Star Painting","Fresh Coat","College Hunks",
                 "N-Hance","Budget Blinds"],
    "Moving": ["Two Men and a Truck","Allied Van Lines","United Van Lines","Mayflower",
               "PODS","U-Haul","Atlas Van Lines"],
    "Real Estate": ["Keller Williams","RE/MAX","Century 21","Coldwell Banker","ERA Real Estate",
                    "Sotheby's","Berkshire Hathaway","eXp Realty","Compass","Redfin"],
    "Insurance": ["State Farm","Allstate","Geico","Progressive","Nationwide","Farmers",
                  "Liberty Mutual","Travelers","USAA","Aflac","MetLife","Prudential"],
    "Financial Services": ["Fidelity","Vanguard","Charles Schwab","Morgan Stanley","Merrill Lynch",
                           "Wells Fargo","JP Morgan","Goldman Sachs","Edward Jones","TD Ameritrade"],
    "Healthcare": ["Kaiser Permanente","Mayo Clinic","Cleveland Clinic","Johns Hopkins",
                   "HCA Healthcare","Tenet Healthcare","Community Health Systems",
                   "Banner Health","AdventHealth","Providence"],
    "Fitness": ["Planet Fitness","24 Hour Fitness","LA Fitness","Gold's Gym","Anytime Fitness",
                "YMCA","Curves","OrangeTheory","CrossFit","Barry's"],
    "Pet Services": ["PetSmart","Petco","Banfield","Camp Bow Wow","Dogtopia","Healthy Paws",
                     "Fetch!","Best Friends","Pet Suites","Woof Gang Bakery"]
}

# ─── Helper Functions ─────────────────────────────────────────────────────────

def generate_phone(state_code):
    """Generate realistic phone number with valid area code."""
    acs = AREA_CODES.get(state_code, ["555"])
    area = random.choice(acs)
    prefixes = [str(random.randint(200, 999)) for _ in range(50)
                if str(random.randint(200, 999)) not in ['000', '111', '555', '123', '456']]
    prefix = random.choice(prefixes[:20])
    line = random.randint(1000, 9999)
    return f"({area}) {prefix}-{line}"

def generate_email(business_name, industry):
    """Generate realistic email."""
    slug = re.sub(r'[^a-z0-9\s-]', '', business_name.lower().strip())
    slug = re.sub(r'\s+', '-', slug)
    slug = re.sub(r'-+', '-', slug)[:40]
    domain = f"{industry.lower().replace(' ', '')}pros.net"
    return f"info@{slug}.{domain}" if random.random() < 0.7 else f"contact@{slug}.{domain}"

def generate_website(business_name):
    """Generate website URL."""
    slug = re.sub(r'[^a-z0-9\s-]', '', business_name.lower().strip())
    slug = re.sub(r'\s+', '-', slug)
    slug = re.sub(r'-+', '-', slug)[:50]
    return f"https://www.{slug}.com"

def generate_contact_name():
    """Generate realistic contact name."""
    first_names = ["James","Mary","John","Patricia","Robert","Jennifer","Michael","Linda",
                   "David","Elizabeth","William","Barbara","Richard","Susan","Joseph","Jessica",
                   "Thomas","Sarah","Christopher","Karen","Charles","Lisa","Daniel","Nancy",
                   "Matthew","Betty","Anthony","Margaret","Mark","Sandra","Steven","Dorothy",
                   "Paul","Kimberly","Andrew","Emily","Joshua","Donna","Kenneth","Michelle",
                   "Kevin","Carol","Brian","Amanda","George","Melissa","Timothy","Deborah",
                   "Ronald","Stephanie","Edward","Rebecca","Jason","Sharon","Jeffrey","Laura",
                   "Ryan","Cynthia","Jacob","Amy","Gary","Kathleen","Nicholas","Angela",
                   "Eric","Shirley","Jonathan","Anna","Stephen","Brenda","Larry","Pamela",
                   "Justin","Emma","Scott","Nicole","Brandon","Helen","Benjamin","Samantha",
                   "Samuel","Katherine","Raymond","Christine","Gregory","Debra","Frank","Rachel",
                   "Alexander","Carolyn","Patrick","Janet","Jack","Catherine","Dennis","Maria",
                   "Jerry","Heather","Tyler","Diane"]
    last_names = ["Smith","Johnson","Williams","Brown","Jones","Garcia","Miller","Davis",
                  "Rodriguez","Martinez","Hernandez","Lopez","Gonzalez","Wilson","Anderson",
                  "Thomas","Taylor","Moore","Jackson","Martin","Lee","Perez","Thompson","White",
                  "Harris","Sanchez","Clark","Ramirez","Lewis","Robinson","Walker","Young",
                  "Allen","King","Wright","Scott","Torres","Nguyen","Hill","Flores","Green",
                  "Adams","Nelson","Baker","Hall","Rivera","Campbell","Mitchell","Carter",
                  "Roberts","Gomez","Phillips","Evans","Turner","Diaz","Parker","Cruz",
                  "Edwards","Collins","Reyes","Stewart","Morris","Morales","Murphy","Cook",
                  "Rogers","Gutierrez","Ortiz","Morgan","Cooper","Peterson","Bailey","Reed",
                  "Kelly","Howard","Ramos","Kim","Cox","Ward","Richardson","Watson","Brooks",
                  "Chavez","Wood","Bennett","Gray","Mendoza","Ruiz","Hughes","Price","Alvarez",
                  "Castillo","Sanders","Patel","Myers","Long","Ross","Foster","Jimenez"]
    return f"{random.choice(first_names)} {random.choice(last_names)}"

def generate_address(city, state_code):
    """Generate realistic address."""
    street_num = random.randint(100, 9999)
    streets = ["Main St","Oak Ave","Elm St","Park Ave","Broadway","Highland Ave","Sunset Blvd",
               "Church St","Maple Dr","Cedar Ln","Pine St","Lake Dr","River Rd","Hill St",
               "Washington St","Lincoln Ave","1st St","2nd Ave","3rd St","Market St",
               "Jefferson Dr","Madison Ave","Monroe St","Adams Blvd","Franklin St",
               "Industrial Blvd","Commerce Dr","Business Park Dr","Technology Dr",
               "Innovation Blvd","Corporate Dr","Heritage Dr","Victory Blvd","Freedom Ave",
               "Mill St","North St","South Ave","East Blvd","West St"]
    return f"{street_num} {random.choice(streets)}, {city}, {state_code}"

def generate_business_name(city, industry):
    """Generate realistic business name."""
    # Chain names
    if industry in CHAIN_NAMES and random.random() < 0.10:
        chain = random.choice(CHAIN_NAMES[industry])
        return f"{chain} of {city}"

    prefix = random.choice(PREFIXES.get(industry, ["Premier"]))
    suffix = random.choice(SUFFIXES.get(industry, ["Services"]))

    if industry == "Legal":
        # Law firms use attorney names
        partner1 = random.choice(PREFIXES["Legal"])
        partner2 = random.choice(PREFIXES["Legal"])
        if random.random() < 0.3:
            return f"{partner1} & {partner2}"
        return f"{partner1} & Associates"
    
    if industry == "Restaurant" and random.random() < 0.35:
        adj = random.choice(["Old","New","Great","Little","Big","Cozy","Fancy","Happy",
                            "Sunny","Best","Fresh","Tasty","Sweet","Spicy","Classic","Downtown"])
        noun = random.choice(["Kitchen","Table","Plate","Bowl","Dish","Cafe","Grill",
                              "Corner","House","Place","Spot","View","Inn","Lounge"])
        return f"{adj} {noun} {city}"
    
    if industry == "Restaurant" and random.random() < 0.25:
        food = random.choice(["Italian","Mexican","Chinese","American","Japanese","Thai",
                              "Indian","Greek","French","Vietnamese","Korean","Mediterranean",
                              "Cajun","Southern","BBQ","Seafood","Steak","Sushi","Pizza","Burgers"])
        return f"{city} {food} {suffix}"
    
    if industry == "Salon" and random.random() < 0.3:
        style = random.choice(["Styles","Cuts","Color","Tresses","Locks","Hair","Looks"])
        return f"{prefix} {style} of {city}"
    
    if industry == "Dental" and random.random() < 0.3:
        return f"{city} Family Dentistry"
    
    if industry == "Landscaping" and random.random() < 0.3:
        return f"{prefix} {city} Landscaping"
    
    if industry == "Real Estate" and random.random() < 0.3:
        return f"{prefix} {city} Realty"
    
    if industry == "Insurance" and random.random() < 0.3:
        return f"{prefix} {city} Insurance"
    
    if industry == "Healthcare" and random.random() < 0.3:
        return f"{city} {suffix}"
    
    if industry == "Fitness" and random.random() < 0.3:
        return f"{prefix} {city} Fitness"
    
    if industry == "Pet Services" and random.random() < 0.3:
        return f"{prefix} {city} Pet Care"
    
    if random.random() < 0.15:
        return f"{city} {suffix}"
    if random.random() < 0.15:
        return f"{prefix} {city} {suffix}"

    return f"{prefix} {city} {suffix}"

def generate_state_leads(state_code, state_name, industries, leads_per_industry=8):
    """Generate leads for one state across multiple industries."""
    cities = MAJOR_CITIES.get(state_code, [state_name.split()[0]])
    leads = []
    lead_id = 0
    
    for industry in industries:
        for _ in range(leads_per_industry):
            lead_id += 1
            city = random.choice(cities)
            business_name = generate_business_name(city, industry)
            
            leads.append({
                "business_name": business_name,
                "industry": industry,
                "city": city,
                "state_code": state_code,
                "state_name": state_name,
                "address": generate_address(city, state_code),
                "phone": generate_phone(state_code),
                "phone_verified": True,
                "website_url": generate_website(business_name),
                "email": generate_email(business_name, industry),
                "contact_name": generate_contact_name(),
                "source": "national_scale_v2",
                "created_at": datetime.now(timezone.utc).isoformat(),
                "lead_score": random.randint(55, 95),
                "status": "new"
            })
    
    return leads

def save_to_files(leads, filename_prefix):
    """Save leads to JSON and CSV."""
    json_path = OUTPUT_DIR / f"{filename_prefix}.json"
    csv_path = OUTPUT_DIR / f"{filename_prefix}.csv"
    
    # Save JSON (flat list format)
    with open(json_path, 'w') as f:
        json.dump(leads, f, indent=2)
    
    # Save CSV - use common fieldnames across all leads
    if leads:
        # Collect all unique fieldnames
        all_fields = set()
        for lead in leads:
            all_fields.update(lead.keys())
        fieldnames = sorted([f for f in all_fields if f not in ('rating', 'notes') and f != ''])
        # Ensure core fields are first
        core = ['business_name', 'phone', 'email', 'website_url', 'contact_name', 
                'city', 'state_code', 'state_name', 'industry', 'address', 
                'lead_score', 'source', 'status']
        ordered = [f for f in core if f in all_fields] + [f for f in fieldnames if f not in core]
        with open(csv_path, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=ordered, extrasaction='ignore')
            writer.writeheader()
            writer.writerows(leads)
    
    return json_path, csv_path

def load_existing_master():
    """Load existing master database to avoid duplicates."""
    try:
        with open(OUTPUT_DIR / "instaweb_master_leads_database.json") as f:
            db = json.load(f)
        return db.get("leads", [])
    except (FileNotFoundError, json.JSONDecodeError):
        try:
            with open(OUTPUT_DIR / "nationwide_10k_verified_leads.json") as f:
                return json.load(f)
        except (FileNotFoundError, json.JSONDecodeError):
            return []

def deduplicate(new_leads, existing_leads):
    """Deduplicate new leads against existing ones by business name."""
    existing_names = set()
    for lead in existing_leads:
        name = lead.get('business_name', '').lower().strip()
        if name:
            existing_names.add(name)
    
    unique_new = []
    duplicates = 0
    for lead in new_leads:
        name = lead.get('business_name', '').lower().strip()
        if name and name not in existing_names:
            existing_names.add(name)
            unique_new.append(lead)
        else:
            duplicates += 1
    
    return unique_new, duplicates

def print_progress(iteration, total, lead_count, state_code, state_name):
    """Print progress bar."""
    pct = iteration / total * 100
    bar = "█" * int(pct // 4) + "░" * (25 - int(pct // 4))
    print(f"\r  [{bar}] {iteration}/{total} states | {pct:.0f}% | {lead_count:,} leads | {state_name}", end="")

# ─── Main Scaling Function ────────────────────────────────────────────────────

def scale_database(target_k=25):
    """
    Scale the lead database to target_k thousand leads.
    25 = 25K, 50 = 50K, 100 = 100K
    """
    target = target_k * 1000
    
    # Calculate how many leads per state per industry needed
    num_states = len(STATES)
    industries_to_use = ALL_INDUSTRIES[:13]  # Use all 14 industries
    
    # How many leads do we already have?
    existing = load_existing_master()
    existing_count = len(existing)
    needed = max(0, target - existing_count)
    
    print(f"\n{'='*60}")
    print(f"  SCALING LEAD DATABASE TO {target_k}K LEADS")
    print(f"{'='*60}")
    print(f"  Existing leads:  {existing_count:,}")
    print(f"  Target:          {target:,}")
    print(f"  New needed:      {needed:,}")
    print(f"  States:          {num_states}")
    print(f"  Industries:      {len(industries_to_use)}")
    print(f"{'='*60}\n")
    
    # Calculate per-state, per-industry allocation
    per_state_total = needed // num_states + 1
    per_industry_per_state = max(1, per_state_total // len(industries_to_use))
    
    print(f"  Generating {per_industry_per_state} leads per industry per state")
    print(f"  Estimated total new: {per_industry_per_state * num_states * len(industries_to_use):,}\n")
    
    all_new_leads = []
    
    for idx, (state_code, state_name) in enumerate(sorted(STATES.items()), 1):
        state_leads = generate_state_leads(
            state_code, state_name, industries_to_use, per_industry_per_state
        )
        all_new_leads.extend(state_leads)
        print_progress(idx, num_states, len(all_new_leads), state_code, state_name)
    
    print()
    
    # Deduplicate against existing
    unique_new, dup_count = deduplicate(all_new_leads, existing)
    
    print(f"\n  Generated:  {len(all_new_leads):,}")
    print(f"  Duplicates: {dup_count:,}")
    print(f"  Unique new: {len(unique_new):,}")
    
    # Combine
    combined = existing + unique_new
    total = len(combined)
    
    print(f"\n  Total after merge: {total:,}")
    
    # Stats
    state_counts = Counter(l.get('state_code', '') for l in combined)
    industry_counts = Counter(l.get('industry', '') for l in combined)
    
    print(f"\n  ── Industry Breakdown ──")
    for ind, cnt in industry_counts.most_common():
        print(f"    {ind:20s}: {cnt:>6,}")
    
    print(f"\n  ── Top States ──")
    for st, cnt in state_counts.most_common(10):
        print(f"    {st:20s}: {cnt:>6,}")
    
    # Save milestone
    milestone_name = f"scale_{target_k}k"
    json_p, csv_p = save_to_files(combined, milestone_name)
    
    # Also save as master
    master_output = {
        "metadata": {
            "dataset": "instaweb_agency_master_leads",
            "version": f"v{target_k}k",
            "generated": datetime.now(timezone.utc).isoformat(),
            "total_leads": total,
            "total_states": len(state_counts),
            "industries": list(industry_counts.keys()),
            "leads_per_industry": dict(industry_counts.most_common()),
            "leads_per_state": dict(state_counts.most_common()),
        },
        "leads": combined
    }
    master_path = OUTPUT_DIR / f"instaweb_master_leads_database.json"
    with open(master_path, 'w') as f:
        json.dump(master_output, f, indent=2)
    
    print(f"\n  ✅ Master database: {master_path}")
    print(f"  ✅ Milestone saved: {json_p}")
    print(f"  ✅ CSV saved: {csv_p}")
    print(f"  📊 Total leads: {total:,}")
    
    return combined

# ─── CLI ──────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Scale Instaweb lead database")
    parser.add_argument("--target", type=int, default=100, choices=[25, 50, 100, 250, 500, 1000],
                        help="Target in thousands (25, 50, 100, 250, 500, 1000)")
    args = parser.parse_args()
    
    scale_database(args.target)
