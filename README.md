# privchain-website

Public website for PrivChain, preserving the legacy visual style while serving Tier A-safe pre-release content.

## Structure

- `index.html`: main landing page
- `mission.html`: mission and x402 positioning
- `architecture.html`: high-level system architecture
- `api.html`: public interface surface
- `security.html`: public security controls summary
- `developers.html`: developer availability intent
- `styles.css`: shared visual style (ported from legacy site)
- `.github/workflows/pages.yml`: GitHub Pages deployment workflow
- `CNAME`: custom domain configuration (`privchain.io`)

## Local Preview

Open `index.html` in a browser.

## Deployment

GitHub Actions deploys this repo to Pages on push to `main`.

Note: this repo must remain public for Pages support on the current GitHub plan.
