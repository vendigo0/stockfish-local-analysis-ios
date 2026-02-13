# Stockfish Local Analysis (iOS)

iOS wrapper around the local chess analysis web UI, packaged with `WKWebView` and bundled assets.

## Features

- Apple-style light interface
- Local bundled web app (`ChessAnalysis/Web/`)
- Board interactions + engine lines + humanization controls
- Offline-friendly library loading with local-first strategy

## Project Structure

- `ChessAnalysis.xcodeproj` - Xcode project
- `ChessAnalysis/` - Swift app files
  - `ChessAnalysisApp.swift`
  - `ContentView.swift`
  - `WebView.swift`
  - `Web/` (HTML app + libs + piece assets)

## Requirements

- Xcode 15+
- iOS target: 15+
- Apple signing profile (Personal Team works for local install)

## Build

1. Open `ChessAnalysis.xcodeproj`
2. Set `Signing & Capabilities` team
3. Build/run on device or simulator

## Archive / IPA

```bash
xcodebuild -project ChessAnalysis.xcodeproj \
  -scheme ChessAnalysis \
  -configuration Release \
  -archivePath build/ChessAnalysis.xcarchive \
  archive

xcodebuild -exportArchive \
  -archivePath build/ChessAnalysis.xcarchive \
  -exportOptionsPlist ExportOptions.plist \
  -exportPath build
```

## Notes

- If screen is blank, verify bundled `Web/index.html` and `Web/libs/*` are present in target resources.
- Zoom/pinch is disabled in `WKWebView` for app-like interaction.

## Related

Web repository: `stockfish-local-analysis-web`

## License

MIT (recommended)
