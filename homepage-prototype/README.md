# Homepage prototype

A lightweight, dependency-free HTML/CSS/JavaScript mockup for the K.O.T.A.K Browser Android New Tab Page.

## Preview in GitHub Codespaces

From the repository root:

```bash
python3 -m http.server 8000 --directory homepage-prototype
```

Open the forwarded port 8000 in the Codespaces Ports tab. Stop the server with Ctrl+C.

## Current behaviour

- Responsive minimal layout
- Quick links to YouTube, GitHub, ChatGPT, and Google
- Search text submits to Google; a domain or URL navigates directly
- No framework, package install, build step, remote fonts, or remote images

## Important integration note

This is a visual/interaction prototype, not yet wired into Chromium's Android New Tab Page and not an APK. Chromium Android's New Tab Page is integrated with native Android browser components. After the design is approved, inspect the exact pinned Chromium revision and implement the UI through the relevant Android NTP components, or deliberately use a local packaged page only if the chosen browser architecture supports that route. Do not blindly copy this file into Chromium and assume it replaces the native NTP.

Do not use a WebView wrapper as if it were a full Chromium fork; that would be a separate, simpler browser architecture with different engine and security trade-offs.
