# Roadmap

## Phase 0 — Foundation
- [x] Create project documentation and repository layout
- [x] Add source checkout/build helper scripts
- [x] Add lightweight repository validation workflow
- [x] Add Android-first plan and free-workflow guidance
- [x] Add non-destructive build-capacity preflight
- [ ] Confirm a suitable build host and available quota
- [ ] Pin an upstream Chromium revision

## Phase 1 — Reproducible Android baseline
- [ ] Check host architecture, RAM and free disk
- [ ] Complete a Chromium source checkout on a supported Linux x86-64 host
- [ ] Build unmodified upstream ARM64 Android APK
- [ ] Record revision, build arguments, toolchain and artifact hashes
- [ ] Install and smoke-test on an Android device

## Phase 2 — K.O.T.A.K branding
- [ ] Create app icon and wordmark
- [ ] Locate product identity resources in the pinned Chromium revision
- [ ] Add branding as small reviewable patches
- [ ] Rebuild and test the branded Android APK

## Phase 3 — Browser experience
- [ ] Review toolbar, address bar, tab and menu UX
- [ ] Customize theme and startup experience
- [ ] Test bookmarks, history, downloads and settings
- [ ] Test accessibility, permissions, touch and keyboard behavior

## Phase 4 — Desktop targets
- [ ] Build Linux on a supported Linux host
- [ ] Build Windows on a supported Windows host
- [ ] Build macOS on a compatible Mac with supported Xcode/SDK
- [ ] Package, test and document each platform separately

## Phase 5 — Maintenance
- [ ] Establish regular Chromium security updates
- [ ] Rebase and test custom patches
- [ ] Publish notices and third-party attributions
- [ ] Document signing, release and rollback procedures
