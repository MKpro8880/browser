#!/usr/bin/env bash
set -euo pipefail

CHROMIUM_SRC="${CHROMIUM_SRC:-$HOME/chromium-work/src}"
OUT_DIR="${OUT_DIR:-out/KotakLinux}"

if [[ ! -d "$CHROMIUM_SRC" ]]; then
  echo "Chromium source not found at $CHROMIUM_SRC. Run scripts/sync-chromium.sh first." >&2
  exit 1
fi
if ! command -v gn >/dev/null 2>&1 || ! command -v autoninja >/dev/null 2>&1; then
  echo "depot_tools must be on PATH. See docs/BUILDING.md." >&2
  exit 1
fi

cd "$CHROMIUM_SRC"
gn gen "$OUT_DIR"
autoninja -C "$OUT_DIR" chrome
echo "Linux Chromium build completed: $CHROMIUM_SRC/$OUT_DIR"
