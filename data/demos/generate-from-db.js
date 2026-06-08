#!/usr/bin/env node

/**
 * Instaweb - Generate Demos from DB Leads
 * 
 * Reads leads from the shared database and generates personalized demo sites.
 * Usage: node pipeline/generate-from-db.js [--limit N] [--min-score N]
 */

const { execSync } = require('child_process');
const path = require('path');
const fs = require('fs');

const ROOT_DIR = path.resolve(__dirname, '..');
const OUTPUT_DIR = path.resolve(ROOT_DIR, 'output');

// Parse args
const limitIdx = process.argv.indexOf('--limit');
const minScoreIdx = process.argv.indexOf('--min-score');
const LIMIT = limitIdx > -1 ? parseInt(process.argv[limitIdx + 1]) : 50;
const MIN_SCORE = minScoreIdx > -1 ? parseInt(process.argv[minScoreIdx + 1]) : 70;

console.log('');
console.log('╔══════════════════════════════════════════════╗');
console.log('║    Instaweb DB → Demo Pipeline               ║');
console.log('╚══════════════════════════════════════════════╝');
console.log('');
console.log(`  Filter: min_score=${MIN_SCORE}, limit=${LIMIT}`);
console.log('');

function runTeamDb(sql) {
  const result = execSync(`team-db "${sql.replace(/"/g, '\\"')}"`, {
    encoding: 'utf-8',
    timeout: 30000
  });
  return JSON.parse(result);
}

try {
  // Query leads from database
  const leads = runTeamDb(
    `SELECT id, business_name, industry, city, state_code, phone, email, lead_score, source, notes ` +
    `FROM leads WHERE lead_score >= ${MIN_SCORE} ORDER BY lead_score DESC LIMIT ${LIMIT}`
  );

  if (!leads || leads.length === 0) {
    console.log('  ℹ  No leads found matching criteria.');
    console.log('  ℹ  Trying to get all leads without score filter...');
    
    // Try broader query
    const allLeads = runTeamDb(
      `SELECT id, business_name, industry, city, state_code, phone, lead_score, source FROM leads LIMIT ${LIMIT}`
    );
    
    if (!allLeads || allLeads.length === 0) {
      console.error('  ✗ No leads found in database at all.');
      process.exit(1);
    }
    
    console.log(`  ✓ Found ${allLeads.length} lead(s) (unfiltered)`);
    
    // Map to pipeline format and save
    const pipelineLeads = allLeads.map(l => ({
      id: l.id || `lead-${Date.now()}`,
      business_name: l.business_name,
      industry: l.industry || 'HVAC',
      city: l.city || 'Your City',
      state: l.state_code || 'TX',
      phone: l.phone,
      email: l.email || `info@${(l.business_name || 'business').replace(/\s+/g, '').toLowerCase()}.com`,
      contact_name: l.notes?.replace(/^Target for.*$/, '').trim() || l.business_name
    }));
    
    // Write leads file
    const leadsFile = path.resolve(ROOT_DIR, 'pipeline', 'leads.json');
    fs.writeFileSync(leadsFile, JSON.stringify(pipelineLeads, null, 2), 'utf-8');
    console.log(`  ✓ Saved ${pipelineLeads.length} lead(s) to ${leadsFile}`);
    console.log('');
    console.log('  ➤  Run the demo generator:');
    console.log(`     node pipeline/generate-demos.js --input ${leadsFile}`);
    
  } else {
    console.log(`  ✓ Found ${leads.length} lead(s) with score >= ${MIN_SCORE}`);
    
    // Map to pipeline format
    const pipelineLeads = leads.map(l => ({
      id: l.id || `lead-${Date.now()}`,
      business_name: l.business_name,
      industry: l.industry || 'HVAC',
      city: l.city || 'Your City',
      state: l.state_code || 'TX',
      phone: l.phone,
      email: l.email || `info@${(l.business_name || 'business').replace(/\s+/g, '').toLowerCase()}.com`,
      contact_name: l.notes?.replace(/^Target for.*$/, '').trim() || l.business_name
    }));
    
    // Write leads file
    const leadsFile = path.resolve(ROOT_DIR, 'pipeline', 'leads.json');
    fs.writeFileSync(leadsFile, JSON.stringify(pipelineLeads, null, 2), 'utf-8');
    console.log(`  ✓ Saved ${pipelineLeads.length} lead(s) to ${leadsFile}`);
    console.log('');
    console.log('  ➤  Run the demo generator:');
    console.log(`     node pipeline/generate-demos.js --input ${leadsFile}`);
  }

} catch (err) {
  if (err.message.includes('locked')) {
    console.error('  ✗ Database is locked by another process (agent-hunter-1 is inserting leads).');
    console.error('  ℹ  Please retry when the lock clears.');
    console.error('');
    console.error('  Quick retry:');
    console.error('     node pipeline/generate-from-db.js');
  } else {
    console.error('  ✗ Error:', err.message);
  }
  process.exit(1);
}