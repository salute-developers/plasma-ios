---
title: ChipGroup
---

Компонент для отображения группы связанных чипов.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `data` | `[ChipData]` | Массив элементов чипов |
| `appearance` | `ChipGroupAppearance?` | Параметры внешнего вида группы чипов (опционально) |
| `flat` | `Bool` | Флаг плоского отображения группы |
| `height` | `Binding<CGFloat>` | Привязка к высоте группы |

## Окружение
- `chipGroupAppearance`: Стандартные настройки внешнего вида группы чипов

## Примеры использования

### Базовая группа чипов

```swift
let chipData = (1...32).map { index in
    ChipData(
        title: "Label",
        isEnabled: true,
        iconImage: Image.image("chipIcon"),
        buttonImage: Image.image("chipClose"),
        appearance: Chip.m.default.appearance,
        accessibility: chipAccessibility,
        removeAction: {}
    )
}
```
