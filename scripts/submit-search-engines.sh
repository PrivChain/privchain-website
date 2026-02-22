#!/usr/bin/env bash

set -euo pipefail

DOMAIN="${1:-privchain.io}"
SITEMAP_URL="https://${DOMAIN}/sitemap.xml"

echo "Domain: ${DOMAIN}"
echo "Sitemap: ${SITEMAP_URL}"
echo

if ! curl -fsS "${SITEMAP_URL}" >/dev/null; then
  echo "Error: sitemap is not reachable at ${SITEMAP_URL}" >&2
  exit 1
fi

echo "Submitting sitemap to Bing..."
BING_URL="https://www.bing.com/ping?sitemap=${SITEMAP_URL}"
bing_status="$(curl -sS -o /dev/null -w "%{http_code}" "${BING_URL}" || true)"
if [[ "${bing_status}" == "200" ]]; then
  echo "OK: Bing ping accepted"
elif [[ "${bing_status}" == "410" ]]; then
  echo "INFO: Bing ping endpoint returned 410 (deprecated). Use Bing Webmaster Tools submission."
else
  echo "INFO: Bing ping returned HTTP ${bing_status}. Use Bing Webmaster Tools submission."
fi

echo
echo "Checking AI crawler access points..."
curl -fsS "https://${DOMAIN}/robots.txt" >/dev/null && echo "OK: robots.txt reachable"
curl -fsS "https://${DOMAIN}/llms.txt" >/dev/null && echo "OK: llms.txt reachable"
curl -fsS "https://${DOMAIN}/llms-full.txt" >/dev/null && echo "OK: llms-full.txt reachable"

if [[ -n "${INDEXNOW_KEY:-}" ]]; then
  echo
  echo "Submitting URL batch to IndexNow..."
  payload="$(mktemp)"
  cat > "${payload}" <<EOF
{
  "host": "${DOMAIN}",
  "key": "${INDEXNOW_KEY}",
  "keyLocation": "https://${DOMAIN}/${INDEXNOW_KEY}.txt",
  "urlList": [
    "https://${DOMAIN}/",
    "https://${DOMAIN}/api.html",
    "https://${DOMAIN}/resources.html",
    "https://${DOMAIN}/developers.html",
    "https://${DOMAIN}/security.html",
    "https://${DOMAIN}/faq.html",
    "https://${DOMAIN}/signup.html",
    "https://${DOMAIN}/llms.txt",
    "https://${DOMAIN}/llms-full.txt"
  ]
}
EOF
  curl -fsS -X POST "https://api.indexnow.org/indexnow" \
    -H "Content-Type: application/json" \
    --data-binary "@${payload}" >/dev/null
  rm -f "${payload}"
  echo "OK: IndexNow submission sent"
else
  echo
  echo "INDEXNOW_KEY is not set; skipping IndexNow submission."
fi

echo
echo "Manual tasks:"
echo "1) Google Search Console: submit ${SITEMAP_URL}"
echo "2) Bing Webmaster Tools: verify domain and monitor indexing"
echo "3) Cloudflare Dashboard: Security > Bots > AI Crawlers and Bots (set to allow)"
