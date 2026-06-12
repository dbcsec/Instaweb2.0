# Elite Template Improvements — Design Document

## Overview
Two new Elite-tier HTML templates that elevate design quality to justify $399 setup + $248/mo pricing.

## 1. Elite Trade (HVAC/Plumbing/Roofing/Electrical)

### Upgrade from Modern Trade
- **Typography**: Space Grotesk (headings) + Inter (body) — brand standard
- **Color Palette**: Indigo #4F46E5 (primary), Amber #F59E0B (accent), Emerald #10B981 (trust signals)
- **Hero**: Cinematic dark background with dual glow layers (indigo + amber), floating showcase card with animated services grid, star ratings, and pricing
- **Trust Bar** (new section): Licensed & Insured badge, 5-Star Rating, Same-Day Service, Free Estimates
- **Animations**: Staggered scroll entrance for cards, hover gradient shifts, scroll-based header transparency
- **New Variables**: `services` (4 items grid), `review_count`, `trust_badges`

### Variable Schema
```
{
  "business_name": "Elite HVAC Services",
  "tagline": "Premium Heating & Cooling",
  "phone": "(555) 123-4567",
  "email": "contact@elitehvac.com",
  "address": "123 Main St, Houston, TX 77001",
  "services": [
    {"name": "AC Installation", "icon": "snowflake", "price": "From $99"},
    {"name": "Heating Repair", "icon": "fire", "price": "From $79"},
    {"name": "Duct Cleaning", "icon": "wind", "price": "From $149"},
    {"name": "Emergency Service", "icon": "bolt", "price": "24/7 Available"}
  ],
  "review_count": 247,
  "rating": 4.9,
  "years_in_business": 15,
  "demo_url": "https://instaweb.agency/demo/elite-hvac"
}
```

## 2. Elite Food (Restaurants/Cafes/Bars)

### Upgrade from Elegant Food
- **Typography**: Playfair Display (headings - refined serif) + Inter (body)
- **Hero**: Rich dark background with warm amber glow, floating menu showcase card
- **Full Menu Grid** (new section): Cards with prices, dietary tags, Chef's Pick badge
- **"Our Story" Section**: Narrative paragraph with signature line, warm-toned quote card
- **Guest Reviews**: Displayed with dates, rating stars, reservation CTA button
- **New Variables**: `featured_dishes`, `menu_categories`, `story_text`, `reviews`

### Variable Schema
```
{
  "business_name": "Bella's Italian Kitchen",
  "tagline": "Authentic Italian Since 2008",
  "phone": "(555) 234-5678",
  "email": "hello@bellaskitchen.com",
  "address": "456 Oak Ave, Houston, TX 77002",
  "featured_dishes": [
    {"name": "Truffle Pasta", "price": "$24", "tag": "Chef's Pick", "image": ""},
    {"name": "Grilled Salmon", "price": "$28", "tag": "Most Popular", "image": ""},
    {"name": "Tiramisu", "price": "$12", "tag": "Dessert", "image": ""}
  ],
  "story_text": "Family recipes passed down through three generations...",
  "reviews": [
    {"name": "Maria G.", "rating": 5, "text": "Best Italian food in Houston!", "date": "2024-01-15"}
  ],
  "demo_url": "https://instaweb.agency/demo/bella-italian"
}
```

## 3. Shared Components (both templates)

- **Sticky CTA Banner**: Fixed bottom "Call Now" or "Get Quote" with phone number
- **Accept & Pay Banner**: Square payment integration banner
- **Mobile-first responsive**: Works on all screen sizes
- **Performance optimized**: Minimal external dependencies, CSS animations over JS
- **SEO meta tags**: Open Graph, description, business schema

## 4. Quality Checklist
- [ ] Valid HTML5
- [ ] No placeholder data (use NULL if unavailable)
- [ ] All links use `https://www.instaweb.agency`
- [ ] Email address: `hello@instaweb.agency`
- [ ] Handlebars `{{variable}}` syntax throughout
- [ ] Payment link included
- [ ] Mobile responsive tested
- [ ] Loading performance < 2s
