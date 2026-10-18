# Free workflow from an Android phone

## What can be done for free
- Edit files in the GitHub web interface or Codespaces, subject to availability and quota.
- Store source patches, documentation, scripts and branding assets in this repository.
- Run lightweight GitHub Actions validation, subject to included minutes and runner limits.
- Use Termux for Git, shell scripting and small local checks where supported.

## What this does not guarantee
- A full Chromium checkout or build will fit in a default Codespace.
- GitHub Actions runners will have enough disk, memory, or runtime for Chromium.
- A Linux runner can produce native Windows or macOS release builds.
- Repository scripts by themselves create a working APK.

## Safe next steps
1. Open this repository in Codespaces if the option is available.
2. Run `bash scripts/check-build-capacity.sh`.
3. Inspect `df -h .`, `free -h`, and `uname -m`.
4. Do not run the Chromium source fetch unless the host meets the current upstream requirements and you understand the storage/quota implications.
5. Run the repository validation workflow first.

## Full Chromium build requirements
Use the official Chromium Android and Linux build guides linked in [ANDROID_PLAN.md](ANDROID_PLAN.md). Requirements can change with upstream revisions, so verify them before provisioning or starting a build.
