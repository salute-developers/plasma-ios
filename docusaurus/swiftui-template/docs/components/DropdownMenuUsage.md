---
title: DropdownMenu
---

Компонент для отображения выпадающего меню с кастомным дизайном и поведением.

## Описание

`SDDSDropdownMenu` представляет собой контейнер для отображения выпадающего контента с настраиваемым внешним видом. Компонент использует SwiftUI `popover` под капотом для обеспечения стандартного поведения позиционирования и анимации.

## Основные возможности

- Кастомный дизайн с настраиваемыми цветами, тенями и размерами
- Поддержка темной и светлой темы
- Интеграция с системой появления (appearance) SDDS
- Автоматическое позиционирование относительно триггера
- Настраиваемые отступы и форма

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `content` | Content | Контент для отображения внутри выпадающего меню |
| `appearance` | `DropdownMenuAppearance?` | Настройки внешнего вида (опционально) |

## Использование

### Базовое использование
```swift
// @sample: SDDSComponentsFixtures/Samples/DropdownMenu/SDDSDropdownMenu_Simple.swift
```

### С кастомным внешним видом
```swift
SDDSDropdownMenu(
    appearance: DropdownMenuAppearance(
        backgroundColor: .init(light: .white, dark: .black),
        shadow: .default,
        size: .init(width: 200, offset: 8)
    )
) {
    VStack {
        Text("Пункт 1")
        Text("Пункт 2")
    }
}
```

## Модификатор dropdownMenu

Для удобства использования предоставляется модификатор `dropdownMenu`, который можно применять к любому SwiftUI View.

### Параметры модификатора

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `isPresented` | `Binding<Bool>` | Состояние видимости выпадающего меню |
| `appearance` | DropdownMenuAppearance | Настройки внешнего вида |
| `placement` | PopoverPlacement | Позиция относительно триггера (по умолчанию: .top) |
| `alignment` | PopoverAlignment | Выравнивание относительно триггера (по умолчанию: .start) |
| `duration` | `TimeInterval?` | Автоматическое скрытие через указанное время (опционально) |
| `onClose` | (() -> Void)? | Callback при закрытии меню (опционально) |
| `content` | @ViewBuilder | Контент для отображения |

### Пример использования модификатора

```swift
Button("Показать меню") {
    isMenuPresented = true
}
.dropdownMenu(
    isPresented: $isMenuPresented,
    appearance: .default,
    placement: .bottom,
    alignment: .center,
    duration: 3.0,
    onClose: {
        print("Меню закрыто")
    }
) {
    VStack(spacing: 8) {
        Text("Пункт меню 1")
        Text("Пункт меню 2")
        Text("Пункт меню 3")
    }
    .padding()
}
```

## Интеграция с SDDSList

`SDDSDropdownMenu` часто используется в сочетании с `SDDSList` для отображения списков элементов:

```swift
.dropdownMenu(
    isPresented: $isDropdownMenuPresented,
    appearance: viewModel.appearance,
    placement: viewModel.placement,
    alignment: viewModel.alignment
) {
    SDDSList(
        items: listItems,
        contentHeight: $contentHeight,
        appearance: viewModel.appearance.listAppearance
    )
}
```

## Настройка внешнего вида

Внешний вид выпадающего меню настраивается через `DropdownMenuAppearance`:

- **backgroundColor**: Цвет фона (поддерживает темную/светлую тему)
- **shadow**: Настройки тени
- **size**: Размеры и отступы
- **dividerAppearance**: Настройки разделителей (если используются)

## Поведение

- Меню автоматически позиционируется относительно триггера
- Поддерживает автоматическое скрытие по таймеру
- Интегрируется с системой тем SDDS
- Адаптируется к изменениям цветовой схемы 
