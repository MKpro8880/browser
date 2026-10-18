# K.O.T.A.K Browser

A futuristic downstream customization of the **actual Chromium source** for Android, Windows, Linux, and macOS.

> **Status:** Project scaffold and Android-first build plan. This repository does not yet contain Chromium source or a working K.O.T.A.K-branded APK.

## Targets
- Android (ARM64 first)
- Linux (x86-64)
- Windows (x86-64)
- macOS (supported Mac/Xcode configurations)

## Android-first strategy
1. Keep this repository small: store documentation, scripts, branding, and downstream patches.
2. Use GitHub/Codespaces for editing and lightweight checks when available.
3. Check the host's architecture, RAM, free disk and quotas before any large download.
4. Fetch Chromium with Google's `depot_tools` only on a supported, sufficiently provisioned build host.
5. Build and test an unmodified Android APK before applying K.O.T.A.K branding.
6. Pin the upstream Chromium revision and preserve a regular security-update process.

## Repository map
- `docs/` — architecture, build instructions, Android plan, free workflow, roadmap
- `branding/` — product identity and assets
- `patches/` — patches for our Chromium customizations
- `scripts/` — source checkout, build and preflight helpers
- `.github/workflows/` — lightweight validation

## Can we build without paid cloud space?
We can continue coding and run small checks using GitHub and available free tools. A full Chromium Android build is not guaranteed on a default Codespace or hosted Actions runner because of source size, disk, RAM, runtime, and account quota limits. See [Free workflow](docs/FREE_WORKFLOW.md) and [Android plan](docs/ANDROID_PLAN.md).

## Security and licensing
Chromium contains components with different licenses and attribution requirements. Review upstream notices before redistribution. Never commit signing keys, access tokens, or private credentials.

## License
No project-specific license has been selected yet. Chromium and third-party components retain their respective licenses.
