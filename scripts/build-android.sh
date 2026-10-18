#!/usr/bin/env bash
set -euo pipefail

CHROMIUM_SRC="${CHROMIUM_SRC:-$HOME/chromium-work/src}"
OUT_DIR="${OUT_DIR:-out/KotakAndroid}"

if [[ ! -d "$CHROMIUM_SRC" ]]; then
  echo "Chromium source not found at $CHROMIUM_SRC. Run scripts/sync-chromium.sh first." >&2
  exit 1
fi
if ! command -v gn >/dev/null 2>&1 || ! command -v autoninja >/dev/null 2>&1; then
  echo "depot_tools must be on PATH. See docs/BUILDING.md and the Android build guide." >&2
  exit 1
fi

cd "$CHROMIUM_SRC"
gn gen "$OUT_DIR" --args='target_os="android" target_cpu="arm64"'
autoninja -C "$OUT_DIR" chrome_public_apk
echo "Android build completed. Verify APK location and target against this Chromium revision."
