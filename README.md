<div align="center">

<img src="icons/menu/toolbar.png" width="128" alt="RightMenu">

# RightMenu

**Windows처럼 쓰는 macOS Finder 우클릭 메뉴**

터미널 열기 · 에디터로 열기 · 경로 복사 · 새 파일 · 잘라내기/붙여넣기 · 숨김 파일 전환

![macOS](https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=white)
![Swift](https://img.shields.io/badge/Swift-FA7343?logo=swift&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue)
![Network](https://img.shields.io/badge/network-none-brightgreen)

</div>

---

## 기능

| | 기능 | 설명 |
|---|---|---|
| <img src="icons/menu/terminal.png" width="24"> | **여기서 터미널 열기** | 선택한 폴더(파일이면 그 위치)를 지정한 터미널로 연다 |
| <img src="icons/menu/editor.png" width="24"> | **에디터로 열기** | 선택한 파일·폴더를 지정한 에디터로 연다 |
| <img src="icons/menu/copy.png" width="24"> | **경로 복사** | 전체 경로 / 이름만 / 셸 이스케이프 경로 / 상대 경로 |
| <img src="icons/menu/new.png" width="24"> | **새 파일** | `.txt` `.md` `.json` `.html` `.py` `.sh` (json·html·sh는 기본 내용 포함) |
| <img src="icons/menu/cut.png" width="24"> | **잘라내기** | 선택 항목을 잘라낸다 |
| <img src="icons/menu/paste.png" width="24"> | **여기에 붙여넣기 (이동)** | 잘라낸 항목이 있을 때만 나타난다. 이름이 겹치면 번호를 붙인다 |
| <img src="icons/menu/hidden.png" width="24"> | **숨김 파일 표시 전환** | `Cmd+Shift+.` 와 같은 효과를 메뉴에서 실행한다 |

폴더 배경, 폴더, 파일 우클릭과 Finder 도구 막대 버튼에서 같은 메뉴를 쓸 수 있다.

## 설치

### 방법 1. DMG (권장)

```sh
./dmg.sh   # dist/RightMenu-<버전>.dmg 생성
```

1. `dist/RightMenu-0.0.1.dmg`를 열고 **RightMenu.app**을 **Applications**로 끌어다 놓는다.
2. `RightMenu.app`을 한 번 실행한다(화면에는 아무것도 뜨지 않는다).
3. **시스템 설정 > 개인정보 보호 및 보안 > 확장 프로그램 > Finder**에서 `RightMenu`를 켠다.

> **다른 Mac에서 받은 DMG:** Apple 개발자 인증(공증)이 없는 ad-hoc 서명이라 "확인되지 않은 개발자" 경고가 뜬다. 소스를 확인한 뒤 격리 속성을 제거하고 실행한다.
> ```sh
> xattr -dr com.apple.quarantine /Applications/RightMenu.app
> ```
>
> **소스 빌드 버전이 이미 있다면:** `~/Applications/RightMenu.app`을 지우고 설치해야 확장이 중복 등록되지 않는다.

### 방법 2. 소스 빌드

Xcode(`swiftc`)만 있으면 된다. 외부 의존성은 없다.

```sh
git clone https://github.com/siyul-jh/right-menu
cd right-menu
./build.sh
```

`build.sh`는 `~/Applications/RightMenu.app`을 ad-hoc 서명으로 빌드하고 Finder 확장을 등록한 뒤 Finder를 재시작한다.

메뉴가 나오지 않으면 **시스템 설정 > 개인정보 보호 및 보안 > 확장 프로그램 > Finder**에서 `RightMenu`를 켠다.

### 숨김 파일 전환 권한 (선택)

Finder를 재시작하지 않고 전환하려면 **시스템 설정 > 개인정보 보호 및 보안 > 손쉬운 사용**에 `~/Applications/RightMenu.app`을 추가해 켠다.
권한이 없으면 설정을 바꾸고 Finder를 재시작하는 방식으로 대신 동작한다(화면이 잠깐 깜박임).

## 설정

`FinderMenu.swift` 상단의 경로를 바꾸고 `./build.sh`를 다시 실행한다.

```swift
private static let TERMINAL = URL(fileURLWithPath: "/Applications/cmux.app")
private static let EDITOR   = URL(fileURLWithPath: "/Applications/Antigravity IDE.app")
```

## 구조

```
right-menu/
├── FinderMenu.swift     Finder Sync 확장 (샌드박스). 메뉴와 동작
├── Host.swift           샌드박스 밖 헬퍼. 숨김 파일 전환만 담당
├── ext.entitlements     확장 권한 (샌드박스 + /Users/, /Volumes/ 쓰기)
├── build.sh             빌드 · 서명 · 등록 스크립트
├── dmg.sh               DMG 생성 스크립트 (dist/RightMenu-<버전>.dmg)
├── VERSION              버전 (현재 0.0.1)
└── icons/               아이콘 원본(1024px)과 메뉴용(64px)
```

- **네트워크 코드 없음.** 통신하는 부분이 없고 외부 라이브러리도 쓰지 않는다.
- **최소 권한.** 확장은 샌드박스에서 실행되며 `/Users/`와 `/Volumes/`에만 쓸 수 있다.
- 샌드박스 확장은 실행 인자를 넘길 수 없어서, 헬퍼는 **실행되는 것 자체가 숨김 파일 전환 동작**이다. `build.sh`는 `--register`로 실행해 이를 건너뛴다.

## 한계

| 상황 | 내용 |
|---|---|
| **iCloud Drive** | macOS가 Finder Sync 확장을 막아 우클릭 메뉴가 뜨지 않는다. 도구 막대의 RightMenu 버튼을 사용한다 |
| **macOS 업데이트 후** | 메뉴가 사라지면 `./build.sh`를 다시 실행한다 |
| **재빌드 후** | ad-hoc 서명이라 손쉬운 사용 권한이 초기화될 수 있다 |
| **다른 Mac에서 사용** | 그 Mac에서 `./build.sh`를 다시 실행해야 한다 |

## 아이콘

아이콘은 AI로 생성했다. 프롬프트는 [`icon-prompts.md`](icon-prompts.md)(메뉴 7종)와 [`toolbar-icon-prompt.md`](toolbar-icon-prompt.md)(도구 막대)에 있다.

## 라이선스

[MIT](LICENSE)
