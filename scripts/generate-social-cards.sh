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

apply_motif() {
  local canvas="$1"
  local motif="$2"
  local accent="$3"

  case "$motif" in
    home)
      magick "png:$canvas" \
        -fill 'rgba(0,255,136,0.12)' -draw 'circle 940,250 1120,250' \
        -fill 'rgba(255,255,255,0.05)' -draw 'circle 890,300 1040,300' \
        -stroke "$accent" -strokewidth 2 -fill none -draw 'line 760,430 1130,430' \
        -stroke 'rgba(255,255,255,0.30)' -strokewidth 2 -draw 'line 790,460 1100,460' \
        "png:$canvas"
      ;;
    resources)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(75,197,255,0.15)' -draw 'roundrectangle 760,110 1120,170 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(75,197,255,0.11)' -draw 'roundrectangle 800,190 1120,250 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(75,197,255,0.09)' -draw 'roundrectangle 840,270 1120,330 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(75,197,255,0.08)' -draw 'roundrectangle 880,350 1120,410 12,12' \
        "png:$canvas"
      ;;
    faq)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(255,190,71,0.16)' -draw 'roundrectangle 760,130 1080,210 18,18' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(255,190,71,0.12)' -draw 'roundrectangle 820,250 1120,330 18,18' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(255,190,71,0.09)' -draw 'roundrectangle 760,370 1040,450 18,18' \
        "png:$canvas"
      ;;
    privpedia)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(142,241,107,0.13)' -draw 'roundrectangle 760,120 860,220 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(142,241,107,0.13)' -draw 'roundrectangle 900,120 1000,220 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(142,241,107,0.13)' -draw 'roundrectangle 1040,120 1140,220 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(142,241,107,0.10)' -draw 'roundrectangle 830,260 930,360 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(142,241,107,0.10)' -draw 'roundrectangle 970,260 1070,360 12,12' \
        -font "$BOLD_FONT" -pointsize 44 -fill "$accent" -annotate +795+186 'A' \
        -annotate +935+186 'Z' \
        -annotate +1076+186 'Q' \
        -annotate +864+326 'N' \
        -annotate +1002+326 'S' \
        "png:$canvas"
      ;;
    mission)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 3 -fill none -draw 'circle 935,260 1110,260' \
        -stroke "$accent" -strokewidth 2 -draw 'circle 935,260 1030,260' \
        -stroke 'rgba(255,255,255,0.35)' -strokewidth 2 -draw 'line 700,430 1110,260' \
        -fill "$accent" -stroke none -draw 'polygon 1086,245 1140,250 1105,290' \
        "png:$canvas"
      ;;
    api)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(0,255,136,0.15)' -draw 'roundrectangle 740,130 920,200 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(0,255,136,0.15)' -draw 'roundrectangle 960,130 1140,200 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(0,255,136,0.15)' -draw 'roundrectangle 850,270 1030,340 12,12' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(0,255,136,0.15)' -draw 'roundrectangle 850,410 1030,480 12,12' \
        -stroke "$accent" -strokewidth 3 -fill none -draw 'line 920,165 960,165' \
        -draw 'line 1030,305 1030,165' \
        -draw 'line 850,305 850,445' \
        "png:$canvas"
      ;;
    architecture)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(178,255,124,0.16)' -draw 'roundrectangle 740,390 1120,470 14,14' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(178,255,124,0.12)' -draw 'roundrectangle 780,290 1080,360 14,14' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(178,255,124,0.10)' -draw 'roundrectangle 820,200 1040,260 14,14' \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(178,255,124,0.08)' -draw 'roundrectangle 860,130 1000,180 14,14' \
        "png:$canvas"
      ;;
    developers)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 2 -fill 'rgba(255,159,85,0.10)' -draw 'roundrectangle 730,120 1135,460 16,16' \
        -fill 'rgba(255,159,85,0.18)' -stroke none -draw 'rectangle 730,120 1135,170' \
        -font "$BOLD_FONT" -pointsize 34 -fill "$accent" -annotate +770+158 '>_ dev' \
        -font "$BOLD_FONT" -pointsize 52 -fill '#ffffff' -annotate +790+250 '</>' \
        -font "$REGULAR_FONT" -pointsize 30 -fill '#e2e6e3' -annotate +860+250 'sdk init' \
        -annotate +790+320 '>' \
        -annotate +830+320 'mcp connect' \
        -annotate +790+390 '>' \
        -annotate +830+390 'privchain pay' \
        "png:$canvas"
      ;;
    security)
      magick "png:$canvas" \
        -stroke "$accent" -strokewidth 3 -fill 'rgba(255,105,139,0.09)' -draw 'path \"M930,130 L1080,200 L1080,330 Q1080,420 930,470 Q780,420 780,330 L780,200 Z\"' \
        -stroke "$accent" -strokewidth 2 -fill none -draw 'circle 930,285 985,285' \
        -draw 'line 930,285 930,355' \
        -stroke 'rgba(255,255,255,0.18)' -strokewidth 2 -draw 'line 740,500 1120,500' \
        "png:$canvas"
      ;;
    *)
      echo "Unknown motif: $motif" >&2
      exit 1
      ;;
  esac
}

