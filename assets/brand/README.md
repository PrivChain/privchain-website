# PrivChain Brand Assets

Use these files for social media and GitHub branding.

## Primary Logo

- `logo-mark.svg`: vector logo mark (preferred source)
- `logo-mark-4096.png`: ultra-high-resolution square logo mark
- `logo-mark-2048.png`: high-resolution square logo mark
- `logo-mark-1024.png`: square high-resolution mark
- `logo-mark-512.png`: square medium-resolution mark
- `logo-wordmark.svg`: wide wordmark for headers and docs
- `logo-wordmark-4096x1280.png`: high-resolution wordmark export
- `variants/`: alternate colorways and icon-only marks
  - `variants/logo-mark-light.svg`
  - `variants/logo-mark-mono-dark.svg`
  - `variants/logo-mark-mono-light.svg`
  - `variants/icon-minimal.svg`

## Social Media

- `social-avatar-1024.png`: profile/avatar image (X, Telegram, Discord, etc.)
- `social-avatar-2048.png`: high-resolution profile/avatar for branding kits
- `social-banner-1500x500.png`: header/banner image
- `social-banner-3000x1000.png`: high-resolution header/banner image
- `social-card-1200x630.png`: Open Graph/Twitter card image
- `social-card-2400x1260.png`: 2x Open Graph/Twitter card (for aggressive downsampling platforms)
- `social-card-resources-1200x630.png`: social card for `resources.html`
- `social-card-faq-1200x630.png`: social card for `faq.html`
- `social-card-privpedia-1200x630.png`: social card for `privpedia.html`
- `social-card-mission-1200x630.png`: social card for `mission.html`
- `social-card-api-1200x630.png`: social card for `api.html`
- `social-card-architecture-1200x630.png`: social card for `architecture.html`
- `social-card-developers-1200x630.png`: social card for `developers.html`
- `social-card-security-1200x630.png`: social card for `security.html`

## Favicons and App Icons

Generated web icons are in `../icons/`:

- `favicon.ico`
- `favicon-16x16.png`
- `favicon-32x32.png`
- `favicon-64x64.png`
- `favicon-128x128.png`
- `favicon-256x256.png`
- `favicon-1024x1024.png`
- `apple-touch-icon.png`
- `android-chrome-192x192.png`
- `android-chrome-512x512.png`
- `site.webmanifest`
- `safari-pinned-tab.svg`

## GitHub Recommendations

- Org/repo avatar: `social-avatar-2048.png` (fallback: `social-avatar-1024.png`)
- Social preview card: `social-card-1200x630.png` (optional HQ source: `social-card-2400x1260.png`)
- README/website inline mark: `logo-mark.svg` or `logo-wordmark.svg`

## Press/Branding Recommendations

- Master vector source: `logo-mark.svg` and `logo-wordmark.svg`
- Print-ready logo export: `logo-mark-4096.png`
- Social avatar upload: `social-avatar-2048.png`
- Social banner upload: `social-banner-3000x1000.png`
- Shareable brand bundle: `privchain-brand-kit-hq.zip`

## Notes

- PNG exports are generated from SVG sources.
- Keep SVG files as canonical masters for future edits.
- Social preview variants can be regenerated with `scripts/generate-social-cards.sh`.
