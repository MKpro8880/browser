# Building K.O.T.A.K Browser

## Important prerequisites
Chromium is a very large native project. For Android, upstream documents a supported x86-64 Linux host with at least 8 GB RAM, recommends more than 16 GB RAM, and requires at least 100 GB free disk space. Check the current upstream instructions because requirements can change.

Official documentation:
- Source checkout: https://www.chromium.org/developers/how-tos/get-the-code/
- Linux: https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md
- Android: https://chromium.googlesource.com/chromium/src/+/main/docs/android_build_instructions.md
- Windows: https://chromium.googlesource.com/chromium/src/+/main/docs/windows_build_instructions.md
- macOS: https://chromium.googlesource.com/chromium/src/+/main/docs/mac_build_instructions.md

## Recommended workflow
1. Use GitHub Codespaces or the GitHub web editor for this small repository.
2. Run `bash scripts/check-build-capacity.sh` before downloading anything.
3. Use a supported Linux x86-64 host for Android Chromium source checkout/build.
4. Use compatible Windows and macOS hosts for native desktop builds.
5. Keep build outputs outside this repository and publish only intentional artifacts.

## Android source checkout
After the host passes the preflight and the documented prerequisites are installed, the Android-first helper is:

```bash
bash scripts/sync-chromium.sh
```

It refuses to start if available disk or memory is below its configured thresholds. It uses the upstream Android-specific `fetch --nohooks android` workflow. The checkout and hooks can take substantial time and storage.

## Android ARM64 baseline
After checkout, dependencies and hooks are ready, from Chromium's `src` directory:

```bash
gn gen out/KotakAndroid --args='target_os="android" target_cpu="arm64"'
autoninja -C out/KotakAndroid chrome_public_apk
```

Verify target names and build arguments against the exact pinned Chromium revision. This creates an upstream baseline, not yet a K.O.T.A.K-branded release.

## Linux desktop baseline
From Chromium's `src` directory on a suitable Linux host:

```bash
gn gen out/KotakLinux
autoninja -C out/KotakLinux chrome
```

## Windows and macOS
Follow the current upstream platform guide on a supported native host. Do not assume a Linux runner can produce supported native release builds for every desktop OS.

## Patch workflow
- Record the exact upstream commit in a revision manifest before customizing.
- Keep each customization as a small patch under `patches/`.
- Test patches against the pinned revision.
- Rebase/review patches when updating Chromium.
- Do not use an unreviewed floating `main` revision for release builds.

## Signing and secrets
Never commit signing keys, keystores, certificates, access tokens, or private credentials. Configure secrets only in a trusted release environment and restrict who can trigger release workflows.
