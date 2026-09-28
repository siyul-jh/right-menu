#!/bin/bash
# dist/Righto-<버전>.dmg 생성 (앱 + /Applications 바로가기)
set -euo pipefail
cd "$(dirname "$0")"
V=$(cat VERSION); S=$(mktemp -d)
APP="$S/Righto.app" BUILD_ONLY=1 ./build.sh
ln -s /Applications "$S/Applications"
mkdir -p dist
hdiutil create -volname "Righto $V" -srcfolder "$S" -ov -format UDZO "dist/Righto-$V.dmg"
rm -rf "$S"
