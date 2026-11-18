#!/usr/bin/env bash
# Genera los PDF del CV desde el HTML (fuente única):
#   cv-marcos-martinez-es.pdf  -> 1 página, español
#   cv-marcos-martinez-en.pdf  -> 1 página, inglés
#   MMCV-2026-27.pdf     -> 2 páginas: ES (pág. 1) + EN (pág. 2)
# Requiere Google Chrome/Chromium y pdfunite (poppler-utils). Necesita internet para las fuentes.
set -euo pipefail
cd "$(dirname "$0")/.."

CHROME="$(command -v google-chrome || command -v chromium || command -v chromium-browser)"

print_pdf() {  # $1 = html, $2 = pdf
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --virtual-time-budget=8000 --print-to-pdf="$2" "file://$PWD/$1" 2>/dev/null
}

print_pdf index.html    cv-marcos-martinez-es.pdf
print_pdf en/index.html cv-marcos-martinez-en.pdf
pdfunite cv-marcos-martinez-es.pdf cv-marcos-martinez-en.pdf MMCV-2026-27.pdf

for f in cv-marcos-martinez-es.pdf cv-marcos-martinez-en.pdf MMCV-2026-27.pdf; do
  printf '%s: %s página(s)\n' "$f" "$(pdfinfo "$f" | awk '/^Pages:/{print $2}')"
done
