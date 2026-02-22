# SEO and AI Crawler Operations

This runbook covers search indexing, crawler discovery, and AI-agent readable content.

## Implemented in this repo

- `robots.txt` for crawler policy and sitemap declaration.
- `sitemap.xml` for all public pages plus AI markdown endpoints.
- `llms.txt` and `llms-full.txt` for LLM-oriented discovery.
- `/ai/*.md` markdown corpus for efficient machine parsing.
- JSON-LD structured data on core pages (`index.html`, `faq.html`).

## Submit to search engines

Run:

```bash
./scripts/submit-search-engines.sh privchain.io
```

Optional IndexNow:

```bash
INDEXNOW_KEY=your_key ./scripts/submit-search-engines.sh privchain.io
```

## Manual submissions and verification

1. Google Search Console
   - Verify `https://privchain.io`
   - Submit `https://privchain.io/sitemap.xml`
2. Bing Webmaster Tools
   - Verify domain
   - Submit `https://privchain.io/sitemap.xml`
3. Cloudflare
   - Security -> Bots -> AI Crawlers and Bots
   - Set policy to allow/opt-in for AI crawlers
4. Exa and other AI retrieval engines
   - Ensure `robots.txt`, `sitemap.xml`, `llms.txt`, and `llms-full.txt` stay reachable
   - Keep canonical URLs stable and avoid crawler blocks in WAF rules

## Ongoing cadence

- On each major page update:
  - Update markdown mirror content under `/ai/`.
  - Keep `sitemap.xml` in sync.
  - Re-run submission script.
- Weekly:
  - Review Search Console and Bing indexing reports.
  - Check crawl errors and blocked resources.