render_card() {
  local out_file="$1"
  local accent="$2"
  local page_label="$3"
  local headline="$4"
  local subtitle="$5"
  local motif="$6"
  local canvas
  canvas="$(mktemp -t privchain-card-XXXXXX)"

  magick -size 1200x630 xc:'#070a09' \
    \( -size 1200x630 gradient:'#121a16-#060807' -rotate 90 \) -compose over -composite \
    -fill 'rgba(0,255,136,0.08)' -draw 'circle 120,80 510,80' \
    -fill 'rgba(76,159,255,0.08)' -draw 'circle 1120,620 700,620' \
    -fill 'rgba(255,255,255,0.03)' -draw 'rectangle 0,0 1200,4' \
    -fill "$accent" -draw 'rectangle 0,0 1200,8' \
    -stroke 'rgba(255,255,255,0.08)' -strokewidth 1 -fill none \
    -draw 'line 680,80 680,550' \
    "png:$canvas"

  apply_motif "$canvas" "$motif" "$accent"

  magick "png:$canvas" \
    \( "$LOGO" -resize 84x84 \) -gravity northwest -geometry +80+70 -compose over -composite \
    -font "$BOLD_FONT" -pointsize 44 -fill '#ffffff' -annotate +188+130 'PrivChain' \
    -font "$BOLD_FONT" -pointsize 80 -fill "$accent" -annotate +80+255 "$headline" \
    \( -background none -fill '#d8e4dd' -font "$REGULAR_FONT" -pointsize 34 -size 560x180 caption:"$subtitle" \) -gravity northwest -geometry +80+292 -compose over -composite \
    -stroke "$accent" -strokewidth 2 -fill '#0e1512' -draw 'roundrectangle 80,494 420,548 14,14' \
    -font "$BOLD_FONT" -pointsize 27 -fill "$accent" -annotate +106+533 "$page_label" \
    -font "$REGULAR_FONT" -pointsize 24 -fill '#96ac9f' -annotate +80+590 'privchain.io' \
    "$out_file"

  rm -f "$canvas"

  echo "generated: $out_file"
}

render_card "$BRAND_DIR/social-card-1200x630.png" '#00ff88' 'HOMEPAGE' 'Private Payments' 'Privacy infrastructure for x402-compatible agent payments.' home
render_card "$BRAND_DIR/social-card-resources-1200x630.png" '#4bc5ff' 'RESOURCES' 'Resources' 'Guides for onboarding, integration, operations, and launch readiness.' resources
render_card "$BRAND_DIR/social-card-faq-1200x630.png" '#ffbe47' 'FAQ' 'FAQ' 'Answers to common protocol, integration, and deployment questions.' faq
render_card "$BRAND_DIR/social-card-privpedia-1200x630.png" '#8ef16b' 'PRIVPEDIA' 'Privpedia' 'Core glossary terms for protocol and operations language.' privpedia
render_card "$BRAND_DIR/social-card-mission-1200x630.png" '#78c8ff' 'MISSION' 'Mission' 'PrivChain is the privacy layer for x402-compatible payment flows.' mission
render_card "$BRAND_DIR/social-card-api-1200x630.png" '#00ff88' 'API' 'API Surface' 'Public interface names for verify, settle, lookup, and reconcile.' api
render_card "$BRAND_DIR/social-card-architecture-1200x630.png" '#b2ff7c' 'ARCHITECTURE' 'Architecture' 'Public component map for facilitator, SDK/MCP, and signer paths.' architecture
render_card "$BRAND_DIR/social-card-developers-1200x630.png" '#ff9f55' 'DEVELOPERS' 'Developer Intent' 'Staged SDK and MCP availability for partner integrations.' developers
render_card "$BRAND_DIR/social-card-security-1200x630.png" '#ff698b' 'SECURITY' 'Security Summary' 'High-level controls for replay protection, idempotency, and signing.' security
