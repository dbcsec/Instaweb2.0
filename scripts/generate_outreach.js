const fs = require('fs');
const path = require('path');

const LEADS_FILE = '/home/team/shared/enriched_leads.json';
const DEMO_DIR = '/home/team/shared/instaweb-demo-engine/full_output_recovery/';
const OUTPUT_FILE = 'outreach_emails_batch_1.json';

const PAYMENT_HIERARCHY = [
    'Square (Primary)',
    'CashApp',
    'Venmo',
    'Chime'
];

const PAYMENT_PLACEHOLDER = "https://checkout.square.com/p/placeholder-link";

function slugify(text) {
    return text.toString().toLowerCase()
        .replace(/\s+/g, '-')           // Replace spaces with -
        .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
        .replace(/\-\-+/g, '-')         // Replace multiple - with single -
        .replace(/^-+/, '')             // Trim - from start of text
        .replace(/-+$/, '');            // Trim - from end of text
}

function getTemplate(industry) {
    if (['HVAC', 'Roofing'].includes(industry)) {
        return {
            subject: "Your New Website for {{business_name}} is Ready",
            body: `Hi {{contact_name}},

I hope you're having a great week.

I'm reaching out because we've just finished a custom demo website for {{business_name}}. Since you're a leader in {{industry}} in {{city}}, we wanted to show you what a modern, high-converting site could look like for your business.

You can view your custom demo here: {{demo_url}}

Our sites are designed to turn visitors into leads. If you like what you see, we can have your full site live on your own domain in less than 24 hours.

Pricing is simple:
- $399 one-time setup fee
- $248/mo for hosting, maintenance, and unlimited updates.

If you're ready to move forward, you can start here: {{payment_link}}
(We accept Square, CashApp, Venmo, and Chime)

Or, if you have any questions, just reply to this email!

Best,
Instaweb Team`
        };
    } else {
        return {
            subject: "Your New Website for {{business_name}} is Ready",
            body: `Hi {{contact_name}},

I hope you're doing well.

We've been working on a new digital presence for {{business_name}}, and I'm excited to share a personalized demo with you. As a top-rated restaurant in {{city}}, we think you'll love how this looks and how easy it makes it for customers to find your menu and book a table.

View your demo here: {{demo_url}}

We specialize in high-end restaurant websites that drive more covers and simplify online discovery. We can have your full site live in under 24 hours.

Simple pricing:
- $399 one-time setup fee
- $248/mo for hosting, maintenance, and support.

Ready to go? Get started here: {{payment_link}}
(We accept Square, CashApp, Venmo, and Chime)

Feel free to reply if you'd like to chat or make any changes.

Cheers,
Instaweb Team`
        };
    }
}

function main() {
    const leads = JSON.parse(fs.readFileSync(LEADS_FILE, 'utf8'));
    const outreach = [];
    let count = 0;

    for (const lead of leads) {
        if (count >= 100) break;

        const businessSlug = slugify(lead.business_name);
        const templateType = ['HVAC', 'Roofing'].includes(lead.industry) ? 'modern-trade' : 'elegant-food';
        const demoFilename = `${businessSlug}-${templateType}.html`;
        const demoPath = path.join(DEMO_DIR, demoFilename);

        if (fs.existsSync(demoPath)) {
            const template = getTemplate(lead.industry);
            const demoUrl = `http://3000-sandbox-hostname.domain/full_output_recovery/${demoFilename}`; // Placeholder hostname
            
            let body = template.body
                .replace(/{{business_name}}/g, lead.business_name)
                .replace(/{{contact_name}}/g, lead.owner_name || 'there')
                .replace(/{{industry}}/g, lead.industry)
                .replace(/{{city}}/g, lead.city)
                .replace(/{{demo_url}}/g, demoUrl)
                .replace(/{{payment_link}}/g, PAYMENT_PLACEHOLDER);

            outreach.push({
                to: lead.email,
                subject: template.subject.replace(/{{business_name}}/g, lead.business_name),
                body: body,
                lead_id: lead.id || lead.business_name
            });
            count++;
        }
    }

    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(outreach, null, 2));
    console.log(`Generated ${outreach.length} outreach emails.`);
}

main();
