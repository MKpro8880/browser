#!/usr/bin/env bash
set -euo pipefail

# Read-only inspection of an existing Chromium checkout. No network calls,
# checkout, sync, file writes, patch application, or deletion.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHROMIUM_SRC="${1:-${CHROMIUM_SRC:-}}"

if [[ -z "$CHROMIUM_SRC" ]]; then
  echo "Usage: $0 /path/to/chromium/src" >&2
  echo "Or set CHROMIUM_SRC. This script does not download Chromium." >&2
  exit 2
fi

if [[ ! -d "$CHROMIUM_SRC/.git" && ! -f "$CHROMIUM_SRC/.git" ]]; then
  echo "Not a Git checkout: $CHROMIUM_SRC" >&2
  exit 2
fi

echo "== Chromium source inspection (read-only) =="
echo "Source: $CHROMIUM_SRC"
echo "Repository helper: $REPO_ROOT"
echo
echo "-- Revision --"
git -C "$CHROMIUM_SRC" rev-parse HEAD
echo
echo "-- Working tree status --"
git -C "$CHROMIUM_SRC" status --short
echo
echo "-- Candidate Android browser source directories --"
for path in \
  chrome/android/java/src/org/chromium/chrome/browser \
  chrome/android/java/res \
  chrome/android/java/src/org/chromium/chrome/browser/toolbar \
  chrome/android/java/src/org/chromium/chrome/browser/tabmodel; do
  if [[ -d "$CHROMIUM_SRC/$path" ]]; then
    echo "FOUND  $path"
  else
    echo "MISS   $path (may differ in this revision)"
  fi
done
echo
echo "-- Candidate Android build documentation --"
for path in docs/android_build_instructions.md chrome/android/BUILD.gn; do
  if [[ -f "$CHROMIUM_SRC/$path" ]]; then
    echo "FOUND  $path"
  else
    echo "MISS   $path (may differ in this revision)"
  fi
done
echo
echo "-- Likely product/resource files (limited output) --"
find "$CHROMIUM_SRC/chrome/android" -type f \
  \( -iname '*manifest*.xml' -o -iname '*strings*.xml' -o -iname '*icon*' -o -iname '*toolbar*' \) \
  -print 2>/dev/null | head -n 100 || true
echo
echo "Inspection only. Review candidates in this exact revision before editing."
echo "No files were changed and no source was downloaded."
