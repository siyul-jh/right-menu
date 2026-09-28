# 도구 막대 아이콘 프롬프트

Finder 도구 막대에 놓이는 RightMenu 버튼용 아이콘 1종. 메뉴 아이콘(16px)보다 크게(약 32px) 표시되므로 디테일을 조금 더 넣을 수 있다. 메뉴 아이콘 7종은 `icon-prompts.md`를 참고한다.

| 파일명 | 용도 | 주색 |
|---|---|---|
| `toolbar.png` | 도구 막대 버튼 (전체 메뉴를 대표) | 인디고 `#6366F1` + 기능별 색 점 |

기능 색: 초록 `#10B981`(새 파일), 파랑 `#3B82F6`(에디터), 주황 `#F59E0B`(붙여넣기), 빨강 `#EF4444`(잘라내기). 여러 색이 드러나야 "메뉴 전체"로 읽힌다.

## 프롬프트 (복사용)

```text
A colorful UI toolbar icon for a macOS Finder toolbar button, flat vector style with bold solid color fills and a slightly darker shade of the same hue for depth, rounded corners, simple geometric shapes, thick clean shapes that stay readable at 32px, high color saturation, fully transparent background, no text, no drop shadow, no gradient background, centered with 10% padding, square 1024x1024 PNG, consistent style and visual weight with the rest of the icon set. Must look good on both light and dark backgrounds. Icon subject: a rounded-square in indigo (#6366F1) representing a popup context menu, containing four horizontal menu rows, each row has a small colored circle on the left (emerald green #10B981, blue #3B82F6, orange #F59E0B, red #EF4444) and a white rounded bar on the right as a placeholder label, plus a small white mouse cursor arrow overlapping the bottom-right corner.
```

## 팁

| 문제 | 해결 |
|---|---|
| 투명 배경이 안 나옴 | 흰 배경으로 생성한 뒤 배경 제거 도구로 지운다 |
| 스타일이 메뉴 아이콘과 다름 | 메뉴 아이콘 중 하나(예: `editor.png`)를 참조 이미지로 붙이고 "같은 스타일로"라고 요청한다 |
| 작게 줄이면 뭉개짐 | "simpler shapes, fewer details, thicker forms"를 추가한다 |
| 색이 안 맞음 | HEX 값을 그대로 다시 써서 재생성한다 |

## 적용

`~/right-menu/icons/toolbar.png`로 저장하면 된다. 그러면 `icons/menu/toolbar.png`(현재 2×2 합성 이미지)를 교체하는 작업을 진행한다.
