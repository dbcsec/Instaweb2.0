# Instaweb Brand Guidelines

## Brand Identity

### Mission
Deliver $10,000-quality websites for service-based businesses at a disruptive price point — $399 setup + $248/mo recurring.

### Brand Voice
- **Bold & confident** — We're disrupting an industry, and we know it
- **Direct & clear** — No jargon, no fluff, just value
- **Professional yet approachable** — Premium quality without the premium attitude
- **Trustworthy** — We back our claims with transparency

### Target Audience
Small to medium service businesses in HVAC, Roofing, and Restaurant/Food Service industries, primarily in Texas, Arizona, and New York.

---

## Visual Identity

### Color Palette

| Role | Hex | Usage |
|------|-----|-------|
| **Primary** | `#4F46E5` (Indigo) | Main brand color, buttons, links |
| **Primary Light** | `#6366F1` | Hover states, accents |
| **Primary Dark** | `#3730A3` | Deep accents, gradients |
| **Secondary** | `#F59E0B` (Amber) | CTAs, highlights, star ratings |
| **Secondary Dark** | `#D97706` | CTA hover states |
| **Accent** | `#10B981` (Emerald) | Success indicators, checkmarks |
| **Dark** | `#0B0F19` | Backgrounds, hero sections |
| **Dark-2** | `#111827` | Secondary dark surfaces |
| **Dark-3** | `#1F2937` | Card surfaces on dark |
| **Light** | `#F9FAFB` | Section backgrounds |

### Gradient Combinations
- **Primary → Dark**: `linear-gradient(135deg, #4F46E5, #3730A3)`
- **Primary → Emerald**: `linear-gradient(135deg, #4F46E5, #10B981)` (for gradient text)
- **Amber → Orange**: `linear-gradient(135deg, #F59E0B, #F97316)` (for gold highlights)
- **Dark → Dark-2**: `linear-gradient(135deg, #0B0F19, #111827)` (hero backgrounds)

### Typography

| Role | Font | Weight |
|------|------|--------|
| **Display/Headings** | Space Grotesk | 600, 700, 800 |
| **Body** | Inter | 400, 500, 600 |
| **Buttons** | Inter | 600 |

### Spacing
- Section padding: `120px 0` (desktop), `80px 0` (mobile)
- Container max-width: `1200px`
- Grid gaps: `24-32px` (card grids), `48-60px` (two-column layouts)

### Component Design Tokens
- Border radius: `10px` (buttons), `16px` (cards), `20px` (large containers), `24px` (pricing cards)
- Shadows: `var(--shadow)`, `var(--shadow-lg)`, `var(--shadow-xl)`, `var(--shadow-glow)`
- Button padding: `14px 32px` (standard), `16px 40px` (large)

---

## Page Sections (Landing Page)

1. **Header** — Fixed nav with glassmorphism, gradient logo, CTA button
2. **Hero** — Full-screen with gradient text, stat row, premium showcase card
3. **Trusted By** — Social proof with industry icons
4. **Value Proposition** — 3-card grid with hover effects
5. **Industries** — Dark section with tab-switching industry showcases (HVAC, Roofing, Restaurants)
6. **How It Works** — 4-step numbered process with connector line
7. **Pricing** — Two-column pricing ($399 setup / $248/mo hosting)
8. **Testimonials** — 3-card grid with star ratings and industry tags
9. **FAQ** — Accordion-style questions
10. **Contact** — Split layout with form and info
11. **Footer** — 4-column grid with social links

---

## Key Messaging

| Concept | Message |
|---------|---------|
| **Value Prop** | "Premium Websites. Disruptive Price." |
| **Pain Point** | Stop paying $10,000 for a website |
| **Speed** | "Your site in 48 hours" |
| **Quality** | "Agency-grade quality at a fraction of the cost" |
| **Process** | "The Industrial Blitz" |
| **Pricing** | "$399 setup + $248/mo — no surprises" |

---

## File Structure

```
instaweb-brand-site/
├── index.html          # Main landing page
├── package.json        # Project metadata
├── vercel.json         # Vercel deployment config
├── README.md           # This file
└── assets/
    └── instaweb-og-image.png  # OG share image
```