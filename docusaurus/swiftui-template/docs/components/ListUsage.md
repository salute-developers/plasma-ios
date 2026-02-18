---
title: List
---

Компонент для отображения списка элементов, который ведет себя как стандартный SwiftUI List, но отображает SDDSListItem компоненты.

Компонент использует SwiftUI List под капотом для обеспечения стандартного поведения (скролл, управление памятью), но с кастомными настройками отображения.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `items` | `[SDDSListItem]` | Массив SDDSListItem элементов для отображения |
| `appearance` | `ListAppearance?` | Параметры внешнего вида списка (опционально) |
| `content` | `ViewBuilder` | Замыкание для создания массива SDDSListItem'ов |

## Окружение
- `listAppearance`: Стандартные настройки внешнего вида списка

## Особенности
- Использует стандартный SwiftUI List для обеспечения нативного поведения
- Автоматически применяет настройки внешнего вида к каждому элементу списка
- Поддерживает скролл и эффективное управление памятью для больших списков
- Убирает стандартные отступы и разделители строк

## Примеры использования

### Базовый список с SDDSListItem'ами

```swift
// @sample: SDDSComponentsFixtures/Samples/List/SDDSList_Simple.swift
```

### Список через ViewBuilder

```swift
SDDSList(appearance: ListNormal.m.appearance) {
    SDDSListItem(title: "Первый элемент")
    SDDSListItem(title: "Второй элемент")
    SDDSListItem(title: "Третий элемент")
}
```

### Список с кастомным rightContent

```swift
SDDSList(
    items: [
        SDDSListItem(
            title: "Элемент с иконкой",
            rightContent: { Image(systemName: "chevron.right") }
        ),
        SDDSListItem(
            title: "Элемент с кнопкой",
            rightContent: { Button("Действие") {} }
        )
    ],
    appearance: ListNormal.m.appearance
)
```

### Список с интерактивными элементами

```swift
SDDSList(
    items: [
        SDDSListItem(
            title: "Нажми меня",
            rightContent: { Image(systemName: "plus.circle") },
            onTap: { print("Элемент нажат") }
        ),
        SDDSListItem(
            title: "Отключенный элемент",
            disabled: true
        )
    ],
    appearance: ListNormal.m.appearance
)
```

### Список с кастомным внешним видом

```swift
var customAppearance = ListAppearance()
customAppearance.listItemAppearance = ListItemNormal.l.appearance

SDDSList(
    items: [
        SDDSListItem(title: "Элемент 1"),
        SDDSListItem(title: "Элемент 2"),
        SDDSListItem(title: "Элемент 3")
    ],
    appearance: customAppearance
)
```

## Структура внешнего вида

`ListAppearance` содержит следующие параметры:

- `listItemAppearance`: Настройки внешнего вида элементов списка
- `size`: Конфигурация размеров

## Размеры

`ListSizeConfiguration` определяет размеры списка. В текущей конфигурации список не имеет специфичных размерных свойств, но протокол готов для будущих расширений.

## Взаимодействие с ListItem

Список использует стили элементов списка, указанные в `listItemAppearance`. Это позволяет:

- Применять единообразные стили ко всем элементам списка
- Легко изменять внешний вид всех элементов через один параметр
- Поддерживать различные варианты списков (normal, tight) с разными стилями элементов

## Технические детали

- Использует стандартный `List` под капотом
- Применяет `PlainListStyle()` для чистого внешнего вида
- Убирает стандартные отступы списка через `listRowInsets(EdgeInsets())`
- Скрывает разделители строк через `listRowSeparator(.hidden)`
- Поддерживает как передачу массива SDDSListItem'ов, так и создание через ViewBuilder
- Автоматически применяет `listItemAppearance` к каждому элементу через environment 
