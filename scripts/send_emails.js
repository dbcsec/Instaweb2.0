const fs = require('fs');
const { execSync } = require('child_process');

const EMAILS_FILE = 'data/outreach/outreach_emails_batch_1.json';

// Note: This script requires setupInbox to have been called successfully.
// Since setupInbox is currently failing due to webhook issues, 
// this script is provided as the final step in the pipeline.

async function sendEmails() {
    if (!fs.existsSync(EMAILS_FILE)) {
        console.error("Emails file not found. Run generate_outreach.js first.");
        return;
    }

    const emails = JSON.parse(fs.readFileSync(EMAILS_FILE, 'utf8'));
    console.log(`Starting outreach for ${emails.length} leads...`);

    for (const email of emails) {
        console.log(`Sending email to ${email.to}...`);
        
        // This is a placeholder for the actual sendEmail tool call
        // In a real agent environment, we would use the sendEmail tool.
        // Since we are script-based here, we might use a CLI tool if available
        // or wait for the inbox fix.
        
        /* 
        try {
            // Simulated tool call
            // await sendEmail({
            //     to: email.to,
            //     subject: email.subject,
            //     body: email.body
            // });
            console.log(`Successfully sent to ${email.to}`);
        } catch (error) {
            console.error(`Failed to send to ${email.to}:`, error);
        }
        */
        
        // For now, we log the intent.
        fs.appendFileSync('outreach_logs.txt', `[${new Date().toISOString()}] Intent to send to ${email.to} | Subject: ${email.subject}\n`);
    }

    console.log("Batch outreach complete (Simulation/Logs only).");
}

sendEmails();
