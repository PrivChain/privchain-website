# privchain-website

Public website for PrivChain, preserving the legacy visual style while serving Tier A-safe pre-release content.

## Structure

- `index.html`: main landing page
- `mission.html`: mission and x402 positioning
- `architecture.html`: high-level system architecture
- `api.html`: public interface surface
- `signup.html`: early access signup conversion funnel
- `signup-success.html`: post-signup confirmation
- `security.html`: public security controls summary
- `developers.html`: developer availability intent
- `styles.css`: shared visual style (ported from legacy site)
- `assets/js/funnel.js`: attribution and funnel tracking helper
- `assets/brand/`: logo and social media branding kit (SVG + PNG)
- `assets/icons/`: favicon and app-icon set (ICO/PNG/manifest/pinned-tab)
- `robots.txt`: crawler policy and sitemap declaration
- `sitemap.xml`: canonical URL index
- `llms.txt` + `llms-full.txt`: AI crawler discovery and consolidated context
- `ai/*.md`: markdown mirrors for agent-friendly parsing
- `SEO_OPERATIONS.md`: search/AI crawler submission runbook
- `scripts/submit-search-engines.sh`: sitemap and crawler submission helper
- `.github/workflows/pages.yml`: GitHub Pages deployment workflow
- `CNAME`: custom domain configuration (`privchain.io`)

## Local Preview

Open `index.html` in a browser.

## Deployment

GitHub Actions deploys this repo to Pages on push to `main`.

Note: this repo must remain public for Pages support on the current GitHub plan.
