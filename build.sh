#!/bin/bash
# 로컬 ad-hoc 서명 빌드 → ~/Applications/Righto.app
set -euo pipefail
cd "$(dirname "$0")"
APP=${APP:-~/Applications/Righto.app}; V=$(cat VERSION); EXT="$APP/Contents/PlugIns/FinderMenu.appex"
ID=local.righto
rm -rf "$APP"; mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources" "$EXT/Contents/MacOS"
cp icons/Righto.icns "$APP/Contents/Resources/"
cp icons/menu/rename.png icons/menu/goto.png "$APP/Contents/Resources/"  # 이름 변경·폴더 이동 창 아이콘
swiftc -O -o "$APP/Contents/MacOS/Righto" Host.swift Config.swift Tools.swift
swiftc -O -module-name FinderMenu -application-extension -o "$EXT/Contents/MacOS/FinderMenu" FinderMenu.swift Config.swift \
  -framework FinderSync -framework Cocoa -Xlinker -e -Xlinker _NSExtensionMain
cat > "$APP/Contents/Info.plist" <<P
<?xml version="1.0" encoding="UTF-8"?><plist version="1.0"><dict>
<key>CFBundleIdentifier</key><string>$ID</string><key>CFBundleName</key><string>Righto</string>
<key>CFBundleExecutable</key><string>Righto</string><key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>$V</string><key>CFBundleVersion</key><string>$V</string>
<key>CFBundleIconFile</key><string>Righto</string><key>LSUIElement</key><true/>
<key>CFBundleURLTypes</key><array><dict><key>CFBundleURLName</key><string>Righto</string><key>CFBundleURLSchemes</key><array><string>righto</string></array></dict></array>
</dict></plist>
P
cat > "$EXT/Contents/Info.plist" <<P
<?xml version="1.0" encoding="UTF-8"?><plist version="1.0"><dict>
<key>CFBundleIdentifier</key><string>$ID.finder</string><key>CFBundleName</key><string>FinderMenu</string>
<key>CFBundleDisplayName</key><string>Righto</string>
<key>CFBundleExecutable</key><string>FinderMenu</string><key>CFBundlePackageType</key><string>XPC!</string>
<key>CFBundleShortVersionString</key><string>$V</string><key>CFBundleVersion</key><string>$V</string>
<key>NSExtension</key><dict><key>NSExtensionPointIdentifier</key><string>com.apple.FinderSync</string>
<key>NSExtensionPrincipalClass</key><string>FinderMenu.FinderMenu</string></dict></dict></plist>
P
mkdir -p "$EXT/Contents/Resources" && cp icons/menu/*.png "$EXT/Contents/Resources/"
codesign -f -s - --entitlements ext.entitlements "$EXT"
codesign -f -s - "$APP"
[ -z "${BUILD_ONLY:-}" ] || exit 0  # dmg.sh 는 빌드만 하고 설치·등록은 건너뜀
open "$APP" --args --register; sleep 1
pluginkit -a "$EXT"; pluginkit -e use -i $ID.finder
killall Finder
pluginkit -m -i $ID.finder -v
