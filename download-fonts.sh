#!/bin/bash
# ────────────────────────────────────────────────────────────
# Downloads the exact font files Vettd uses (Cormorant Garamond
# + Outfit) into ./fonts so the site can self-host them.
# Run once, commit the /fonts folder, done.
# Usage:  cd github_push_2026-06-15/ && bash download-fonts.sh
# ────────────────────────────────────────────────────────────

set -e
mkdir -p fonts
cd fonts

BASE="https://cdn.jsdelivr.net/fontsource/fonts"

# Cormorant Garamond — regular weights 400, 600, 700
for w in 400 600 700; do
  echo "→ Cormorant Garamond $w"
  curl -sSL "$BASE/cormorant-garamond@latest/latin-$w-normal.woff2" -o "cormorant-garamond-$w.woff2"
done

# Cormorant Garamond — italic weights 400, 700 (used in agents.html for pull quotes)
for w in 400 700; do
  echo "→ Cormorant Garamond $w italic"
  curl -sSL "$BASE/cormorant-garamond@latest/latin-$w-italic.woff2" -o "cormorant-garamond-$w-italic.woff2"
done

# Outfit — weights 300, 400, 500, 600
for w in 300 400 500 600; do
  echo "→ Outfit $w"
  curl -sSL "$BASE/outfit@latest/latin-$w-normal.woff2" -o "outfit-$w.woff2"
done

echo ""
echo "Done. Files:"
ls -lh *.woff2
