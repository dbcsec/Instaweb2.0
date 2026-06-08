const { Resend } = require('resend');
const fs = require('fs');
const path = require('path');

const OUTREACH_FILE = '/home/team/shared/outreach_full.json';
const SENT_LOG = '/home/team/shared/sent_emails.log';
const API_KEYS_FILE = '/home/team/shared/configs/api_keys.json';

async function main() {
    // Load API Key
    const configBody = fs.readFileSync(API_KEYS_FILE, 'utf8');
    const config = JSON.parse(configBody);
    const resendApiKey = config.RESEND_API_KEY;

    if (!resendApiKey) {
        console.error('RESEND_API_KEY not found');
        process.exit(1);
    }

    const resend = new Resend(resendApiKey);

    // Load Outreach Leads
    if (!fs.existsSync(OUTREACH_FILE)) {
        console.error(`Outreach file not found: ${OUTREACH_FILE}`);
        process.exit(1);
    }
    const outreach = JSON.parse(fs.readFileSync(OUTREACH_FILE, 'utf8'));

    // Load Sent Log to identify sent emails
    const sentContent = fs.existsSync(SENT_LOG) ? fs.readFileSync(SENT_LOG, 'utf8') : '';
    const sentEmails = new Set();
    
    // Parse the log to find successful sends (both AgentMail and Resend format)
    const lines = sentContent.split('\n');
    for (const line of lines) {
        if (line.includes(' - SUCCESS - ')) {
            const parts = line.split(' - SUCCESS - ');
            if (parts.length > 1) {
                const emailPart = parts[1].split(' - ')[0];
                sentEmails.add(emailPart.trim());
            }
        }
    }

    console.log(`Found ${sentEmails.size} already sent emails.`);

    const BATCH_LIMIT = parseInt(process.env.BATCH_LIMIT || '50');
    let count = 0;
    let skipped = 0;

    for (let i = 0; i < outreach.length; i++) {
        const item = outreach[i];
        
        if (sentEmails.has(item.to)) {
            skipped++;
            continue;
        }

        if (count >= BATCH_LIMIT) {
            console.log(`Reached batch limit of ${BATCH_LIMIT}. Stopping.`);
            break;
        }

        try {
            console.log(`[${i}] Sending to ${item.to}...`);
            const { data, error } = await resend.emails.send({
                from: 'Instaweb Agency <info@instaweb.agency>',
                to: [item.to],
                subject: item.subject,
                html: item.body.replace(/\n/g, '<br>'), // Simple text to html conversion
            });

            if (error) {
                console.error(`Failed to send to ${item.to}:`, error.message);
                fs.appendFileSync(SENT_LOG, `${new Date().toISOString()} - FAILURE - ${item.to} - Error: ${error.message}\n`);
                
                if (error.message.includes('Daily send limit exceeded')) {
                    console.log('Daily send limit hit. Terminating batch.');
                    break;
                }
            } else {
                fs.appendFileSync(SENT_LOG, `${new Date().toISOString()} - SUCCESS - ${item.to} - MsgId: ${data.id}\n`);
                sentEmails.add(item.to);
                count++;
                console.log(`[${count}/${BATCH_LIMIT}] Successfully sent to ${item.to}`);
            }
        } catch (err) {
            console.error(`Unexpected error for ${item.to}:`, err.message);
            fs.appendFileSync(SENT_LOG, `${new Date().toISOString()} - FAILURE - ${item.to} - Error: ${err.message}\n`);
        }

        // Delay to avoid burst rate limits
        await new Promise(resolve => setTimeout(resolve, 500));
    }

    console.log(`Batch Summary: Sent ${count}, Skipped ${skipped}.`);
}

main().catch(console.error);
