---
title: Popover
---

Компонент для отображения всплывающих подсказок (popover) с возможностью настройки внешнего вида, положения и хвоста.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `isPresented` | `Binding<Bool>` | Состояние отображения popover |
| `appearance` | `PopoverAppearance` | Параметры внешнего вида popover |
| `placement` | `PopoverPlacement` | Положение popover относительно якоря |
| `alignment` | `PopoverAlignment` | Выравнивание popover относительно якоря |
| `tailEnabled` | `Bool` | Показывать ли хвост popover |
| `triggerCentered` | `Bool` | Центрировать ли popover относительно якоря |
| `placementMode` | `PopoverPlacementMode` | Режим размещения popover |
| `duration` | `TimeInterval?` | Время отображения popover (nil - не исчезает автоматически) |
| `onClose` | `(() -> Void)?` | Обработчик закрытия popover |
| `content` | `() -> Content` | Контент popover |

## Окружение

- `popoverAppearance`: Стандартные настройки внешнего вида popover

## Параметры внешнего вида (PopoverAppearance)

`PopoverAppearance` определяет параметры внешнего вида popover:

- `backgroundColor`: Цвет фона popover
- `shadow`: Тень popover
- `size`: Конфигурация размеров popover

## Конфигурация размеров (PopoverSizeConfiguration)

`PopoverSizeConfiguration` определяет размеры и отступы popover:

- `paddingStart`: Отступ слева
- `paddingEnd`: Отступ справа
- `paddingTop`: Отступ сверху
- `paddingBottom`: Отступ снизу
- `cornerRadius`: Радиус скругления углов

## Положение popover (PopoverPlacement)

`PopoverPlacement` определяет возможные положения popover относительно якоря:

- `top`, `bottom`, `left`, `right`, `auto`

## Примеры использования

### Базовый popover
```swift
// @sample: SDDSComponentsFixtures/Samples/Popover/SDDSPopover_Simple.swift
```

### Popover с кастомным внешним видом
```swift
Text("Показать popover")
    .popover(
        isPresented: $isPopoverPresented,
        appearance: PopoverAppearance(
            backgroundColor: .surfaceDefaultSolidCard,
            shadow: .downSoftL,
            size: PopoverSize.default
        ),
        placement: .top,
        alignment: .center,
        tailEnabled: true,
        triggerCentered: true,
        placementMode: .strict,
        duration: 5.0,
        onClose: {
            print("Popover закрыт")
        }
    ) {
        VStack {
            Text("Заголовок")
            Text("Описание")
        }
    }
```

### Popover без хвоста
```swift
Text("Показать popover")
    .popover(
        isPresented: $isPopoverPresented,
        appearance: Popover.default.appearance,
        placement: .bottom,
        tailEnabled: false
    ) {
        Text("Контент popover без хвоста")
    }
``` 
