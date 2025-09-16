---
title: Chip
---

Настраиваемый чип, который может быть настроен с помощью различных параметров.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `title` | `String` | Текст заголовка для чипа |
| `isEnabled` | `Bool` | Флаг, указывающий, включен ли чип |
| `iconImage` | `Image?` | Изображение иконки для чипа (опционально) |
| `buttonImage` | `Image?` | Изображение кнопки для чипа (опционально) |
| `appearance` | `ChipAppearance?` | Параметры внешнего вида чипа |
| `accessibility` | `ChipAccessibility` | Параметры доступности для чипа |
| `removeAction` | `() -> Void` | Действие при нажатии на кнопку удаления |

## Окружение
- `chipAppearance`: Стандартные настройки внешнего вида чипов

## Пример использования

```swift
// Простой чип
SDDSChip(
    title: "Label",
    isEnabled: true,
    iconImage: Image.image("chipIcon"),
    buttonImage: Image.image("chipClose"),
    appearance: Chip.m.pilled.accent.appearance,
    removeAction: {}
)
```
