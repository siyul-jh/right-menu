#!/bin/bash
# dist/Righto-<버전>.dmg 생성 (배경 이미지·아이콘 배치 포함). Finder 를 쓰지 않는 dmgbuild 를 임시 venv 에 설치해 사용한다.
set -euo pipefail
cd "$(dirname "$0")"
V=$(cat VERSION); S=$(mktemp -d)
APP="$S/Righto.app" BUILD_ONLY=1 ./build.sh
python3 -m venv "$S/venv"
"$S/venv/bin/pip" -q install dmgbuild
cat > "$S/settings.py" <<PY
files = ["$S/Righto.app"]
symlinks = {"Applications": "/Applications"}
background = "$PWD/icons/dmg-background.tiff"
icon = "$PWD/icons/Righto.icns"
icon_size = 128
text_size = 13
window_rect = ((200, 120), (660, 400))
icon_locations = {"Righto.app": (165, 200), "Applications": (495, 200)}
default_view = "icon-view"
show_status_bar = False
show_tab_view = False
show_toolbar = False
show_pathbar = False
show_sidebar = False
format = "UDZO"
PY
mkdir -p dist
"$S/venv/bin/dmgbuild" -s "$S/settings.py" "Righto $V" "dist/Righto-$V.dmg"
rm -rf "$S"
