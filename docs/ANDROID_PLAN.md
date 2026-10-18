# K.O.T.A.K Browser — Android-first plan

## Goal
Produce a reproducible Android ARM64 Chromium build first, then apply K.O.T.A.K branding as a small set of downstream patches.

## Reality check: no paid cloud VM
We can edit this repository from an Android phone, use Codespaces if usage is available, and run lightweight GitHub Actions checks. These do not guarantee a full Chromium build will fit within available disk, memory, runtime, or quotas.

A full Chromium Android build is not a normal Gradle-only app build. It needs Chromium source, `depot_tools`, Android SDK/NDK dependencies managed by the Chromium workflow, GN/Ninja, and a supported Linux x86-64 host. A phone or a default small Codespace should be treated as an editing environment, not a reliable full-build host.

## Stages

### Stage A — Free setup
- [x] Create the project repository scaffold.
- [x] Add Android build documentation and a non-destructive host capacity check.
- [ ] Open the repository in Codespaces if available.
- [ ] Run the lightweight validation workflow.
- [ ] Check actual CPU architecture, RAM, free disk and any Codespaces quota before downloading source.

### Stage B — Chromium baseline
- [ ] Use a supported Linux x86-64 machine with enough disk and memory.
- [ ] Install prerequisites from the official Chromium Android build guide.
- [ ] Fetch Chromium with `depot_tools`.
- [ ] Record the exact upstream Chromium commit.
- [ ] Complete an unmodified ARM64 Android APK build.
- [ ] Install and test the APK on a test device.

### Stage C — K.O.T.A.K customization
- [ ] Identify product identity and Android browser UI resources in the pinned revision.
- [ ] Create small, reviewable patches under `patches/`.
- [ ] Apply the patches and rebuild.
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
uname -m
nproc
free -h
df -h .
git --version
python3 --version
```

If the architecture is not x86-64, or free disk/memory is below current Chromium requirements, stop before running `fetch --nohooks chromium`. Codespaces availability and quota depend on the account and organization settings.
