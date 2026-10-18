# Roadmap

## Phase 0 — Foundation
- [x] Create project documentation and repository layout
- [x] Add source checkout/build helper scripts
- [x] Add lightweight repository validation workflow
- [ ] Rename the GitHub repository to `kotak-browser` if desired
- [ ] Choose a supported cloud host and confirm available disk/RAM
- [ ] Pin an upstream Chromium revision and record it

## Phase 1 — Reproducible upstream builds
- [ ] Complete a clean Linux x86-64 Chromium checkout
- [ ] Build upstream Linux desktop Chromium
- [ ] Build upstream Android ARM64 APK
- [ ] Record revision, arguments, toolchain and artifact hashes
- [ ] Validate on a test device before customization

## Phase 2 — Branding
- [ ] Create K.O.T.A.K wordmark, icon and app assets
- [ ] Locate product identity resources in the pinned Chromium revision
- [ ] Add branding as reviewable patches
- [ ] Build and test branded Android and desktop versions

## Phase 3 — Browser experience
- [ ] Review toolbar, address bar and tab UX
- [ ] Customize theme and menus
- [ ] Review bookmarks, history, downloads and settings
- [ ] Test accessibility, keyboard, touch and responsive layouts

## Phase 4 — Platform release pipeline
- [ ] Android packaging and signing
- [ ] Linux package strategy
- [ ] Native Windows build and installer
- [ ] Native macOS build and app packaging
- [ ] Automated smoke tests and artifact provenance

## Phase 5 — Maintenance
- [ ] Establish a regular Chromium security update cadence
- [ ] Rebase and test custom patches
- [ ] Publish notices and third-party attributions
- [ ] Document release and rollback procedures
