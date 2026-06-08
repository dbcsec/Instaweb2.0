#!/usr/bin/env node

/**
 * Instaweb Bulk Demo Generation Pipeline
 * 
 * Takes lead data from agent-hunter-1 and generates personalized
 * demo websites using the Modern Trade and Elegant Food templates.
 * 
 * Usage:
 *   node pipeline/generate-demos.js [--input path/to/leads.json] [--output path/to/output]
 * 
 * Input format (leads.json):
 *   [
 *     {
 *       "id": "lead-001",
 *       "business_name": "ABC HVAC Services",
 *       "industry": "HVAC",
 *       "city": "Houston",
 *       "state": "TX",
 *       "phone": "(713) 555-0123",
 *       "email": "info@abchvac.com",
 *       "contact_name": "John Smith",
 *       ...
 *     }
 *   ]
 */

const fs = require('fs');
const path = require('path');

// === Configuration ===
const ROOT_DIR = path.resolve(__dirname, '..');
const TEMPLATES_DIR = path.resolve(ROOT_DIR, 'templates');
const OUTPUT_DIR = path.resolve(ROOT_DIR, 'output');
const DEFAULT_INPUT = path.resolve(ROOT_DIR, 'pipeline', 'leads.json');

// === Template Registry ===
const TEMPLATES = {
  'modern-trade': {
    dir: 'modern-trade',
    industries: ['HVAC', 'Roofing'],
    description: 'Bold industrial template for trade service businesses'
  },
  'elegant-food': {
    dir: 'elegant-food',
    industries: ['Restaurant', 'Food Service'],
    description: 'Sophisticated template for restaurants and food service'
  }
};

// === Helpers ===
function getTemplateForIndustry(industry) {
  for (const [key, tmpl] of Object.entries(TEMPLATES)) {
    if (tmpl.industries.includes(industry)) {
      return key;
    }
  }
  // Default to modern-trade for unknown
  console.warn(`  ⚠  No template found for industry "${industry}". Using modern-trade as fallback.`);
  return 'modern-trade';
}

function generateStars(rating) {
  const full = Math.floor(rating);
  const half = rating % 1 >= 0.5 ? 1 : 0;
  const empty = 5 - full - half;
  let stars = '';
  for (let i = 0; i < full; i++) stars += '<i class="fas fa-star"></i>';
  if (half) stars += '<i class="fas fa-star-half-alt"></i>';
  for (let i = 0; i < empty; i++) stars += '<i class="far fa-star"></i>';
  return stars;
}

function getInitials(name) {
  if (!name) return '?';
  return name.split(' ').map(w => w[0]).join('').toUpperCase().slice(0, 2);
}

function slugify(text) {
  return text.toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 60);
}

// === Data Enrichment: Generate realistic demo content for a lead ===
function enrichLead(lead) {
  const industry = lead.industry || 'HVAC';
  const short = lead.business_name?.replace(/\s+(Services|LLC|Inc|Roofing|HVAC|Restaurant|Grill|Cafe|Bar)$/i, '') || lead.business_name || 'Your Business';
  
  // Base enrichment
  const enriched = {
    ...lead,
    business_name_short: short.slice(0, 20),
    tagline: lead.tagline || getDefaultTagline(industry),
    meta_description: lead.meta_description || getDefaultMeta(lead.business_name, industry, lead.city),
    badge_text: lead.badge_text || getBadge(industry),
    hero_headline: lead.hero_headline || getHeroHeadline(industry),
    hero_highlight: lead.hero_highlight || getHeroHighlight(industry),
    hero_subtext: lead.hero_subtext || getHeroSubtext(industry, lead.city),
    cta_primary: lead.cta_primary || getCTA(industry),
    cta_secondary: lead.cta_secondary || 'Learn More →',
    phone_number: lead.phone || '(555) 000-0000',
    email: lead.email || 'info@example.com',
    city: lead.city || 'Your City',
    state: lead.state || 'TX',
    year: new Date().getFullYear(),
    footer_description: getFooterDescription(industry, lead.city),
    services_subtitle: getServicesSubtitle(industry),
    about_text_1: getAboutText1(industry, lead.business_name),
    about_text_2: getAboutText2(industry),
    about_quote: getQuote(industry),
    about_quote_author: lead.contact_name || lead.business_name || 'Our Team',
    testimonials_subtitle: getTestimonialsSubtitle(industry),
    cta_headline: getCTAHeadline(industry),
    cta_subtext: getCTASubtext(industry),
  };

  // Industry-specific arrays
  enriched.services = lead.services || getDefaultServices(industry);
  enriched.about_features = lead.about_features || getAboutFeatures(industry);
  enriched.testimonials = lead.testimonials || getDefaultTestimonials(industry, lead.business_name);
  enriched.hours = lead.hours || getDefaultHours();
  enriched.footer_services = lead.footer_services || getFooterServices(industry);

  // Stats (for Modern Trade hero card)
  enriched.stat_1_value = lead.stat_1_value || '15+';
  enriched.stat_1_label = lead.stat_1_label || 'Years Exp.';
  enriched.stat_2_value = lead.stat_2_value || '2,500+';
  enriched.stat_2_label = lead.stat_2_label || 'Projects';
  enriched.stat_3_value = lead.stat_3_value || '98%';
  enriched.stat_3_label = lead.stat_3_label || 'Satisfaction';
  enriched.stat_4_value = lead.stat_4_value || '4.9';
  enriched.stat_4_label = lead.stat_4_label || 'Star Rating';

  return enriched;
}

