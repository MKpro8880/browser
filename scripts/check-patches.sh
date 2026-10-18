#!/usr/bin/env bash
set -euo pipefail

# Read-only patch validation. Uses git apply --check; never applies patches.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHROMIUM_SRC="${1:-${CHROMIUM_SRC:-}}"
SERIES="$REPO_ROOT/patches/series"

if [[ -z "$CHROMIUM_SRC" || ! -d "$CHROMIUM_SRC" ]]; then
  echo "Usage: $0 /path/to/chromium/src" >&2
  echo "Set CHROMIUM_SRC or pass an existing local Chromium checkout." >&2
  exit 2
fi
if [[ ! -f "$SERIES" ]]; then
  echo "Patch series file not found: $SERIES" >&2
  exit 2
fi

REVISION="$(git -C "$CHROMIUM_SRC" rev-parse HEAD)"
echo "Checking patches against Chromium revision: $REVISION"
count=0
while IFS= read -r line || [[ -n "$line" ]]; do
  patch="$(printf '%s' "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  [[ -z "$patch" || "$patch" == \#* ]] && continue
  if [[ "$patch" == */* || "$patch" == *..* ]]; then
    echo "Rejected unsafe patch path in series: $patch" >&2
    exit 2
  fi
  patch_file="$REPO_ROOT/patches/$patch"
  if [[ ! -f "$patch_file" ]]; then
    echo "Missing patch file: $patch_file" >&2
    exit 2
  fi
  echo "Checking $patch"
  git -C "$CHROMIUM_SRC" apply --check "$patch_file"
  count=$((count + 1))
done < "$SERIES"

echo "Validated $count patch(es) with --check. No patches were applied."
if [[ "$count" -eq 0 ]]; then
  echo "No active patches in series yet; expected for the initial scaffold."
fi
