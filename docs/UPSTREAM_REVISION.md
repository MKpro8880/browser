# Upstream Chromium revision record

Fill this file from a real local checkout. Do not guess or pre-fill a revision.

- Chromium repository: https://chromium.googlesource.com/chromium/src/
- Selected commit SHA: NOT SET
- Human-readable ref/branch (if known): NOT SET
- Checkout date (UTC): NOT SET
- Android target/configuration: NOT SET
- Host OS and architecture: NOT SET
- `depot_tools` revision (if recorded): NOT SET
- Source investigation performed: NO
- Unmodified Android build result: NOT RUN
- APK device smoke test: NOT RUN
- Downstream patches applied: NONE

## How to fill this record
From an existing Chromium checkout:

```bash
git -C "$CHROMIUM_SRC" rev-parse HEAD
git -C "$CHROMIUM_SRC" status --short
git -C "$HOME/depot_tools" rev-parse HEAD
```

Copy the actual results into this file and commit the record. If the worktree is dirty, document the changes. Do not record an APK as built unless the command completed, the artifact was located, and it was tested.
