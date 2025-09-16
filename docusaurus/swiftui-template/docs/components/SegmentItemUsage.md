---
title: SegmentItem
---

Элемент сегмента, который может содержать заголовок, подзаголовок, иконку и счетчик.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `id` | `UUID` | Уникальный идентификатор элемента |
| `title` | `String` | Заголовок элемента |
| `subtitle` | `String` | Подзаголовок элемента |
| `iconAttributes` | `ButtonIconAttributes?` | Атрибуты иконки (опционально) |
| `isDisabled` | `Bool` | Флаг отключения элемента |
| `isSelected` | `Bool` | Флаг выбранного состояния |
| `strech` | `Bool` | Флаг растягивания элемента |
| `counterEnabled` | `Bool` | Флаг отображения счетчика |
| `appearance` | `SegmentItemAppearance?` | Параметры внешнего вида элемента (опционально) |
| `accessibility` | `SegmentItemAccessibility` | Параметры доступности |
| `counterViewProvider` | `CounterViewProvider?` | Провайдер представления счетчика |
| `action` | `() -> Void` | Действие при нажатии |

## Окружение
- `segmentItemAppearance`: Стандартные настройки внешнего вида элемента сегмента

## Пример использования
```swift
// Базовый элемент сегмента
SDDSSegmentItem(
    title: "Title",
    subtitle: "Subtitle",
    iconAttributes: nil,
    isSelected: true,
    appearance: SegmentItem.l.secondary.appearance
)

// Элемент с иконкой и счетчиком
SDDSSegmentItem(
    title: "Title",
    subtitle: "",
    iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
    isSelected: true,
    counterEnabled: true,
    appearance: SegmentItem.l.accent.appearance,
    counterViewProvider: .default(text: "5")
)
``` 
