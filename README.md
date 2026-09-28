# RightMenu

macOS Finder 우클릭 메뉴 확장 (Finder Sync). 터미널 열기, 에디터로 열기, 경로 복사, 새 파일, 잘라내기/붙여넣기, 숨김 파일 전환.

## 빌드·설치

```sh
./build.sh   # ~/Applications/RightMenu.app 에 ad-hoc 서명 빌드 후 확장 등록, Finder 재시작
```

Xcode(swiftc)만 필요. 시스템 설정 > 개인정보 보호 및 보안 > 확장 프로그램 > Finder 에서 RightMenu 가 켜져 있어야 한다.

## 구조

- `FinderMenu.swift` — Finder Sync 확장 (샌드박스). 메뉴·동작.
- `Host.swift` — 샌드박스 밖 헬퍼. 숨김 파일 전환처럼 Finder 설정을 바꾸는 작업만 담당 (실행 자체가 전환 동작, `--register` 는 건너뜀).

## 설정

`FinderMenu.swift` 상단의 `TERMINAL`, `EDITOR` 경로를 바꾸고 `./build.sh`.

## 아이콘

원본은 `icons/*.png`(1024px), 메뉴용 64px 은 `icons/menu/`. 아이콘 생성 프롬프트는 `icon-prompts.md`.

## 한계

- iCloud Drive 폴더는 macOS 가 Finder Sync 를 막아 우클릭 메뉴가 뜨지 않는다. 도구 막대의 RightMenu 버튼을 사용.
- macOS 업데이트 후 메뉴가 사라지면 `./build.sh` 재실행.
