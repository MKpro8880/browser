#!/usr/bin/env bash
set -euo pipefail

# Non-destructive preflight. This script does not download Chromium or install packages.
MIN_FREE_GB="${MIN_FREE_GB:-100}"
MIN_RAM_GB="${MIN_RAM_GB:-16}"

echo "== K.O.T.A.K Browser: Chromium build preflight =="
echo "Host: $(uname -a)"
echo

ARCH="$(uname -m)"
if [[ "$ARCH" != "x86_64" && "$ARCH" != "amd64" ]]; then
  echo "WARNING: Linux Chromium build instructions target x86-64; detected architecture: $ARCH"
else
  echo "Architecture: $ARCH"
fi

if command -v nproc >/dev/null 2>&1; then
  echo "CPU threads: $(nproc)"
fi

if command -v free >/dev/null 2>&1; then
  free -h
else
  echo "RAM: 'free' command unavailable; inspect host memory manually."
fi

FREE_KB="$(df -Pk . | awk 'NR==2 {print $4}')"
FREE_GB="$((FREE_KB / 1024 / 1024))"
echo "Free disk in current filesystem: ${FREE_GB} GiB (approx.)"

if [[ "$FREE_GB" -lt "$MIN_FREE_GB" ]]; then
  echo "WARNING: less than ${MIN_FREE_GB} GiB free. Do not start a Chromium checkout yet."
else
  echo "Disk preflight: meets the configured ${MIN_FREE_GB} GiB threshold."
fi

if [[ -r /proc/meminfo ]]; then
  TOTAL_KB="$(awk '/MemTotal:/ {print $2}' /proc/meminfo)"
  RAM_GB="$((TOTAL_KB / 1024 / 1024))"
  echo "Detected RAM: ${RAM_GB} GiB (approx.)"
  if [[ "$RAM_GB" -lt "$MIN_RAM_GB" ]]; then
    echo "WARNING: less than ${MIN_RAM_GB} GiB RAM. A full build may be unreliable."
  else
    echo "RAM preflight: meets the configured ${MIN_RAM_GB} GiB threshold."
  fi
else
  echo "RAM preflight: unable to inspect /proc/meminfo; check host memory manually."
fi

echo
echo "This is only a rough preflight, not a guarantee that Chromium will build."
echo "Check the official instructions for the exact Chromium revision before proceeding."
