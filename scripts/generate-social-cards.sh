#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BRAND_DIR="$ROOT_DIR/assets/brand"
LOGO="$BRAND_DIR/logo-mark-1024.png"

if [[ ! -f "$LOGO" ]]; then
  echo "Missing logo source: $LOGO" >&2
  exit 1
fi

BOLD_FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
REGULAR_FONT="/System/Library/Fonts/Supplemental/Arial.ttf"

render_card() {
  local out_file="$1"
  local accent="$2"
  local page_label="$3"
  local headline="$4"
  local subtitle="$5"

  magick -size 1200x630 xc:'#070a09' \
    \( -size 1200x630 gradient:'#121a16-#060807' -rotate 90 \) -compose over -composite \
    -fill 'rgba(0,255,136,0.12)' -draw 'circle 120,80 500,80' \
    -fill 'rgba(76,159,255,0.10)' -draw 'circle 1120,620 760,620' \
    -fill 'rgba(255,255,255,0.03)' -draw 'rectangle 0,0 1200,4' \
    -fill "$accent" -draw 'rectangle 0,0 1200,8' \
    \( "$LOGO" -resize 84x84 \) -gravity northwest -geometry +80+70 -compose over -composite \
    -font "$BOLD_FONT" -pointsize 44 -fill '#ffffff' -annotate +188+130 'PrivChain' \
    -font "$BOLD_FONT" -pointsize 80 -fill "$accent" -annotate +80+255 "$headline" \
    \( -background none -fill '#d8e4dd' -font "$REGULAR_FONT" -pointsize 34 -size 1000x120 caption:"$subtitle" \) -gravity northwest -geometry +80+292 -compose over -composite \
    -stroke "$accent" -strokewidth 2 -fill '#0e1512' -draw 'roundrectangle 80,474 390,528 14,14' \
    -font "$BOLD_FONT" -pointsize 27 -fill "$accent" -annotate +106+512 "$page_label" \
    -font "$REGULAR_FONT" -pointsize 24 -fill '#96ac9f' -annotate +80+585 'privchain.io' \
    "$out_file"

  echo "generated: $out_file"
}

render_card "$BRAND_DIR/social-card-1200x630.png" '#00ff88' 'HOMEPAGE' 'Private Payments' 'Privacy infrastructure for x402-compatible agent payments.'
render_card "$BRAND_DIR/social-card-resources-1200x630.png" '#4bc5ff' 'RESOURCES' 'Resources' 'Guides for onboarding, integration, operations, and launch readiness.'
render_card "$BRAND_DIR/social-card-faq-1200x630.png" '#ffbe47' 'FAQ' 'FAQ' 'Answers to common protocol, integration, and deployment questions.'
render_card "$BRAND_DIR/social-card-privpedia-1200x630.png" '#8ef16b' 'PRIVPEDIA' 'Privpedia' 'Core glossary terms for protocol and operations language.'
render_card "$BRAND_DIR/social-card-mission-1200x630.png" '#78c8ff' 'MISSION' 'Mission' 'PrivChain is the privacy layer for x402-compatible payment flows.'
render_card "$BRAND_DIR/social-card-api-1200x630.png" '#00ff88' 'API' 'API Surface' 'Public interface names for verify, settle, lookup, and reconcile.'
render_card "$BRAND_DIR/social-card-architecture-1200x630.png" '#b2ff7c' 'ARCHITECTURE' 'Architecture' 'Public component map for facilitator, SDK/MCP, and signer paths.'
render_card "$BRAND_DIR/social-card-developers-1200x630.png" '#ff9f55' 'DEVELOPERS' 'Developer Intent' 'Staged SDK and MCP availability for partner integrations.'
render_card "$BRAND_DIR/social-card-security-1200x630.png" '#ff698b' 'SECURITY' 'Security Summary' 'High-level controls for replay protection, idempotency, and signing.'
