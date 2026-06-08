#!/usr/bin/env node

/**
 * List generated demos
 */
const fs = require('fs');
const path = require('path');

const manifestPath = path.resolve(__dirname, '..', 'output', 'manifest.json');

if (!fs.existsSync(manifestPath)) {
  console.log('No demos generated yet. Run: node pipeline/generate-demos.js');
  process.exit(0);
}

const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf-8'));

console.log('');
console.log('╔══════════════════════════════════════════════╗');
console.log('║       Generated Demo Sites                   ║');
console.log('╚══════════════════════════════════════════════╝');
console.log('');

for (const r of manifest.results) {
  console.log(`  ${r.business_name}`);
  console.log(`     Industry: ${r.industry}`);
  console.log(`     Template: ${r.template}`);
  console.log(`     File:     ${r.file}`);
  console.log('');
}

console.log(`  Total: ${manifest.total} demo(s)`);
console.log('');