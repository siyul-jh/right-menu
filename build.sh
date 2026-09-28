#!/bin/bash
# 로컬 ad-hoc 서명 빌드 → ~/Applications/RightMenu.app
set -euo pipefail
cd "$(dirname "$0")"
APP=~/Applications/RightMenu.app; EXT="$APP/Contents/PlugIns/FinderMenu.appex"
ID=local.rightmenu
rm -rf "$APP"; mkdir -p "$APP/Contents/MacOS" "$EXT/Contents/MacOS"
swiftc -O -o "$APP/Contents/MacOS/RightMenu" Host.swift
swiftc -O -module-name FinderMenu -application-extension -o "$EXT/Contents/MacOS/FinderMenu" FinderMenu.swift \
  -framework FinderSync -framework Cocoa -Xlinker -e -Xlinker _NSExtensionMain
cat > "$APP/Contents/Info.plist" <<P
<?xml version="1.0" encoding="UTF-8"?><plist version="1.0"><dict>
<key>CFBundleIdentifier</key><string>$ID</string><key>CFBundleName</key><string>RightMenu</string>
<key>CFBundleExecutable</key><string>RightMenu</string><key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>1.0</string><key>CFBundleVersion</key><string>1</string>
<key>LSUIElement</key><true/></dict></plist>
P
cat > "$EXT/Contents/Info.plist" <<P
<?xml version="1.0" encoding="UTF-8"?><plist version="1.0"><dict>
<key>CFBundleIdentifier</key><string>$ID.finder</string><key>CFBundleName</key><string>FinderMenu</string>
<key>CFBundleDisplayName</key><string>RightMenu</string>
<key>CFBundleExecutable</key><string>FinderMenu</string><key>CFBundlePackageType</key><string>XPC!</string>
<key>CFBundleShortVersionString</key><string>1.0</string><key>CFBundleVersion</key><string>1</string>
<key>NSExtension</key><dict><key>NSExtensionPointIdentifier</key><string>com.apple.FinderSync</string>
<key>NSExtensionPrincipalClass</key><string>FinderMenu.FinderMenu</string></dict></dict></plist>
P
mkdir -p "$EXT/Contents/Resources" && cp icons/menu/*.png "$EXT/Contents/Resources/"
codesign -f -s - --entitlements ext.entitlements "$EXT"
codesign -f -s - "$APP"
open "$APP"; sleep 1
pluginkit -a "$EXT"; pluginkit -e use -i $ID.finder
killall Finder
pluginkit -m -i $ID.finder -v
