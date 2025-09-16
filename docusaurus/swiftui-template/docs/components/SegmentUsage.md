---
title: Segment
---

Компонент для отображения группы связанных опций, где пользователь может выбрать один вариант.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `items` | `[SDDSSegmentItemData]` | Массив элементов сегмента |
| `appearance` | `SegmentAppearance?` | Параметры внешнего вида сегмента (опционально) |
| `layoutMode` | `SegmentLayoutMode` | Режим расположения элементов (fixed/flexible) |
| `layoutOrientation` | `SegmentLayoutOrientation` | Ориентация сегмента (horizontal/vertical) |
| `selectedItemId` | `Binding<UUID?>` | ID выбранного элемента |
| `isDisabled` | `Bool` | Флаг отключения сегмента |
| `stretch` | `Bool` | Флаг растягивания элементов |
| `hasBackground` | `Bool` | Флаг отображения фона |

## Окружение
- `segmentAppearance`: Стандартные настройки внешнего вида сегмента

## Режимы расположения (SegmentLayoutMode)

`SegmentLayoutMode` определяет режим расположения элементов в сегменте:

- `fixed`: Фиксированное расположение элементов
- `flexible`: Гибкое расположение элементов

## Ориентация сегмента (SegmentLayoutOrientation)

`SegmentLayoutOrientation` определяет ориентацию сегмента:

- `horizontal`: Горизонтальное расположение сегментов
- `vertical`: Вертикальное расположение сегментов

## Примеры использования

### Горизонтальный сегмент с фиксированным расположением

```swift
// Горизонтальный сегмент
SDDSSegment(
    items: [
        SDDSSegmentItemData(
            title: "Title",
            subtitle: "Subtitle",
            iconAttributes: nil,
            isSelected: true,
            appearance: SegmentItem.l.accent.appearance,
            action: {}
        ),
        SDDSSegmentItemData(
            title: "Title",
            subtitle: "Subtitle",
            iconAttributes: nil,
            isSelected: false,
            appearance: SegmentItem.l.accent.appearance,
            action: {}
        )
    ],
    appearance: Segment.l.accent.appearance,
    layoutOrientation: .horizontal,
    selectedItemId: selectedId
)

// Вертикальный сегмент
SDDSSegment(
    items: [
        SDDSSegmentItemData(
            title: "Title",
            subtitle: "Subtitle",
            iconAttributes: nil,
            isSelected: true,
            appearance: SegmentItem.l.accent.appearance,
            action: {}
        ),
        SDDSSegmentItemData(
            title: "Title",
            subtitle: "Subtitle",
            iconAttributes: nil,
            isSelected: false,
            appearance: SegmentItem.l.accent.appearance,
            action: {}
        )
    ],
    appearance: Segment.l.accent.appearance,
    layoutOrientation: .vertical,
    selectedItemId: selectedId
)
```
