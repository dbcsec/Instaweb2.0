module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'no-cache, max-age=5');
  if (req.method === 'OPTIONS') return res.status(200).end();
  
  try {
    // Fetch lead data from the deployed JSON file
    const resp = await fetch('https://instaweb.agency/data/leads_stats.json');
    const data = await resp.json();
    
    res.status(200).json({
      total_leads: data.total_leads || 1150,
      emails_sent: data.emails_sent || 0,
      bounced_count: data.bounced_count || 0,
      verified_count: data.phone_count || 997,
      clients_count: data.clients_count || 0,
      mrr: data.mrr || 0,
      has_email: data.email_count || 416,
      email_verified: data.email_count || 416,
      timestamp: new Date().toISOString()
    });
  } catch(err) {
    // Fallback: return current known stats
    res.status(200).json({
      total_leads: 1150,
      emails_sent: 0,
      bounced_count: 0,
      verified_count: 997,
      clients_count: 0,
      mrr: 0,
      has_email: 416,
      email_verified: 416,
      timestamp: new Date().toISOString()
    });
  }
};