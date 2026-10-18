#!/usr/bin/env bash
set -euo pipefail

# Fetch Chromium into a separate working directory, not inside this project repo.
CHROMIUM_WORK_DIR="${CHROMIUM_WORK_DIR:-$HOME/chromium-work}"
DEPOT_TOOLS_DIR="${DEPOT_TOOLS_DIR:-$HOME/depot_tools}"

if [[ "$(uname -s)" != "Linux" ]]; then
  echo "This helper expects a Linux host. Use the official platform guide for Windows/macOS." >&2
  exit 1
fi

if [[ "$(uname -m)" != "x86_64" && "$(uname -m)" != "amd64" ]]; then
  echo "Chromium's documented Linux build workflow expects x86-64; current arch: $(uname -m)" >&2
  exit 1
fi

if [[ ! -d "$DEPOT_TOOLS_DIR" ]]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git "$DEPOT_TOOLS_DIR"
fi

export PATH="$DEPOT_TOOLS_DIR:$PATH"
mkdir -p "$(dirname "$CHROMIUM_WORK_DIR")"

if [[ -d "$CHROMIUM_WORK_DIR/src/.git" ]]; then
  echo "Chromium checkout already exists at $CHROMIUM_WORK_DIR/src"
  cd "$CHROMIUM_WORK_DIR/src"
  gclient sync
else
  mkdir -p "$CHROMIUM_WORK_DIR"
  cd "$CHROMIUM_WORK_DIR"
  fetch --nohooks chromium
  cd src
  gclient runhooks
fi

echo "Chromium source is ready at $CHROMIUM_WORK_DIR/src"
echo "Record the revision with: git -C '$CHROMIUM_WORK_DIR/src' rev-parse HEAD"
