---
title: Tooltip
---

Компонент для отображения всплывающих подсказок (tooltip) с возможностью настройки внешнего вида, положения и содержимого.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `isPresented` | `Binding<Bool>` | Состояние отображения tooltip |
| `appearance` | `TooltipAppearance | Параметры внешнего вида tooltip |
| `width` | `CGFloat?` | Ширина tooltip (nil - автоматическая) |
| `text` | `String` | Текст tooltip |
| `placement` | `PopoverPlacement` | Положение tooltip относительно якоря |
| `alignment` | `PopoverAlignment` | Выравнивание tooltip относительно якоря |
| `tailEnabled` | `Bool `| Показывать ли хвост tooltip |
| `triggerCentered` | `Bool` | Центрировать ли tooltip относительно якоря |
| `placementMode` | `PopoverPlacementMode` | Режим размещения tooltip |
| `duration` | `TimeInterval?` | Время отображения tooltip (nil - не исчезает автоматически) |
| `onClose` | `(() -> Void)?` | Обработчик закрытия tooltip |
| `contentStart` | `() -> View` | Начальный контент (иконка, кнопка и т.д.) |

## Окружение

- `tooltipAppearance`: Стандартные настройки внешнего вида tooltip

## Параметры внешнего вида (TooltipAppearance)

`TooltipAppearance` определяет параметры внешнего вида tooltip:

- `backgroundColor`: Цвет фона tooltip
- `textColor`: Цвет текста
- `contentStartColor`: Цвет начального контента
- `shadow`: Тень tooltip
- `textTypography`: Типографика текста
- `size`: Конфигурация размеров tooltip

## Конфигурация размеров (TooltipSizeConfiguration)

`TooltipSizeConfiguration` определяет размеры и отступы tooltip:

- `offset`: Смещение tooltip
- `pathDrawer`: Форма tooltip
- `tailHeight`: Высота хвоста
- `tailWidth`: Ширина хвоста
- `tailPadding`: Отступ хвоста
- `contentStartPadding`: Отступ после начального контента
- `contentStartSize`: Размер начального контента
- `paddingStart`: Отступ слева
- `paddingEnd`: Отступ справа
- `paddingTop`: Отступ сверху
- `paddingBottom`: Отступ снизу

## Положение tooltip (PopoverPlacement)

`PopoverPlacement` определяет возможные положения tooltip относительно якоря:

- `top`, `bottom`, `left`, `right`, `auto`

## Примеры использования

### Базовый tooltip
```swift
// @sample: SDDSComponentsFixtures/Samples/Tooltip/SDDSTooltip_Simple.swift
```

### Tooltip с кастомным внешним видом
```swift
Text("Показать tooltip")
    .tooltip(
        isPresented: $isTooltipPresented,
        appearance: TooltipAppearance(
            backgroundColor: .surfaceDefaultSolidCard,
            textColor: .textDefaultPrimary,
            contentStartColor: .iconDefault,
            shadow: .downSoftL,
            textTypography: .default,
            size: DefaultTooltipSize()
        ),
        width: 200,
        text: "Кастомная подсказка с фиксированной шириной",
        placement: .bottom,
        alignment: .center,
        tailEnabled: true,
        triggerCentered: true,
        placementMode: .strict,
        duration: 5.0,
        onClose: {
            print("Tooltip закрыт")
        }
    ) {
        Image(systemName: "questionmark.circle.fill")
    }
```

### Tooltip без хвоста
```swift
Text("Показать tooltip")
    .tooltip(
        isPresented: $isTooltipPresented,
        appearance: Tooltip.default.appearance,
        width: nil,
        text: "Подсказка без хвоста",
        placement: .right,
        tailEnabled: false
    ) {
        Image(systemName: "exclamationmark.triangle")
    }
``` 
