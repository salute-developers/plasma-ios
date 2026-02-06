---
title: Accordion
---

Компонент для отображения списка сворачиваемых элементов с заголовками и контентом.

Компонент автоматически создает `SDDSAccordionItem` для каждого элемента в массиве `AccordionData`.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `items` | `[AccordionData]` | Массив данных элементов аккордеона |
| `showDividers` | `Bool` | Флаг отображения разделителей между элементами |
| `appearance` | `AccordionAppearance?` | Параметры внешнего вида аккордеона (опционально) |

## Окружение
- `accordionAppearance`: Стандартные настройки внешнего вида аккордеона

## Особенности
- Автоматически создает `SDDSAccordionItem` для каждого элемента
- Использует настраиваемые отступы между элементами из appearance
- Поддерживает кастомные appearance для отдельных элементов
- Применяет стандартные настройки из environment для элементов без кастомного appearance
- Поддерживает отображение разделителей между элементами

## Примеры использования

### Базовый аккордеон

```swift
// @sample: SDDSComponentsFixtures/Samples/Accordion/SDDSAccordion_Simple.swift
```

### Аккордеон с разделителями

```swift
SDDSAccordion(
    items: [
        AccordionData(
            title: "Первый элемент",
            content: "Содержимое первого элемента"
        ),
        AccordionData(
            title: "Второй элемент",
            content: "Содержимое второго элемента"
        )
    ],
    showDividers: true
)
```

### Аккордеон с кастомным appearance

```swift
SDDSAccordion(
    items: [
        AccordionData(
            title: "Элемент с кастомным стилем",
            content: "Содержимое элемента",
            appearance: AccordionItemSolidActionEnd.m.appearance
        )
    ],
    appearance: AccordionClearActionStart.m.appearance
)
```

### Аккордеон с обработчиками

```swift
SDDSAccordion(
    items: [
        AccordionData(
            title: "Интерактивный элемент",
            content: "Содержимое",
            onToggle: { isExpanded in
                print("Элемент \(isExpanded ? "развернут" : "свернут")")
            }
        )
    ]
)
```

### Аккордеон с управляемыми состояниями

```swift
@State private var items = [
    AccordionData(
        title: "Управляемый элемент",
        content: "Содержимое",
        isExpanded: false
    )
]

SDDSAccordion(items: items)
```

## Структура данных

### AccordionData

Структура данных для элемента аккордеона:

```swift
public struct AccordionData: Identifiable {
    public let id = UUID()
    public let title: String
    public let content: String
    public var isExpanded: Bool
    public let appearance: AccordionItemAppearance?
    public let onToggle: ((Bool) -> ())?
}
```

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `title` | `String` | Заголовок элемента аккордеона |
| `content` | String | Контент элемента аккордеона |
| `isExpanded` | Bool | Состояние развернутости элемента |
| `appearance` | `AccordionItemAppearance?` | Параметры внешнего вида элемента (опционально) |
| `onToggle` | ((Bool) -> ())? | Обработчик переключения состояния (опционально) |

## Структура внешнего вида

`AccordionAppearance` содержит следующие параметры:

- `accordionItemAppearance`: Настройки внешнего вида элементов аккордеона
- `dividerAppearance`: Настройки внешнего вида разделителей
- `size`: Конфигурация размеров

## Размеры

`AccordionSizeConfiguration` определяет размеры аккордеона:

- `itemSpacing`: Отступ между элементами аккордеона

## Взаимодействие

- Каждый элемент аккордеона может быть развернут/свернут независимо
- Поддерживается анимация появления/исчезновения контента
- Disclosure иконки анимируются при переключении состояния
- Поддерживаются hover состояния (только на macOS) 
