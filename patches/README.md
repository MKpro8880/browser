# Chromium downstream patches

This folder contains K.O.T.A.K-specific changes applied to a pinned Chromium checkout.

## Rules
- Keep patches small and focused.
- Include the upstream revision they were created against in the commit/patch notes.
- Test patches against the exact pinned revision.
- Re-review changes when updating Chromium.
- Do not copy large upstream source subtrees into this repository.

Add patches here only after a baseline build works. Update `series` in application order.
