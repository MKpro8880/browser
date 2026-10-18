# Chromium downstream patches

This directory contains small, reviewable K.O.T.A.K changes applied to a separately checked-out Chromium source tree.

## Current status
- No Chromium source checkout is included in this repository.
- No upstream revision has been selected or pinned yet.
- No K.O.T.A.K branding patch has been authored or tested yet.
- `series` is an ordered manifest; comments and blank lines are ignored.

Do not invent source paths or create a patch against an unknown Chromium revision. First follow [the source investigation plan](../docs/SOURCE_INVESTIGATION.md), record the exact Chromium commit in [UPSTREAM_REVISION.md](../docs/UPSTREAM_REVISION.md), and inspect the matching source tree.

## Patch requirements
Each patch should:
1. Target a recorded Chromium commit/revision.
2. Be as small and focused as practical.
3. Include a short rationale and the source files it changes.
4. Be checked with `scripts/check-patches.sh` against the matching local checkout.
5. Be applied to a clean checkout and built/tested on the appropriate platform before being called verified.
6. Be re-reviewed whenever the upstream revision changes.

## Naming convention
Use ordered names such as `0001-kotak-product-identity.patch`. Add each filename to `series` in application order only after the patch exists.

## Safety
Patch validation uses `git apply --check`; it does not apply changes. Do not run a patch against a different revision and assume success means it is correct for all Chromium versions.
