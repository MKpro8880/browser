# Architecture

## Goal
K.O.T.A.K Browser is a downstream customization of the Chromium browser, not a WebView or Electron wrapper.

## Source-of-truth model
1. This repository stores project documentation, branding, scripts, and downstream patches.
2. A separate working directory contains Chromium's source checkout managed by `depot_tools`.
3. Every build records the upstream Chromium commit/revision, toolchain details, applied patches, and build arguments.
4. Changes are applied as small patches and reviewed before updating the pinned upstream revision.

## Platform matrix

| Platform | Build host | Initial goal |
|---|---|---|
| Android | Linux x86-64 | Build an upstream ARM64 APK first |
| Linux | Linux x86-64 | Build the upstream `chrome` target |
| Windows | Supported Windows host/toolchain | Build native Windows Chromium |
| macOS | Mac with supported Xcode/SDK | Build native macOS Chromium |

A Linux build does not produce native Windows or macOS binaries. Android and desktop builds use different GN arguments and targets.

## Customization layers
- Product identity: name, icons, metadata, startup assets.
- Browser UX: toolbar, tabs, menus, settings, navigation.
- Platform-specific behavior: Android UI versus desktop window/tab UI.
- Release engineering: signing, packaging, update channels, notices.

## Non-goals for the first milestone
- Rewriting Chromium's rendering engine.
- Shipping untested security-sensitive changes.
- Running a full Chromium build in a phone's local storage or a default small Codespace.
