---
title: TabItem
---

Компонент для отображения отдельного элемента вкладки с поддержкой текста, иконок, счетчика и дополнительного контента.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `label` | `String` | Основной текст вкладки |
| `value` | `String?` | Дополнительный текст вкладки (опционально) |
| `counterValue` | `Int?` | Значение счетчика (опционально) |
| `isSelected` | `Bool` | Флаг выбранного состояния |
| `isDisabled` | `Bool` | Флаг отключенного состояния |
| `orientation` | `TabItemOrientation` | Ориентация элемента (.horizontal/.vertical) |
| `appearance` | `TabItemAppearance?` | Кастомизация внешнего вида (опционально) |
| `startContent` | `() -> Content` | ViewBuilder для контента слева/сверху |
| `actionContent` | `() -> Action` | ViewBuilder для контента действия справа/снизу |
| `onTap` | `() -> Void` | Действие при нажатии |

## Окружение
- `tabItemAppearance`: Стандартные настройки внешнего вида элементов вкладок

## Ориентация элемента (TabItemOrientation)

`TabItemOrientation` определяет ориентацию элемента вкладки:

- `horizontal`: Горизонтальное расположение контента
- `vertical`: Вертикальное расположение контента

## Типы TabItem

### TabItemDefault
Стандартный элемент вкладки с текстом, значением и опциональным контентом.

**Размеры:** `l`, `m`, `s`, `xs`

### TabItemHeader
Элемент вкладки для заголовков с увеличенным размером текста.

**Размеры:** `h1`, `h2`, `h3`, `h4`, `h5`

### IconTabItem
Элемент вкладки в виде иконки с опциональным счетчиком.

**Размеры:** `l`, `m`, `xs`

## Примеры использования

### Стандартный TabItem

```swift
// @sample: SDDSComponentsFixtures/Samples/TabItem/SDDSTabItem_Simple.swift
```

### TabItem с иконкой слева

```swift
SDDSTabItem(
    label: "Label",
    value: nil,
    counterValue: nil,
    isSelected: true,
    isDisabled: false,
    orientation: .horizontal,
    appearance: TabItemDefault.l.appearance,
    startContent: {
        Image(systemName: "star.fill")
    },
    onTap: { print("Tab tapped") }
)
```

### TabItem заголовок

```swift
SDDSTabItem(
    label: "Main Title",
    value: nil,
    counterValue: nil,
    isSelected: false,
    isDisabled: false,
    orientation: .horizontal,
    appearance: TabItemHeader.h3.appearance,
    onTap: { print("Header tab tapped") }
)
```

### IconTabItem со счетчиком

```swift
SDDSTabItem(
    label: "",
    value: nil,
    counterValue: 5,
    isSelected: false,
    isDisabled: false,
    orientation: .horizontal,
    appearance: IconTabItem.l.appearance,
    startContent: {
        Image(systemName: "house.fill")
    },
    onTap: { print("Icon tab tapped") }
)
```

### Вертикальный TabItem

```swift
SDDSTabItem(
    label: "Settings",
    value: "Configure",
    counterValue: nil,
    isSelected: false,
    isDisabled: false,
    orientation: .vertical,
    appearance: TabItemDefault.m.appearance,
    startContent: {
        Image(systemName: "gearshape.fill")
    },
    onTap: { print("Settings tapped") }
)
```

### TabItem с действием

```swift
SDDSTabItem(
    label: "Messages",
    value: nil,
    counterValue: 3,
    isSelected: true,
    isDisabled: false,
    orientation: .horizontal,
    appearance: TabItemDefault.l.appearance,
    actionContent: {
        Image(systemName: "chevron.down")
    },
    onTap: { print("Messages tapped") }
)
```

