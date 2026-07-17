const fs = require('fs');
const https = require('https');

// ===== CONFIG =====
const apiKey = process.env.RESEND_API_KEY || '';
const from = 'Instaweb Agency <sales@mail.instaweb.agency>';
const subject = 'Quick question for {{NAME}}';

// ===== PLAIN TEXT VERSION =====
function plainText(name, demoUrl, phone) {
  return `Hi ${name},

We built a premium website for your business — completely free, zero obligation.

View your live demo: ${demoUrl}

Every site includes:
- Custom design for your industry
- Mobile-first, fast-loading
- SEO-optimized for local search
- Google Business Profile integration

Your site is live right now. If you like it, we can keep it running with hosting, updates, and new leads delivered weekly — starting at just $99/mo.

No push. No sales call. Just a site that actually looks like it cost ten grand.

Call us: ${phone}

Best,
Instaweb Agency
https://instaweb.agency`;

// ===== HTML VERSION (small, no SVG, images hosted on domain) =====
function htmlBody(name, demoUrl, phone) {
  return `<!DOCTYPE html>
<html><body style="margin:0;padding:0;background:#f1f5f9;font-family:Arial,Helvetica,sans-serif">
<table width="100%" cellpadding="0" cellspacing="0"><tr><td align="center" style="padding:24px">
<table width="520" cellpadding="0" cellspacing="0" style="background:#fff;border-radius:12px">
<tr><td style="padding:32px">
<div style="font-size:20px;font-weight:700;margin-bottom:16px">Insta<span style="color:#f97316">web</span></div>
<p style="color:#334155;font-size:15px;line-height:1.6">Hi ${name},</p>
<p style="color:#334155;font-size:15px;line-height:1.6">We built a premium website for your business — completely free, zero obligation.</p>
<p style="color:#334155;font-size:15px;line-height:1.6;margin:16px 0">
<a href="${demoUrl}" style="color:#6366f1;font-weight:600">${demoUrl}</a>
</p>
<div style="background:#0f172a;border-radius:8px;padding:16px;margin:16px 0;color:#e2e8f0;font-size:13px">
<div style="display:flex;gap:8px;padding:4px 0">✓ Custom design for your industry</div>
<div style="display:flex;gap:8px;padding:4px 0">✓ Mobile-first, fast-loading</div>
<div style="display:flex;gap:8px;padding:4px 0">✓ SEO-optimized for local search</div>
</div>
<p style="color:#334155;font-size:14px;line-height:1.6">Your site is live now. If you like it, keep it running with hosting, updates, and leads — starting at $99/mo.</p>
<a href="${demoUrl}" style="display:inline-block;padding:12px 24px;background:#facc15;color:#0f172a;text-decoration:none;border-radius:6px;font-weight:700;font-size:14px;margin:12px 0">View Your Site</a>
<p style="color:#64748b;font-size:13px;margin-top:16px;padding-top:12px;border-top:1px solid #e2e8f0">Instaweb Agency — <a href="https://instaweb.agency" style="color:#6366f1">instaweb.agency</a></p>
</td></tr></table>
</td></tr></table>
</body></html>`;
}

// ===== SEND FUNCTION =====
function sendEmail(to, name, demoUrl, phone) {
  return new Promise((resolve, reject) => {
    const body = JSON.stringify({
            from: from,
            to: [to],
            reply_to: ['instaweb-agency-2-0-86138e51@ctomail.io'],
            subject: subject.replace('{{NAME}}', name),
      text: plainText(name, demoUrl, phone),
      html: htmlBody(name, demoUrl, phone)
    });
    const req = https.request({
      hostname: 'api.resend.com',
      path: '/emails',
      method: 'POST',
      headers: { 'Authorization': 'Bearer ' + apiKey, 'Content-Type': 'application/json' }
    }, res => {
      let d = '';
      res.on('data', c => d += c);
      res.on('end', () => resolve({ status: res.statusCode, data: d }));
    });
    req.on('error', reject);
    req.write(body);
    req.end();
  });
}

// ===== MAIN =====
async function main() {
  let leads = JSON.parse(fs.readFileSync('/tmp/emails.json', 'utf8'));
  let sent = 0, errors = 0;
  console.log('Sending ' + leads.length + ' emails with plain text + HTML...');
  for (let i = 0; i < leads.length; i++) {
    const l = leads[i];
    const slug = l.business_name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
    const demoUrl = 'https://instaweb.agency/demo/' + slug;
    try {
      const r = await sendEmail(l.email, l.business_name, demoUrl, l.phone || '');
      if (r.status === 200) sent++;
      else { errors++; console.log('ERR ' + r.status + ': ' + l.email); }
    } catch(e) { errors++; }
    if ((i+1) % 50 === 0) console.log((i+1) + '/' + leads.length + ' - ' + sent + ' sent, ' + errors + ' errors');
    await new Promise(r => setTimeout(r, 120));
  }
  console.log('DONE! ' + sent + ' sent, ' + errors + ' errors');
  process.exit(0);
}
main();
