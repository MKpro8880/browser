# K.O.T.A.K Browser — Android-first plan

## Goal
Produce a reproducible Android ARM64 Chromium build first, then apply K.O.T.A.K branding as small downstream patches.

## Current Codespaces assessment
The reported Codespace has 2 CPU threads, about 7 GiB RAM and about 18 GiB free disk. Do not start a Chromium checkout there. Upstream's Android guide specifies an x86-64 Linux host with at least 8 GB RAM, recommends more than 16 GB, and requires at least 100 GB free disk. See the official guide linked below.

## No-paid-cloud strategy
We can edit this small repository, create and review patches, and run lightweight CI while free usage is available. That does not make a full Chromium checkout/build possible on the current Codespace. We will not fetch Chromium until a host passes the preflight.

## Stages

### Stage A — Free setup
- [x] Create project repository scaffold.
- [x] Add Android build documentation and a non-destructive host capacity check.
- [x] Add a checkout helper that refuses to fetch on undersized hosts.
- [x] Confirm current Codespaces capacity is insufficient.
- [ ] Run lightweight GitHub Actions validation.
- [ ] Find a supported host with adequate disk/RAM without incurring charges.

### Stage B — Chromium baseline
- [ ] Use a supported Linux x86-64 machine with at least 100 GB free disk and 8 GB RAM minimum; more than 16 GB RAM is recommended.
- [ ] Install prerequisites from the official Chromium Android build guide.
- [ ] Fetch Android Chromium with `depot_tools`.
- [ ] Record the exact upstream Chromium commit.
- [ ] Complete an unmodified ARM64 Android APK build.
- [ ] Install and test the APK on a test device.

### Stage C — K.O.T.A.K customization
- [ ] Identify product identity and Android browser UI resources in the pinned revision.
- [ ] Create small, reviewable patches under `patches/`.
- [ ] Apply patches and rebuild.
- [ ] Test launch, navigation, tabs, downloads, permissions, accessibility and security updates.

### Stage D — Release
- [ ] Define signing and distribution process.
- [ ] Keep signing keys and credentials out of Git.
- [ ] Publish build provenance, upstream revision and third-party notices.
- [ ] Set a regular Chromium security update cadence.

## Official documentation
- Source checkout: https://www.chromium.org/developers/how-tos/get-the-code/
- Android build guide: https://chromium.googlesource.com/chromium/src/+/main/docs/android_build_instructions.md
- Linux build guide: https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md

## First commands in Codespaces
Run these before any large download:

```bash
bash scripts/check-build-capacity.sh
uname -m
nproc
free -h
df -h "$HOME"
```

Do not run `fetch` unless the host meets the current upstream requirements and quota/storage implications are understood.
