# Revision-aware Chromium source investigation plan

## Purpose
Locate the correct Chromium source files for K.O.T.A.K Android branding and UI work without downloading Chromium now and without guessing file paths from memory.

## Current facts
- Repository: `MKpro8880/browser`
- This is the downstream project/patch repository, not the Chromium source tree.
- No upstream Chromium revision has been selected or checked out.
- The current Codespaces report showed about 18 GiB free disk and 7 GiB RAM. Do not start a Chromium checkout in that environment.
- No APK has been built.

## Principles
1. **Revision first.** Chromium paths, classes, resources, and GN targets change over time. Tie every finding to a concrete upstream commit.
2. **Read-only discovery.** The inspection script reads an already-existing local checkout. It never clones, fetches, syncs, edits, or deletes Chromium files.
3. **Upstream before branding.** Inspect and build the unmodified Android target before applying customizations.
4. **Small patches.** Avoid broad search-and-replace, generated files, or large source copies.
5. **Security maintenance.** Re-review every patch when updating Chromium.

## Investigation sequence (once a suitable source checkout exists)
1. Record the checkout commit and worktree status:
   ```bash
   git -C "$CHROMIUM_SRC" rev-parse HEAD
   git -C "$CHROMIUM_SRC" status --short
   ```
2. Record the actual commit, date, ref (if known), and Android target in [UPSTREAM_REVISION.md](UPSTREAM_REVISION.md). Never guess a commit hash.
3. Run `bash scripts/inspect-chromium-tree.sh "$CHROMIUM_SRC"`. The script prints findings; it does not write files by default.
4. Inspect Android browser sources/resources in that exact checkout. Common search starting points include:
   - `chrome/android/java/src/org/chromium/chrome/browser/`
   - `chrome/android/java/res/`
   - `chrome/android/java/src/org/chromium/chrome/browser/toolbar/`
   - `chrome/android/java/src/org/chromium/chrome/browser/tabmodel/`
   These are candidates, not guarantees for every revision.
5. Trace app labels, product strings, icons, startup/first-run UI and toolbar resources to their owning resources and GN targets.
6. Use `git log`, `git blame`, and source references at the pinned revision to understand ownership and refactors.
7. Write a proposed change list before editing: intended file, user-visible effect, tests and update risk.
8. Create one patch at a time. Validate with `scripts/check-patches.sh` against the matching checkout.
9. Build the unmodified Android target first, then apply and build the patch. Record test results honestly.

## Suggested queries (inside an existing checkout only)
```bash
git -C "$CHROMIUM_SRC" grep -n -i -E 'product name|first run|toolbar|application label' -- chrome/android
find "$CHROMIUM_SRC/chrome/android/java" -maxdepth 5 -type d 2>/dev/null | head -n 80
```

## Exit criteria
- A real upstream commit is recorded.
- Exact source files and resource ownership are confirmed in that revision.
- Proposed patches and relevant build targets are identified.
- No claim is made that changes compile until a real build/test completes.