// === Industry-specific enrichment for Restaurant/Elegant Food ===
function enrichRestaurant(lead) {
  const enriched = enrichLead(lead);
  
  // Override with restaurant-specific content
  enriched.hero_tagline = lead.hero_tagline || 'Fine Dining Experience';
  enriched.menu_subtitle = lead.menu_subtitle || 'Every dish tells a story — explore our carefully curated menu crafted with the finest ingredients.';
  enriched.menu_categories = lead.menu_categories || getDefaultMenu();
  enriched.story_quote = lead.story_quote || 'Great food is the foundation of genuine happiness. Every ingredient tells a story, every dish is a memory waiting to be made.';
  enriched.story_quote_author = lead.contact_name || 'Chef & Owner';
  enriched.story_text_1 = lead.story_text_1 || `At ${lead.business_name || 'our restaurant'}, we believe dining is more than a meal—it's an experience. Nestled in the heart of ${lead.city || 'the city'}, we've been crafting unforgettable moments since day one.`;
  enriched.story_text_2 = lead.story_text_2 || 'Our chefs source only the freshest local ingredients, combining time-honored techniques with modern creativity to bring you dishes that delight all the senses.';
  enriched.story_years = lead.story_years || '10+';
  enriched.story_dishes = lead.story_dishes || '50+';
  enriched.story_guests = lead.story_guests || '25';
  enriched.ambiance_subtitle = lead.ambiance_subtitle || 'Step into a world of warmth, elegance, and culinary artistry.';
  enriched.ambiance_items = lead.ambiance_items || getDefaultAmbiance();
  enriched.reservation_headline = lead.reservation_headline || 'Reserve Your Table Today';
  enriched.reservation_subtext = lead.reservation_subtext || 'Join us for an unforgettable dining experience. Book your table now.';
  enriched.hours_today = lead.hours_today || 'Open Today 11AM-10PM';
  enriched.rating_text = lead.rating_text || '4.8 ★ Rating';
  enriched.address = lead.address || `${lead.city || 'Your City'}, ${lead.state || 'TX'}`;

  return enriched;
}

