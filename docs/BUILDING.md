# Building K.O.T.A.K Browser

## Important prerequisites
Chromium is a very large native project. Before checkout, provision a supported x86-64 Linux host with ample RAM and at least roughly 100 GB free disk space; additional storage is strongly recommended. Check the current upstream instructions because requirements change.

Official documentation:
- Source checkout: https://www.chromium.org/developers/how-tos/get-the-code/
- Linux: https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md
- Android: https://chromium.googlesource.com/chromium/src/+/main/docs/android_build_instructions.md
- Windows: https://chromium.googlesource.com/chromium/src/+/main/docs/windows_build_instructions.md
- macOS: https://chromium.googlesource.com/chromium/src/+/main/docs/mac_build_instructions.md

## Recommended workflow
1. Use GitHub Codespaces or a phone browser to edit this small repository.
2. Use a persistent Linux x86-64 VM for the Chromium source checkout and Linux/Android builds.
3. Use compatible Windows and macOS hosts for native desktop builds.
4. Keep build outputs outside this repository and publish only intentional artifacts.
5. Record the Chromium revision and build configuration for each artifact.

## Linux source checkout
Install the prerequisites from the official Linux guide first. Then:

```bash
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git "$HOME/depot_tools"
export PATH="$HOME/depot_tools:$PATH"
mkdir -p "$HOME/chromium-work"
cd "$HOME/chromium-work"
fetch --nohooks chromium
cd src
gclient runhooks
```

Do not start this checkout until disk space and quota are confirmed. It downloads a large source tree and dependencies.

## Linux desktop baseline
From the Chromium `src` directory, after installing documented dependencies and running hooks:

```bash
gn gen out/KotakLinux
autoninja -C out/KotakLinux chrome
```

## Android ARM64 baseline
From the same source tree, after following the Android-specific setup guide:

```bash
gn gen out/KotakAndroid --args='target_os="android" target_cpu="arm64"'
autoninja -C out/KotakAndroid chrome_public_apk
```

Verify the target name and arguments against the exact pinned Chromium revision. These are upstream baseline builds, not yet K.O.T.A.K-branded release artifacts.

## Windows and macOS
Follow the current upstream platform guide on a supported native host. Do not assume a Linux runner can cross-build a supported release for every desktop OS.

## Patch workflow
- Record the exact upstream commit in a revision manifest before customizing.
- Keep each customization as a small patch under `patches/`.
- Apply and test patches against the pinned revision.
- Rebase/review patches when updating Chromium.
- Do not use an unreviewed floating `main` revision for release builds.

## Signing and secrets
Never commit signing keys, keystores, certificates, access tokens, or private credentials. Configure secrets only in a trusted release environment and restrict who can trigger release workflows.
