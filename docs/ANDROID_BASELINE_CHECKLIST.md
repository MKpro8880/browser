# Android baseline acceptance checklist

## Purpose
Prepare a reproducible baseline build of upstream Chromium for Android before applying any K.O.T.A.K Browser customization.

**Company:** `kotak_empire`  
**Product:** K.O.T.A.K Browser  
**Visual identity:** Undecided  
**Current status:** Preparation only; no Chromium checkout or APK build has been completed.

## Gate 0 — Confirm a suitable host
- [ ] Linux x86-64 host compatible with the current Chromium Android build guide
- [ ] Meet current upstream RAM recommendation where possible
- [ ] At least 100 GB free disk space, or more if the current guide requires it
- [ ] Enough CPU/runtime allowance for a long native build
- [ ] Confirm the host is genuinely free to use and check quotas/idle limits
- [ ] Run `bash scripts/check-build-capacity.sh`
- [ ] Do not start a source checkout if preflight fails

The previously reported Codespace (2 CPU threads, about 7 GiB RAM, about 18 GiB free disk) does **not** pass this gate.

## Gate 1 — Checkout and record upstream
- [ ] Read the current official Chromium Android build guide
- [ ] Install required packages and Google's `depot_tools` as documented upstream
- [ ] Fetch Chromium only after Gate 0 passes
- [ ] Record the exact Chromium commit SHA and checkout date in [UPSTREAM_REVISION.md](UPSTREAM_REVISION.md)
- [ ] Record host OS/architecture, `depot_tools` revision, build args and worktree status
- [ ] Run `bash scripts/inspect-chromium-tree.sh "$CHROMIUM_SRC"` (read-only)

## Gate 2 — Build the unmodified Android baseline
- [ ] Confirm the Android GN args and target name for the checked-out revision
- [ ] Generate the build directory using the official guide
- [ ] Build the upstream ARM64 Android APK successfully
- [ ] Locate and record the actual APK artifact path and SHA-256
- [ ] Record build logs and any warnings/errors relevant to reproducibility
- [ ] Do not apply product-name or visual-branding patches before this succeeds

The target shown in `docs/BUILDING.md` is a candidate only; verify it against the exact checked-out revision before running it.

## Gate 3 — Device smoke test
- [ ] Install the APK on a test Android device
- [ ] Confirm cold start and relaunch
- [ ] Visit a normal HTTPS page
- [ ] Test back, forward, reload and address-bar editing
- [ ] Open, switch and close tabs
- [ ] Check permissions, downloads and private browsing
- [ ] Record device model, Android version and test results
- [ ] Mark the baseline successful only after the build and tests actually pass

## After baseline passes
1. Investigate exact app label, product strings and icon resources in the pinned revision.
2. Propose a minimal product-name patch for `kotak_empire` / K.O.T.A.K Browser.
3. Keep visual branding unchanged until it is explicitly chosen.
4. Validate the patch against that same checkout, rebuild, and repeat smoke tests.

## Official documentation
- [Chromium Android build instructions](https://chromium.googlesource.com/chromium/src/+/main/docs/android_build_instructions.md)
- [Get the Chromium source](https://www.chromium.org/developers/how-tos/get-the-code/)

## Truthful status reporting
Do not say the baseline is built until the build command completes and the artifact is verified. Do not say the APK is tested until it has been installed and the smoke tests have been performed.
