#!/usr/bin/env node

/**
 * Instaweb Demo Server
 * Simple HTTP server to preview generated demo sites.
 * 
 * Usage: node pipeline/serve-demos.js [--port PORT]
 */

const http = require('http');
const fs = require('fs');
const path = require('path');

const ROOT_DIR = path.resolve(__dirname, '..');
const OUTPUT_DIR = path.resolve(ROOT_DIR, 'output');
const PORT = parseInt(process.argv.find(a => a.startsWith('--port='))?.split('=')[1] || process.argv[process.argv.indexOf('--port') + 1] || 3000);

const MIME_TYPES = {
  '.html': 'text/html',
  '.css': 'text/css',
  '.js': 'text/javascript',
  '.json': 'application/json',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon'
};

const server = http.createServer((req, res) => {
  let url = req.url.split('?')[0];
  if (url === '/') url = '/index.html';
  
  const filePath = path.join(OUTPUT_DIR, url);
  
  // Security: prevent directory traversal
  if (!filePath.startsWith(OUTPUT_DIR)) {
    res.writeHead(403);
    res.end('Forbidden');
    return;
  }

  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/html' });
      res.end(`<h1>404 - Demo Not Found</h1><p>${url}</p><a href="/">← Back to demo index</a>`);
      return;
    }
    
    const ext = path.extname(filePath);
    const contentType = MIME_TYPES[ext] || 'application/octet-stream';
    res.writeHead(200, { 'Content-Type': contentType });
    res.end(data);
  });
});

server.listen(PORT, '0.0.0.0', () => {
  console.log('');
  console.log('╔══════════════════════════════════════════════╗');
  console.log('║       Instaweb Demo Preview Server           ║');
  console.log('╚══════════════════════════════════════════════╝');
  console.log('');
  console.log(`  📍 Local:   http://0.0.0.0:${PORT}`);
  console.log(`  📁 Serving: ${OUTPUT_DIR}`);
  console.log('');
  console.log('  Press Ctrl+C to stop');
  console.log('');
});