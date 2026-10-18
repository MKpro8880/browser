#!/usr/bin/env bash
set -euo pipefail

# Android-first Chromium checkout helper.
# Refuses to start a large checkout on undersized hosts.
CHROMIUM_WORK_DIR="${CHROMIUM_WORK_DIR:-$HOME/chromium-android-work}"
DEPOT_TOOLS_DIR="${DEPOT_TOOLS_DIR:-$HOME/depot_tools}"
MIN_FREE_GB="${MIN_FREE_GB:-100}"
MIN_RAM_GB="${MIN_RAM_GB:-8}"

if [[ "$(uname -s)" != "Linux" ]]; then
  echo "This helper expects Linux. Follow upstream platform-specific instructions elsewhere." >&2
  exit 1
fi

ARCH="$(uname -m)"
if [[ "$ARCH" != "x86_64" && "$ARCH" != "amd64" ]]; then
  echo "Chromium Android builds require a supported Linux x86-64 host; detected: $ARCH" >&2
  exit 1
fi

FREE_KB="$(df -Pk "$HOME" | awk 'NR==2 {print $4}')"
FREE_GB="$((FREE_KB / 1024 / 1024))"
if [[ "$FREE_GB" -lt "$MIN_FREE_GB" ]]; then
  echo "STOP: only about ${FREE_GB} GiB free under HOME; need at least ${MIN_FREE_GB} GiB before checkout." >&2
  echo "No source checkout was started. See docs/ANDROID_PLAN.md." >&2
  exit 2
fi

if [[ -r /proc/meminfo ]]; then
  TOTAL_KB="$(awk '/MemTotal:/ {print $2}' /proc/meminfo)"
  RAM_GB="$((TOTAL_KB / 1024 / 1024))"
  if [[ "$RAM_GB" -lt "$MIN_RAM_GB" ]]; then
    echo "STOP: detected about ${RAM_GB} GiB RAM; upstream minimum is approximately ${MIN_RAM_GB} GiB." >&2
    echo "No source checkout was started." >&2
    exit 2
  fi
fi

if [[ ! -d "$DEPOT_TOOLS_DIR" ]]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git "$DEPOT_TOOLS_DIR"
fi

export PATH="$DEPOT_TOOLS_DIR:$PATH"
mkdir -p "$(dirname "$CHROMIUM_WORK_DIR")"

if [[ -d "$CHROMIUM_WORK_DIR/src/.git" ]]; then
  echo "Android Chromium checkout exists at $CHROMIUM_WORK_DIR/src"
  cd "$CHROMIUM_WORK_DIR/src"
  gclient sync
else
  mkdir -p "$CHROMIUM_WORK_DIR"
  cd "$CHROMIUM_WORK_DIR"
  fetch --nohooks android
  cd src
  gclient runhooks
fi

echo "Android Chromium source is ready at $CHROMIUM_WORK_DIR/src"
echo "Record revision: git -C '$CHROMIUM_WORK_DIR/src' rev-parse HEAD"
