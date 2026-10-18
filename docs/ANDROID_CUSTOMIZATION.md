# Android customization notes

## Project identity
- Company / organization: `kotak_empire`
- Browser product: K.O.T.A.K Browser
- Logo, colors, and visual brand system: not decided yet.

## Goal
Customize the Android experience of the actual Chromium browser while preserving upstream navigation, tab management, permissions, accessibility, privacy and security behavior.

## Status
This is a plan, not a working Android app. No K.O.T.A.K APK exists in this repository, and no product-name or visual-branding patch has been built or tested.

## Recommended order

### 1. Establish an upstream baseline
- Pin a Chromium commit.
- Follow the official Android build guide for that revision.
- Build the unmodified ARM64 Android APK.
- Install it on a test device and record launch/navigation smoke tests.

### 2. Apply only the confirmed product identity
Investigate in the pinned revision:
- Android app label and product strings
- Launcher/adaptive icon and related image resources
- Startup and first-run surfaces
- Product metadata and manifest/resource references

The only confirmed organization name is `kotak_empire`; the browser product name is `K.O.T.A.K Browser`. No logo, palette, slogan, or visual identity has been approved yet. Edit the canonical resource/build configuration that owns each value. Do not perform blind global replacements: Chromium contains unrelated product names and third-party assets.

### 3. Visual style — intentionally undecided
Do not add permanent colors, logos, splash art, or other brand assets until the project owner chooses them. Keep changes focused on product-name wiring and preserve Chromium's baseline UI for now.

### 4. Browser chrome and interactions
Investigate the actual implementation of:
- Toolbar and omnibox/address input
- Back, forward, reload and home/navigation actions
- Tab switcher and tab lifecycle
- Menus and settings entry points
- Downloads, permissions and first-run flows

Change one area at a time. Keep behavior and visual changes in separate patches when practical.

### 5. Testing checklist
Before calling an APK usable, test:
- Cold start and relaunch
- HTTPS navigation and certificate errors
- Back/forward/reload and address-bar editing
- Opening, switching and closing tabs
- Download flow and file permissions
- Runtime permissions and external intents
- Keyboard, screen reader, contrast and touch targets
- Private browsing behavior
- Crash-free startup on a test device
- Rebuild after updating to a newer upstream security revision

## Current build constraint
The reported Codespace has 2 CPU threads, about 7 GiB RAM and about 18 GiB free disk. Do not attempt a source checkout there. Continue documentation, review and patch preparation until a suitable host is available.

## Official references
- https://chromium.googlesource.com/chromium/src/+/main/docs/android_build_instructions.md
- https://www.chromium.org/developers/how-tos/get-the-code/