// === Template Rendering ===
function renderTemplate(templateHtml, data) {
  let html = templateHtml;
  
  // Simple mustache-style replacement
  for (const [key, value] of Object.entries(data)) {
    if (typeof value === 'string') {
      const regex = new RegExp(`\\{\\{${key}\\}\\}`, 'g');
      html = html.replace(regex, value);
    }
  }

  // Handle arrays/lists with #each blocks
  // Services
  html = renderListBlock(html, 'services', data.services, (item) => `
    <div class="service-card">
      <div class="service-icon"><i class="${item.icon}"></i></div>
      <h3>${item.title}</h3>
      <p>${item.description}</p>
    </div>
  `);

  // About features
  if (data.about_features) {
    html = renderListBlock(html, 'about_features', data.about_features, (item) => `
      <div class="about-feature"><i class="fas fa-check-circle"></i> ${item}</div>
    `);
  }

  // Testimonials
  html = renderListBlock(html, 'testimonials', data.testimonials, (item) => `
    <div class="testimonial-card">
      <div class="testimonial-stars">${item.stars}</div>
      <blockquote>"${item.quote}"</blockquote>
      <div class="testimonial-author">
        <div class="testimonial-avatar">${item.initials}</div>
        <div>
          <div class="testimonial-name">${item.name}</div>
          <div class="testimonial-role">${item.role}</div>
        </div>
      </div>
    </div>
  `);

  // Hours
  if (data.hours) {
    html = renderListBlock(html, 'hours', data.hours, (item) => `
      <span style="display:block;color:#94a3b8;font-size:14px;margin-bottom:10px;">${item}</span>
    `);
  }

  // Footer services
  if (data.footer_services) {
    html = renderListBlock(html, 'footer_services', data.footer_services, (item) => `
      <a href="#">${item}</a>
    `);
  }

  // Menu categories (Elegant Food)
  if (data.menu_categories) {
    html = renderMenuBlock(html, data.menu_categories);
  }

  // Ambiance items (Elegant Food)
  if (data.ambiance_items) {
    html = renderListBlock(html, 'ambiance_items', data.ambiance_items, (item) => `
      <div class="ambiance-card">
        <div class="ambiance-card-bg" style="background:linear-gradient(135deg, ${item.bg_start}, ${item.bg_end});">
          <i class="${item.icon}" style="color:${item.icon_color}; opacity:0.3;"></i>
        </div>
        <div class="ambiance-card-overlay">
          <span>${item.label}</span>
        </div>
      </div>
    `);
  }

  // Remove any remaining unreplaced placeholders
  html = html.replace(/\{\{[#/]each\s+\w+\}\}/g, '');
  html = html.replace(/\{\{this\.\w+\}\}/g, '');
  html = html.replace(/\{\{this\}\}/g, '');
  html = html.replace(/\{\{\.\.\.\w+\}\}/g, '');

  return html;
}

function renderListBlock(html, blockName, items, renderFunc) {
  const startTag = `{{#each ${blockName}}}`;
  const endTag = `{{/each}}`;
  
  const startIdx = html.indexOf(startTag);
  const endIdx = html.indexOf(endTag);
  
  if (startIdx === -1 || endIdx === -1 || !items || items.length === 0) {
    // Remove the block if no items
    if (startIdx !== -1 && endIdx !== -1) {
      return html.slice(0, startIdx) + html.slice(endIdx + endTag.length);
    }
    return html;
  }
  
  const rendered = items.map(renderFunc).join('\n');
  return html.slice(0, startIdx) + rendered + html.slice(endIdx + endTag.length);
}

function renderMenuBlock(html, categories) {
  const startTag = '{{#each menu_categories}}';
  const endTag = '{{/each}}';
  
  let startIdx = html.indexOf(startTag);
  let endIdx = html.indexOf(endTag);
  
  if (startIdx === -1 || endIdx === -1) return html;
  
  let menuHtml = '';
  for (const cat of categories) {
    menuHtml += `
      <div class="menu-category">
        <h3 class="menu-category-title">${cat.category}</h3>
        <div class="menu-grid">`;
    for (const item of cat.items || []) {
      menuHtml += `
          <div class="menu-item">
            <div class="menu-item-info">
              <div class="menu-item-name">${item.name}</div>
              <div class="menu-item-desc">${item.description}</div>
            </div>
            <div class="menu-item-price">$${item.price}</div>
          </div>`;
    }
    menuHtml += `
        </div>
      </div>`;
  }
  
  return html.slice(0, startIdx) + menuHtml + html.slice(endIdx + endTag.length);
}

// === Default Content Generators ===
function getDefaultTagline(industry) {
  const map = {
    'HVAC': 'Trusted Heating & Cooling Experts',
    'Roofing': 'Protecting Homes, Building Trust',
    'Restaurant': 'Where Every Meal Tells a Story',
    'Food Service': 'Fresh Flavors, Timeless Memories'
  };
  return map[industry] || 'Professional Service You Can Trust';
}

function getDefaultMeta(biz, industry, city) {
  const maps = {
    'HVAC': `${biz || 'Your HVAC Company'} — premier HVAC services in ${city || 'your area'}. AC repair, heating installation, and maintenance. Call today!`,
    'Roofing': `${biz || 'Your Roofing Company'} — expert roofing services in ${city || 'your area'}. Roof repair, installation, and inspections. Free estimates!`,
    'Restaurant': `${biz || 'Your Restaurant'} in ${city || 'your city'} — fine dining with fresh ingredients. Reserve your table today!`
  };
  return maps[industry] || `Welcome to ${biz || 'our business'} in ${city || 'your city'}. Quality service guaranteed!`;
}

function getBadge(industry) {
  const map = {
    'HVAC': 'Licensed & Insured',
    'Roofing': 'Top-Rated Contractors',
    'Restaurant': 'Award-Winning Cuisine',
    'Food Service': "Chef's Pick"
  };
  return map[industry] || 'Premium Service';
}

function getHeroHeadline(industry) {
  const map = {
    'HVAC': 'Your Comfort Is Our',
    'Roofing': 'Your Home Deserves the',
    'Restaurant': 'A Symphony of',
    'Food Service': 'Where Every Bite'
  };
  return map[industry] || 'Premium Quality';
}

function getHeroHighlight(industry) {
  const map = {
    'HVAC': 'Priority',
    'Roofing': 'Best Protection',
    'Restaurant': 'Flavors & Passion',
    'Food Service': 'Tells a Story'
  };
  return map[industry] || 'Service';
}

function getHeroSubtext(industry, city) {
  const map = {
    'HVAC': `Serving ${city || 'your community'} with expert HVAC services — from AC repairs to full system installations. We keep you comfortable year-round.`,
    'Roofing': `Protecting ${city || 'your community'} homes with premium roofing solutions. Expert installation, repair, and maintenance you can count on.`,
    'Restaurant': `Experience exceptional cuisine in the heart of ${city || 'the city'}. Every dish crafted with passion, every visit a celebration of flavor.`
  };
  return map[industry] || `Serving ${city || 'your community'} with excellence and integrity.`;
}

function getCTA(industry) {
  const map = {
    'HVAC': 'Get a Free Quote',
    'Roofing': 'Schedule Inspection',
    'Restaurant': 'Reserve a Table',
    'Food Service': 'Order Now'
  };
  return map[industry] || 'Get Started';
}

function getDefaultServices(industry) {
  const maps = {
    'HVAC': [
      { icon: 'fas fa-snowflake', title: 'AC Repair & Installation', description: 'Expert air conditioning repair, maintenance, and new system installations for optimal home comfort.' },
      { icon: 'fas fa-fire', title: 'Heating Services', description: 'Furnace repair, heat pump installation, and heating system maintenance you can depend on.' },
      { icon: 'fas fa-wind', title: 'Indoor Air Quality', description: 'Air purification, humidity control, and ventilation solutions for healthier indoor environments.' }
    ],
    'Roofing': [
      { icon: 'fas fa-home', title: 'Roof Installation', description: 'Professional roof installation using premium materials backed by comprehensive warranties.' },
      { icon: 'fas fa-tools', title: 'Roof Repair', description: 'Fast, reliable roof repair services for leaks, storm damage, and general wear and tear.' },
      { icon: 'fas fa-search', title: 'Roof Inspections', description: 'Thorough roof inspections to identify issues early and extend the life of your roof.' }
    ],
    'Restaurant': [
      { icon: 'fas fa-utensils', title: 'Fine Dining', description: 'An exquisite dining experience featuring seasonal ingredients and innovative culinary techniques.' },
      { icon: 'fas fa-wine-glass-alt', title: 'Curated Wine List', description: 'An expertly selected wine collection from around the world, perfectly paired with your meal.' },
      { icon: 'fas fa-birthday-cake', title: 'Private Events', description: 'Host your special occasions in our elegant private dining spaces with customized menus.' }
    ]
  };
  return maps[industry] || [
    { icon: 'fas fa-star', title: 'Quality Service', description: 'Premium quality service tailored to your specific needs and requirements.' },
    { icon: 'fas fa-clock', title: 'Timely Delivery', description: 'On-time service delivery with clear communication every step of the way.' },
    { icon: 'fas fa-shield-alt', title: 'Satisfaction Guaranteed', description: 'Your satisfaction is our top priority. We stand behind every job we complete.' }
  ];
}

function getAboutFeatures(industry) {
  const maps = {
    'HVAC': ['Licensed & Insured Technicians', '24/7 Emergency Service', 'Same-Day Availability', '100% Satisfaction Guarantee', 'Free Estimates', 'Maintenance Plans'],
    'Roofing': ['Licensed & Insured', 'Premium Materials', 'Workmanship Warranty', 'Free Inspections', 'Financing Available', 'Storm Damage Specialists'],
    'Restaurant': ['Farm-Fresh Ingredients', 'Award-Winning Chefs', 'Handcrafted Cocktails', 'Warm Ambiance', 'Dietary Accommodations', 'Private Dining Room']
  };
  return maps[industry] || ['Licensed & Insured', 'Satisfaction Guaranteed', 'Free Estimates', 'Expert Team'];
}

function getDefaultTestimonials(industry, bizName) {
  const maps = {
    'HVAC': [
      { stars: generateStars(5), quote: 'They installed our new AC system in one day and the price was incredibly fair. Our house has never been more comfortable!', initials: 'JD', name: 'James D.', role: 'Homeowner' },
      { stars: generateStars(5), quote: 'Called them on a Sunday when our heater went out. They were here within 2 hours and had us back up and running.', initials: 'SM', name: 'Sarah M.', role: 'Homeowner' },
      { stars: generateStars(5), quote: 'Professional, punctual, and reasonably priced. We use them for all our commercial HVAC needs.', initials: 'RL', name: 'Robert L.', role: 'Property Manager' }
    ],
    'Roofing': [
      { stars: generateStars(5), quote: 'After a major storm, they replaced our entire roof in 3 days. The quality is outstanding and it looks beautiful.', initials: 'TK', name: 'Tom K.', role: 'Homeowner' },
      { stars: generateStars(5), quote: 'Honest assessment, fair pricing, and excellent workmanship. Could not recommend them more highly.', initials: 'AJ', name: 'Angela J.', role: 'Homeowner' },
      { stars: generateStars(5), quote: "They repaired our flat roof and it hasn't leaked since. True professionals who stand by their work.", initials: 'PW', name: 'Paul W.', role: 'Business Owner' }
    ],
    'Restaurant': [
      { stars: generateStars(5), quote: 'Absolutely divine! The tasting menu was a journey through incredible flavors. The wine pairing was perfect.', initials: 'EC', name: 'Emily C.', role: 'Food Critic' },
      { stars: generateStars(5), quote: 'The ambiance is magical and the service is impeccable. Our anniversary dinner was unforgettable.', initials: 'MR', name: 'Michael R.', role: 'Regular Guest' },
      { stars: generateStars(5), quote: 'Best restaurant in town! The chef\'s special always surprises and delights. We come here every month.', initials: 'LK', name: 'Lisa K.', role: 'Loyal Patron' }
    ]
  };
  return maps[industry] || [
    { stars: generateStars(5), quote: 'Excellent service from start to finish. Highly recommend!', initials: 'JD', name: 'John D.', role: 'Happy Customer' },
    { stars: generateStars(5), quote: 'They exceeded all my expectations. Professional and reliable.', initials: 'SM', name: 'Sarah M.', role: 'Satisfied Client' },
    { stars: generateStars(5), quote: 'I\'ve never experienced such quality service. Five stars!', initials: 'RL', name: 'Robert L.', role: 'Regular Customer' }
  ];
}

function getDefaultHours() {
  return [
    'Mon-Fri: 8:00 AM - 6:00 PM',
    'Saturday: 9:00 AM - 4:00 PM',
    'Sunday: Closed'
  ];
}

function getFooterDescription(industry, city) {
  const map = {
    'HVAC': `Serving ${city || 'the community'} with premium HVAC services. Licensed, insured, and dedicated to your comfort.`,
    'Roofing': `Protecting ${city || 'area'} homes and businesses with quality roofing solutions since 2010.`,
    'Restaurant': `${city || 'Your city'}'s premier dining destination. Fresh ingredients, exceptional service, unforgettable experiences.`
  };
  return map[industry] || `Serving ${city || 'the community'} with quality service and integrity.`;
}

function getServicesSubtitle(industry) {
  const map = {
    'HVAC': 'Comprehensive heating, cooling, and air quality solutions for your home or business.',
    'Roofing': 'Complete roofing services from minor repairs to full replacements with premium materials.',
    'Restaurant': 'An exquisite culinary journey awaits — from handcrafted appetizers to decadent desserts.'
  };
  return map[industry] || 'Professional services tailored to your needs.';
}

function getAboutText1(industry, bizName) {
  const map = {
    'HVAC': `With over a decade of experience, ${bizName || 'our company'} has built a reputation for excellence in HVAC services. Our certified technicians bring unmatched expertise to every job.`,
    'Roofing': `${bizName || 'Our company'} has been protecting homes and businesses with quality roofing solutions. Our master craftsmen take pride in every project.`,
    'Restaurant': `At ${bizName || 'our restaurant'}, we believe dining is an art form. Our culinary team brings together global techniques and local ingredients.`
  };
  return map[industry] || `${bizName || 'Our company'} is dedicated to providing exceptional service to our community.`;
}

function getAboutText2(industry) {
  const map = {
    'HVAC': 'We believe in transparent pricing, honest recommendations, and work that stands the test of time. Every installation, repair, and maintenance visit is backed by our commitment to quality.',
    'Roofing': 'From the initial inspection to the final cleanup, we maintain the highest standards of workmanship and safety. Your home deserves nothing less.',
    'Restaurant': 'Every plate that leaves our kitchen is a reflection of our passion for culinary excellence. We source locally, cook creatively, and serve with warmth.'
  };
  return map[industry] || 'We are committed to quality, integrity, and customer satisfaction in everything we do.';
}

function getQuote(industry) {
  const map = {
    'HVAC': 'Quality is not just a standard — it\'s a promise. We treat every home like our own.',
    'Roofing': 'A roof over your head is more than shelter — it\'s peace of mind. We build trust one project at a time.',
    'Restaurant': 'Cooking is an act of love — every dish tells a story, every meal creates a memory.'
  };
  return map[industry] || 'We believe in doing things right the first time.';
}

function getTestimonialsSubtitle(industry) {
  const map = {
    'HVAC': 'Hear from our satisfied customers about their experience with our HVAC services.',
    'Roofing': 'Don\'t take our word for it — hear what our customers have to say.',
    'Restaurant': 'Our guests\' smiles are our greatest reward. Here\'s what they have to say.'
  };
  return map[industry] || 'See what our customers are saying about us.';
}

function getCTAHeadline(industry) {
  const map = {
    'HVAC': 'Ready to Get Comfortable?',
    'Roofing': 'Protect Your Investment Today',
    'Restaurant': 'Your Table Is Waiting'
  };
  return map[industry] || 'Ready to Get Started?';
}

function getCTASubtext(industry) {
  const map = {
    'HVAC': 'Schedule your free consultation and estimate today. Our team is standing by.',
    'Roofing': 'Get a free roof inspection and estimate. No obligation, just expert advice.',
    'Restaurant': 'Book your dining experience today. Walk-ins always welcome.'
  };
  return map[industry] || 'Contact us today for a free consultation.';
}

function getFooterServices(industry) {
  const map = {
    'HVAC': ['AC Repair', 'Heating Services', 'Air Quality', 'Maintenance', 'Emergency Service'],
    'Roofing': ['Roof Installation', 'Roof Repair', 'Inspections', 'Storm Damage', 'Gutters'],
    'Restaurant': ['Dinner Menu', 'Lunch Menu', 'Wine List', 'Private Events', 'Catering']
  };
  return map[industry] || ['Service 1', 'Service 2', 'Service 3', 'Service 4'];
}

// Restaurant-specific defaults
function getDefaultMenu() {
  return [
    {
      category: 'Appetizers',
      items: [
        { name: 'Crispy Calamari', description: 'Lightly fried calamari served with marinara and lemon aioli', price: 14 },
        { name: 'Truffle Fries', description: 'Hand-cut fries tossed in truffle oil with parmesan and herbs', price: 12 },
        { name: 'Bruschetta Trio', description: 'Classic tomato basil, roasted pepper, and mushroom truffle bruschetta', price: 13 }
      ]
    },
    {
      category: 'Main Course',
      items: [
        { name: 'Herb-Roasted Salmon', description: 'Atlantic salmon with seasonal vegetables and lemon butter sauce', price: 28 },
        { name: 'Filet Mignon', description: '8oz prime filet with truffle mashed potatoes and red wine reduction', price: 42 },
        { name: 'Wild Mushroom Risotto', description: 'Arborio rice with wild mushrooms, white wine, and aged parmesan', price: 24 }
      ]
    },
    {
      category: 'Desserts',
      items: [
        { name: 'Tiramisu', description: 'Classic Italian tiramisu with mascarpone and espresso', price: 11 },
        { name: 'Crème Brûlée', description: 'Vanilla bean crème brûlée with caramelized sugar top', price: 10 },
        { name: 'Chocolate Lava Cake', description: 'Warm dark chocolate cake with vanilla ice cream', price: 12 }
      ]
    }
  ];
}

function getDefaultAmbiance() {
  return [
    { bg_start: '#1a1a2e', bg_end: '#16213e', icon: 'fas fa-couch', icon_color: '#d4a574', label: 'Cozy Lounge' },
    { bg_start: '#2d1b1b', bg_end: '#1a1a2e', icon: 'fas fa-wine-glass-alt', icon_color: '#b91c1c', label: 'Wine Bar' },
    { bg_start: '#1a2e1a', bg_end: '#16213e', icon: 'fas fa-leaf', icon_color: '#4ade80', label: 'Garden Patio' }
  ];
}

// === Main Pipeline ===
async function main() {
  const args = process.argv.slice(2);
  const inputFile = args.includes('--input') 
    ? args[args.indexOf('--input') + 1] 
    : DEFAULT_INPUT;
  const outputDir = args.includes('--output')
    ? args[args.indexOf('--output') + 1]
    : OUTPUT_DIR;

  console.log('');
  console.log('╔══════════════════════════════════════════════╗');
  console.log('║      Instaweb Demo Generation Pipeline       ║');
  console.log('╚══════════════════════════════════════════════╝');
  console.log('');

  // Ensure output dir
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  // Read leads
  let leads = [];
  if (fs.existsSync(inputFile)) {
    const raw = fs.readFileSync(inputFile, 'utf-8');
    leads = JSON.parse(raw);
    console.log(`  ✓ Loaded ${leads.length} lead(s) from ${inputFile}`);
  } else {
    // Use sample/default leads if no input
    console.log(`  ℹ  No leads file found at ${inputFile}`);
    console.log('  ℹ  Using default sample leads for demonstration');
    leads = getSampleLeads();
  }

  if (leads.length === 0) {
    console.error('  ✗ No leads to process. Exiting.');
    process.exit(1);
  }

  // Process each lead
  const results = [];
  const errors = [];

  for (let i = 0; i < leads.length; i++) {
    const lead = leads[i];
    const bizName = lead.business_name || `Lead #${i + 1}`;
    const industry = lead.industry || 'HVAC';
    
    console.log(`  [${i + 1}/${leads.length}] Processing: ${bizName} (${industry})`);

    try {
      // Select template
      const templateKey = getTemplateForIndustry(industry);
      const template = TEMPLATES[templateKey];
      const templatePath = path.resolve(TEMPLATES_DIR, template.dir, 'index.html');

      if (!fs.existsSync(templatePath)) {
        throw new Error(`Template not found: ${templatePath}`);
      }

      // Load template
      const templateHtml = fs.readFileSync(templatePath, 'utf-8');

      // Enrich data
      const isRestaurant = industry === 'Restaurant' || industry === 'Food Service';
      const enriched = isRestaurant ? enrichRestaurant(lead) : enrichLead(lead);

      // Render
      const renderedHtml = renderTemplate(templateHtml, enriched);

      // Generate output filename
      const slug = slugify(bizName);
      const filename = `${slug}-${templateKey}.html`;
      const outputPath = path.resolve(outputDir, filename);

      // Write file
      fs.writeFileSync(outputPath, renderedHtml, 'utf-8');

      results.push({
        id: lead.id || `generated-${i}`,
        business_name: bizName,
        industry,
        template: templateKey,
        file: filename,
        path: outputPath
      });

      console.log(`    ✓ Generated: ${filename}`);
    } catch (err) {
      errors.push({ business_name: bizName, error: err.message });
      console.error(`    ✗ Error: ${err.message}`);
    }
  }

  // Generate demo index
  const indexHtml = generateIndex(results);
  fs.writeFileSync(path.resolve(outputDir, 'index.html'), indexHtml, 'utf-8');

  // Summary
  console.log('');
  console.log('╔══════════════════════════════════════════════╗');
  console.log('║              Pipeline Summary                ║');
  console.log('╚══════════════════════════════════════════════╝');
  console.log('');
  console.log(`  ✓ ${results.length} demo(s) generated successfully`);
  if (errors.length > 0) {
    console.log(`  ✗ ${errors.length} error(s)`);
    for (const err of errors) {
      console.log(`     - ${err.business_name}: ${err.error}`);
    }
  }
  console.log(`  📁 Output directory: ${outputDir}`);
  console.log(`  📄 Demo index: ${outputDir}/index.html`);
  console.log('');

  // Save results manifest
  const manifest = {
    generated_at: new Date().toISOString(),
    total: results.length,
    errors: errors.length,
    results,
    errors
  };
  fs.writeFileSync(path.resolve(outputDir, 'manifest.json'), JSON.stringify(manifest, null, 2), 'utf-8');
  
  console.log('  ✓ Manifest saved to manifest.json');
  console.log('');
}

function generateIndex(results) {
  let cards = '';
  for (const r of results) {
    const badgeClass = r.industry === 'Restaurant' || r.industry === 'Food Service' ? 'food' : 'trade';
    cards += `
      <div class="demo-card">
        <div class="demo-card-header">
          <span class="industry-badge ${badgeClass}">${r.industry}</span>
          <span class="template-badge">${r.template}</span>
        </div>
        <h3>${r.business_name}</h3>
        <div class="demo-card-footer">
          <a href="${r.file}" class="demo-link" target="_blank">View Demo →</a>
        </div>
      </div>`;
  }

  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Instaweb - Generated Demos</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Inter', sans-serif; background: #f0f4f8; color: #0f172a; padding: 40px; }
    .container { max-width: 1200px; margin: 0 auto; }
    h1 { font-size: 32px; font-weight: 800; margin-bottom: 8px; }
    h1 span { color: #1a56db; }
    .subtitle { color: #64748b; margin-bottom: 40px; font-size: 16px; }
    .stats { display: flex; gap: 24px; margin-bottom: 40px; flex-wrap: wrap; }
    .stat { background: white; padding: 20px 28px; border-radius: 12px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
    .stat-value { font-size: 28px; font-weight: 800; color: #1a56db; }
    .stat-label { font-size: 13px; color: #64748b; margin-top: 4px; }
    .demo-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 24px; }
    .demo-card { background: white; border-radius: 16px; padding: 24px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); transition: transform 0.2s, box-shadow 0.2s; }
    .demo-card:hover { transform: translateY(-4px); box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
    .demo-card-header { display: flex; gap: 8px; margin-bottom: 16px; }
    .industry-badge { padding: 4px 12px; border-radius: 100px; font-size: 11px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; }
    .industry-badge.trade { background: #dbeafe; color: #1e40af; }
    .industry-badge.food { background: #fef3c7; color: #92400e; }
    .template-badge { padding: 4px 12px; border-radius: 100px; font-size: 11px; font-weight: 500; background: #f1f5f9; color: #475569; }
    .demo-card h3 { font-size: 18px; font-weight: 700; margin-bottom: 20px; }
    .demo-card-footer { border-top: 1px solid #e2e8f0; padding-top: 16px; }
    .demo-link { color: #1a56db; text-decoration: none; font-weight: 600; font-size: 14px; }
    .demo-link:hover { text-decoration: underline; }
    .footer-text { margin-top: 40px; text-align: center; color: #94a3b8; font-size: 13px; }
    @media (max-width: 640px) {
      body { padding: 20px; }
      h1 { font-size: 24px; }
      .demo-grid { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Instaweb <span>Demo Sites</span></h1>
    <p class="subtitle">Generated on ${new Date().toLocaleDateString()} — Preview your personalized demo websites</p>
    
    <div class="stats">
      <div class="stat">
        <div class="stat-value">${results.length}</div>
        <div class="stat-label">Total Demos</div>
      </div>
      <div class="stat">
        <div class="stat-value">${new Set(results.map(r => r.template)).size}</div>
        <div class="stat-label">Templates Used</div>
      </div>
    </div>

    <div class="demo-grid">
      ${cards}
    </div>

    <p class="footer-text">Powered by Instaweb — Premium Website Development</p>
  </div>
</body>
</html>`;
}

function getSampleLeads() {
  return [
    {
      id: 'sample-hvac-1',
      business_name: 'Premier HVAC Services',
      industry: 'HVAC',
      city: 'Houston',
      state: 'TX',
      phone: '(713) 555-0142',
      email: 'info@premierhvac.com',
      contact_name: 'Mike Johnson'
    },
    {
      id: 'sample-roofing-1',
      business_name: 'Summit Roofing Co.',
      industry: 'Roofing',
      city: 'Phoenix',
      state: 'AZ',
      phone: '(602) 555-0189',
      email: 'info@summitroofing.com',
      contact_name: 'Dave Wilson'
    },
    {
      id: 'sample-restaurant-1',
      business_name: 'Bella Vita Ristorante',
      industry: 'Restaurant',
      city: 'New York',
      state: 'NY',
      phone: '(212) 555-0100',
      email: 'hello@bellavita.com',
      contact_name: 'Chef Marco'
    },
    {
      id: 'sample-hvac-2',
      business_name: 'CoolBreeze AC & Heating',
      industry: 'HVAC',
      city: 'Dallas',
      state: 'TX',
      phone: '(214) 555-0067',
      email: 'service@coolbreeze.com',
      contact_name: 'Tom Davis'
    },
    {
      id: 'sample-roofing-2',
      business_name: 'Desert Shield Roofing',
      industry: 'Roofing',
      city: 'Tucson',
      state: 'AZ',
      phone: '(520) 555-0034',
      email: 'info@desertshield.com',
      contact_name: 'Rick Martinez'
    },
    {
      id: 'sample-restaurant-2',
      business_name: 'Saffron & Spice',
      industry: 'Restaurant',
      city: 'Austin',
      state: 'TX',
      phone: '(512) 555-0098',
      email: 'chef@saffronspice.com',
      contact_name: 'Chef Amara'
    }
  ];
}

// === Run ===
if (require.main === module) {
  main().catch(err => {
    console.error('Pipeline failed:', err);
    process.exit(1);
  });
}

module.exports = { renderTemplate, enrichLead, enrichRestaurant, getTemplateForIndustry, TEMPLATES, getSampleLeads };