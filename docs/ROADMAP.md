# Roadmap

## Phase 0 — Foundation
- [x] Create project documentation and repository layout
- [x] Add source checkout/build helper scripts
- [x] Add lightweight repository validation workflow
- [x] Add Android-first plan and free-workflow guidance
- [x] Add revision-aware source investigation plan
- [x] Add Android customization notes and upstream revision record
- [x] Add read-only source inspection and patch-check scripts
- [x] Confirm current Codespaces capacity is insufficient
- [ ] Run lightweight GitHub Actions validation
- [ ] Find a suitable build host without incurring charges

## Phase 1 — Reproducible Android baseline
- [ ] Pin an actual upstream Chromium commit
- [ ] Complete a Chromium source checkout on a supported Linux x86-64 host
- [ ] Build unmodified upstream ARM64 Android APK
- [ ] Record revision, build arguments, toolchain and artifact hashes
- [ ] Install and smoke-test on an Android device

## Phase 2 — K.O.T.A.K branding
- [ ] Inspect actual product identity resources in the pinned revision
- [ ] Create small reviewable branding patches
- [ ] Validate patches against the exact pinned checkout
- [ ] Rebuild and test branded Android APK

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

## Current status
No upstream revision is pinned, no branding patch is active, and no APK has been built or tested. See [the revision-aware investigation plan](SOURCE_INVESTIGATION.md).
