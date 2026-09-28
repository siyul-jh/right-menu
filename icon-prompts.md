# RightMenu 메뉴 아이콘 프롬프트 (컬러 버전)

macOS Finder 우클릭 메뉴용 아이콘 7종. 기능마다 다른 색을 쓰되, 메뉴에서 16~20px로 작게 보이므로 **단순한 도형 + 굵은 면 + 높은 채도**로 만든다.

## 색상 배정

| 파일명 | 기능 | 주색 | HEX |
|---|---|---|---|
| `terminal.png` | 터미널 | 슬레이트 + 초록 프롬프트 | `#2D3748` / `#48E06B` |
| `editor.png` | Antigravity로 열기 | 파랑 | `#3B82F6` |
| `copy.png` | 경로 복사 | 보라 | `#8B5CF6` |
| `new.png` | 새 파일 | 에메랄드 초록 | `#10B981` |
| `cut.png` | 잘라내기 | 빨강 | `#EF4444` |
| `paste.png` | 붙여넣기 | 주황 | `#F59E0B` |
| `hidden.png` | 숨김 파일 표시 | 청록(시안) | `#06B6D4` |
| `toolbar.png` | 도구 막대 버튼 (전체 메뉴) | 인디고 + 무지개 항목 점 | `#6366F1` |

## 사용법

1. 항목별 프롬프트를 복사해 이미지 생성 AI에 입력한다. 공통 스타일이 이미 포함돼 있다.
2. **같은 세션에서 연속 생성**해야 스타일이 일관된다.
3. 결과를 `~/right-menu/icons/`에 위 파일명으로 저장한다.

## 공통 스타일 (참고용)

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds.
```

## 아이콘별 프롬프트 (복사용 완성본)

### 1. 터미널 — `terminal.png`

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds. Icon subject: a rounded-square terminal window in dark slate (#2D3748) with a bright green (#48E06B) ">_" prompt symbol in the center.
```

### 2. Antigravity로 열기 — `editor.png`

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds. Icon subject: a rounded-square in vivid blue (#3B82F6) with white code brackets "</>" in the center.
```

### 3. 경로 복사 — `copy.png`

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds. Icon subject: two overlapping document pages in purple (#8B5CF6), the front one lighter with a small white slash "/" path mark on it, representing copying a file path.
```

### 4. 새 파일 — `new.png`

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds. Icon subject: a white document page with a folded corner, and a large emerald green (#10B981) circle with a white plus sign in its lower right.
```

### 5. 잘라내기 — `cut.png`

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds. Icon subject: a pair of open scissors with red (#EF4444) handles and light gray metal blades.
```

### 6. 붙여넣기 — `paste.png`

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds. Icon subject: an orange (#F59E0B) clipboard with a dark clip at the top and a white document page sitting on it.
```

### 7. 숨김 파일 표시 전환 — `hidden.png`

```text
A colorful UI menu icon for a macOS app, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 16px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight across the whole icon set. Must look good on both light and dark backgrounds. Icon subject: an open eye with a white almond-shaped outline, a cyan (#06B6D4) iris, and a dark pupil.
```

### 8. 도구 막대 버튼 — `toolbar.png`

Finder 도구 막대에 놓이는 버튼이다. 다른 아이콘보다 크게(약 32px) 표시되므로 조금 더 디테일을 넣어도 된다. 7가지 기능 색(초록 `#10B981`, 파랑 `#3B82F6`, 보라 `#8B5CF6`, 주황 `#F59E0B`, 빨강 `#EF4444`, 청록 `#06B6D4`)이 전부 드러나야 "메뉴 전체"로 읽힌다.

```text
A colorful UI toolbar icon for a macOS Finder toolbar button, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 32px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight with the rest of the icon set. Must look good on both light and dark backgrounds. Icon subject: a rounded-square in indigo (#6366F1) representing a popup context menu, containing four horizontal menu rows, each row has a small colored circle on the left (emerald green #10B981, blue #3B82F6, orange #F59E0B, red #EF4444) and a white rounded bar on the right as a placeholder label, plus a small white mouse cursor arrow overlapping the bottom-right corner.
```

## 팁

| 문제 | 해결 |
|---|---|
| 투명 배경이 안 나옴 | 흰 배경으로 생성한 뒤 배경 제거 도구로 지운다 |
| 아이콘마다 스타일이 다름 | 첫 결과를 참조 이미지로 붙이고 "같은 스타일로 다음 아이콘"이라고 요청한다 |
| 작게 줄이면 뭉개짐 | "simpler shapes, fewer details, thicker forms"를 추가한다 |
| 색이 안 맞음 | HEX 값을 그대로 다시 써서 재생성한다 |
| 크기 | 1024×1024로 받으면 된다. 32×32와 64×64로 줄여서 쓴다 |

## 다음 단계

이미지를 `~/right-menu/icons/`에 넣으면 `FinderMenu.swift`가 SF Symbols 대신 이 PNG를 쓰도록 수정한다. 컬러 이미지라서 다크 모드 자동 반전은 되지 않는다. 그래서 어두운 배경에서도 읽히도록 밝은 톤의 채도 높은 색을 쓴다.
