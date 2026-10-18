# K.O.T.A.K Browser

A futuristic browser project based on the **actual Chromium source** for Android, Windows, Linux, and macOS.

> **Status:** Foundation scaffold. This repository does not yet contain Chromium source or a working branded browser build.

## Targets
- Android (ARM64 first)
- Linux (x86-64)
- Windows (x86-64)
- macOS (Apple Silicon and Intel, subject to upstream support)

## Project strategy
- Keep this repository small: store our documentation, scripts, branding, and patches here.
- Fetch Chromium with Google's `depot_tools` into a separate working directory.
- Pin and record the exact upstream Chromium revision used for every build.
- Keep platform builds separate; macOS builds require macOS/Xcode infrastructure.
- Build upstream Chromium first, then introduce small, reviewable K.O.T.A.K changes.
- Never commit Chromium's generated output, signing keys, tokens, or credentials.

## Repository map
- `docs/` — architecture, build guide, roadmap
- `branding/` — product identity and assets
- `patches/` — patch series for our Chromium customizations
- `scripts/` — source checkout and local build helpers
- `.github/workflows/` — lightweight repository validation

## Quick start
Read [the build guide](docs/BUILDING.md) before provisioning a machine. A complete Chromium checkout and build require a large amount of disk space, memory, and time. A standard phone, Termux session, or small Codespace is not an appropriate full-build machine.

## Security and licensing
Chromium contains third-party components with different licenses and attribution requirements. Review upstream notices and policies before redistributing builds. Plan regular upstream security updates from the beginning.

## License
This project has not yet selected a project-specific license. Chromium and its third-party components retain their respective licenses; see the upstream Chromium repository and notices before copying or redistributing code.
