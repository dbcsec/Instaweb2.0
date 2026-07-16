#!/usr/bin/env node
/**
 * Instaweb Demo Site Builder
 * Usage: node build_demo.js "Business Name" "Phone" "Industry" "City" "State"
 * 
 * Takes the Gold Standard HVAC template (elite-trade.html) and swaps in
 * business-specific details. Outputs a ready-to-deploy HTML file.
 */

const fs = require('fs');
const path = require('path');

const TEMPLATE_PATH = '/home/team/shared/instaweb-unified/templates/elite-trade.html';
const OUTPUT_DIR = '/home/team/shared/instaweb-unified/data/demos/output';

const args = process.argv.slice(2);
if (args.length < 3) {
    console.log('Usage: node build_demo.js "Business Name" "Phone" "Industry" "City" "State"');
    console.log('Example: node build_demo.js "Air Tech of Houston" "(832) 555-0100" "HVAC" "Houston" "TX"');
    process.exit(1);
}

const businessName = args[0];
const phone = args[1] || '(555) 000-0000';
const industry = args[2] || 'HVAC';
const city = args[3] || 'Houston';
const state = args[4] || 'TX';

const slug = businessName.toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');

const taglines = {
    'HVAC': 'Keeping Houston Comfortable — 24/7 Service',
    'Plumbing': 'Trusted Plumbing Services — When You Need Us Most',
    'Roofing': 'Protecting Homes Across Houston — Quality Roofing',
    'Electrical': 'Powering Houston — Safe & Reliable Electrical',
    'Restaurant': 'Serving Houston — Fresh Food, Great Taste',
    'default': 'Premium Service You Can Trust'
};

const tagline = taglines[industry] || taglines.default;

const services = {
    'HVAC': ['AC Installation', 'Heating Repair', 'Maintenance Plans', 'Emergency Service'],
    'Plumbing': ['Drain Cleaning', 'Pipe Repair', 'Water Heaters', 'Emergency Plumbing'],
    'Roofing': ['Roof Repair', 'New Roof Installation', 'Storm Damage', 'Inspections'],
    'Electrical': ['Wiring & Rewiring', 'Panel Upgrades', 'Lighting Installation', 'Emergency Electrical'],
    'default': ['Installation', 'Repair & Maintenance', 'Emergency Service', 'Preventative Plans']
};

const bizServices = services[industry] || services.default;

try {
    let template = fs.readFileSync(TEMPLATE_PATH, 'utf-8');
    
    const replacements = {
        '{{business_name}}': businessName,
        '{{tagline}}': tagline,
        '{{phone}}': phone,
        '{{city}}': city,
        '{{state}}': state,
        '{{years_in_business}}': '15+',
        '{{review_count}}': '200+',
        '{{demo_url}}': `https://instaweb.agency/demos/${slug}`,
        '{{services.[0].name}}': bizServices[0],
        '{{services.[1].name}}': bizServices[1],
        '{{services.[2].name}}': bizServices[2],
        '{{services.[3].name}}': bizServices[3],
    };
    
    for (const [key, value] of Object.entries(replacements)) {
        template = template.split(key).join(value);
    }
    
    if (!fs.existsSync(OUTPUT_DIR)) {
        fs.mkdirSync(OUTPUT_DIR, { recursive: true });
    }
    
    const outputPath = path.join(OUTPUT_DIR, `${slug}.html`);
    fs.writeFileSync(outputPath, template);
    
    console.log(`✅ Demo site built: ${outputPath}`);
    console.log(`   Business: ${businessName}`);
    console.log(`   Industry: ${industry}`);
    console.log(`   Phone: ${phone}`);
    console.log(`   URL: https://instaweb.agency/demos/${slug}`);
    
} catch (e) {
    console.error('ERROR:', e.message);
}