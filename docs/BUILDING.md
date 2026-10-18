# Building K.O.T.A.K Browser

## Important prerequisites
Chromium is a very large native project. For Android, upstream documents a supported x86-64 Linux host with at least 8 GB RAM, recommends more than 16 GB RAM, and requires at least 100 GB free disk space. Check current upstream instructions because requirements can change.

The current Codespaces report for this project showed 2 CPU threads, about 7 GiB RAM and about 18 GiB free disk. Do not start a Chromium checkout in that environment.

Official documentation:
- Source checkout: https://www.chromium.org/developers/how-tos/get-the-code/
- Linux: https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md
- Android: https://chromium.googlesource.com/chromium/src/+/main/docs/android_build_instructions.md
- Windows: https://chromium.googlesource.com/chromium/src/+/main/docs/windows_build_instructions.md
- macOS: https://chromium.googlesource.com/chromium/src/+/main/docs/mac_build_instructions.md

## Safe Android-first workflow
1. Use GitHub/Codespaces for this small repository and lightweight checks.
2. Run `bash scripts/check-build-capacity.sh` before downloading anything.
3. Do not fetch Chromium until the host meets the current upstream requirements.
4. Once a suitable existing checkout is available, record its real revision in [UPSTREAM_REVISION.md](UPSTREAM_REVISION.md).
5. Run `bash scripts/inspect-chromium-tree.sh /path/to/chromium/src` to inspect candidate Android files without changing them.
6. Create small patches only after confirming file/resource ownership in that exact revision.
7. Run `bash scripts/check-patches.sh /path/to/chromium/src` to perform read-only patch checks.
8. Build and test the unmodified Android target before applying branding.

## Android source checkout
Only after the host passes preflight and the documented prerequisites are installed, run:

```bash
bash scripts/sync-chromium.sh
```

The helper refuses to start below its configured disk/RAM thresholds. The checkout and hooks can take substantial time and storage.

## Android ARM64 baseline
After checkout, dependencies and hooks are ready, from Chromium's `src` directory:

```bash
gn gen out/KotakAndroid --args='target_os="android" target_cpu="arm64"'
autoninja -C out/KotakAndroid chrome_public_apk
```

Verify target names and build arguments against the exact pinned Chromium revision. This is an upstream baseline, not yet a K.O.T.A.K-branded release.

## Patch workflow
- Record the exact upstream commit.
- Keep each customization as a small patch under `patches/`.
- Add a patch to `patches/series` only after it exists and has been reviewed.
- Test patches against the pinned revision.
- Rebase/review patches when updating Chromium.
- Do not use an unreviewed floating `main` revision for release builds.

## Windows and macOS
Follow the current upstream platform guide on a supported native host. Do not assume a Linux runner can produce supported native release builds for every desktop OS.

## Signing and secrets
Never commit signing keys, keystores, certificates, access tokens, or private credentials. Configure secrets only in a trusted release environment and restrict who can trigger release workflows.

## Current implementation status
No upstream revision is pinned, no downstream branding patch is active, and no APK has been built or tested. See [the source investigation plan](SOURCE_INVESTIGATION.md) and [Android customization notes](ANDROID_CUSTOMIZATION.md).
