# K.O.T.A.K Browser — Aurora Glass homepage prototype

A responsive, dependency-free HTML/CSS/JavaScript concept for the K.O.T.A.K Browser Android New Tab Page.

## Design

- Aurora Glass: clean white, silver surfaces, soft lavender/ice-blue highlights, translucent panels
- Search near the upper third, followed by website shortcuts and a two-card dashboard
- Lightweight animated background particles and ambient gradient orbs
- Respects the device's reduced-motion preference; particles are decorative only
- Live local clock and accessible labels/focus styles
- Quick commands: `youtube`, `yt`, `github`, `chatgpt`, `google`, `weather`, `time`, and `clear`
- Weather lookup by city using the Open-Meteo geocoding and forecast APIs; weather only loads after the user submits a city
- No external JavaScript/CSS framework, package installation, remote fonts, or remote image assets

## Preview in GitHub Codespaces

From the repository root:

```bash
python3 -m http.server 8000 --directory homepage-prototype
```

Open the forwarded port 8000 in the Codespaces Ports tab. Stop the server with Ctrl+C.

You can also open `index.html` directly in a browser. The weather feature needs an internet connection and access to the Open-Meteo APIs.

## Search and command behaviour

- Normal text is sent to Google Search.
- A full URL or domain (such as `https://example.com` or `example.com`) opens directly.
- Recognised quick commands navigate to their sites or perform the local action.
- The weather card asks for a city rather than silently requesting device location.

## Privacy and limitations

- This prototype does not request GPS/location permission.
- Search queries are sent to Google when the user submits a non-URL query.
- Weather city names and coordinates are sent to Open-Meteo to retrieve forecasts.
- It does not currently persist or sync custom shortcuts.
- The page is a prototype, not yet integrated into Chromium's native Android New Tab Page and not an APK.

## Chromium integration notes

Chromium Android's New Tab Page is integrated with native Android browser components. After approving the design, inspect the exact pinned Chromium revision and implement the UI through the appropriate Android NTP components, or intentionally use a local packaged page only if the selected browser architecture supports that route. Do not assume this HTML file alone replaces Chromium's native NTP.

A WebView wrapper is a different, simpler browser architecture; it is not equivalent to a full Chromium fork and has different engine and security trade-offs.
