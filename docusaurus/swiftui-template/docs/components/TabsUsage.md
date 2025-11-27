---
title: Tabs
---

Контейнер вкладок с поддержкой различных режимов отображения, ориентаций и автоматической обработки переполнения.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `items` | `[TabsItemData]` | Массив элементов вкладок |
| `selectedId` | `String?` | ID выбранного элемента |
| `clipMode` | `TabsClipMode` | Режим отображения при переполнении |
| `tabItemType` | `TabItemType` | Тип используемых TabItem (.default/.header/.icon) |
| `stretch` | `Bool` | Флаг растягивания элементов (по умолчанию true) |
| `appearance` | `TabsAppearance?` | Кастомизация внешнего вида (опционально) |
| `onSelect` | `(String) -> Void` | Callback при выборе элемента |

## Окружение
- `tabsAppearance`: Стандартные настройки внешнего вида контейнера вкладок

## Режимы отображения (TabsClipMode)

`TabsClipMode` определяет поведение при переполнении контейнера:

- `none`: Обычный режим со скроллом при необходимости
- `showMore(showAllText: String, items: [TabsItemData], maxHeight: CGFloat)`: Добавляется кнопка "Show All" для открытия dropdown menu с дополнительными элементами
- `scroll`: Отображаются кнопки навигации (стрелки) для переключения на предыдущий/следующий элемент

## Типы TabItem (TabItemType)

- `default`: Стандартные элементы вкладок
- `header`: Элементы вкладок в стиле заголовков
- `icon`: Элементы вкладок в виде иконок

## Модель данных TabsItemData

```swift
TabsItemData(
    id: String,              // Уникальный идентификатор
    label: String,           // Текст вкладки
    value: String?,          // Дополнительный текст (опционально)
    counterValue: Int?,      // Значение счетчика (опционально)
    icon: Image?,            // Иконка (для icon типа)
    isDisabled: Bool         // Флаг отключения
)
```

## Типы Tabs

### TabsDefault
Стандартный контейнер вкладок с поддержкой горизонтальной и вертикальной ориентации.

**Размеры:** `l`, `m`, `s`, `xs`
**Вариации:** `horizontal`, `vertical`

### TabsHeader
Контейнер вкладок для заголовков с увеличенным размером текста.

**Размеры:** `h1`, `h2`, `h3`, `h4`, `h5`

### IconTabs
Контейнер вкладок для иконок.

**Размеры:** `l`, `m`, `s`, `xs`
**Вариации:** `horizontal`, `vertical`

## Особенности

- **Ориентация**: Поддерживает горизонтальную и вертикальную ориентации
- **Индикатор**: Анимированная полоска под выбранным элементом
- **Divider**: Опциональный разделитель (внизу для horizontal, слева для vertical)
- **Stretch режим**: При `stretch = true` элементы равномерно распределяются по контейнеру; при `false` элементы плотно прижаты друг к другу
- **Автоматический скролл**: ScrollView добавляется только когда контент не помещается в контейнер

## Примеры использования

### Базовые горизонтальные вкладки

```swift
@State private var selectedId: String = "tab1"

let items = [
    TabsItemData(id: "tab1", label: "Home", value: nil, counterValue: nil, icon: nil, isDisabled: false),
    TabsItemData(id: "tab2", label: "Profile", value: nil, counterValue: 3, icon: nil, isDisabled: false),
    TabsItemData(id: "tab3", label: "Settings", value: nil, counterValue: nil, icon: nil, isDisabled: false)
]

SDDSTabs(
    items: items,
    selectedId: selectedId,
    clipMode: .none,
    tabItemType: .default,
    stretch: true,
    appearance: TabsDefault.l.horizontal.appearance,
    onSelect: { id in
        selectedId = id
    }
)
```

### Вертикальные вкладки

```swift
SDDSTabs(
    items: items,
    selectedId: selectedId,
    clipMode: .none,
    tabItemType: .default,
    stretch: true,
    appearance: TabsDefault.m.vertical.appearance,
    onSelect: { id in
        selectedId = id
    }
)
```

### Вкладки с режимом Show More

```swift
let mainItems = [
    TabsItemData(id: "tab1", label: "Tab 1", value: nil, counterValue: nil, icon: nil, isDisabled: false),
    TabsItemData(id: "tab2", label: "Tab 2", value: nil, counterValue: nil, icon: nil, isDisabled: false),
    TabsItemData(id: "tab3", label: "Tab 3", value: nil, counterValue: nil, icon: nil, isDisabled: false)
]

let dropdownItems = [
    TabsItemData(id: "tab4", label: "Tab 4", value: nil, counterValue: nil, icon: nil, isDisabled: false),
    TabsItemData(id: "tab5", label: "Tab 5", value: nil, counterValue: nil, icon: nil, isDisabled: false)
]

SDDSTabs(
    items: mainItems,
    selectedId: selectedId,
    clipMode: .showMore(showAllText: "Show All", items: dropdownItems, maxHeight: 300),
    tabItemType: .default,
    stretch: true,
    appearance: TabsDefault.l.horizontal.appearance,
    onSelect: { id in
        selectedId = id
    }
)
```

### Вкладки с режимом Scroll

```swift
SDDSTabs(
    items: items,
    selectedId: selectedId,
    clipMode: .scroll,
    tabItemType: .default,
    stretch: false,
    appearance: TabsDefault.l.horizontal.appearance,
    onSelect: { id in
        selectedId = id
    }
)
```

### Вкладки-заголовки

```swift
let headerItems = [
    TabsItemData(id: "h1", label: "Overview", value: nil, counterValue: nil, icon: nil, isDisabled: false),
    TabsItemData(id: "h2", label: "Details", value: nil, counterValue: nil, icon: nil, isDisabled: false),
    TabsItemData(id: "h3", label: "History", value: nil, counterValue: nil, icon: nil, isDisabled: false)
]

SDDSTabs(
    items: headerItems,
    selectedId: selectedId,
    clipMode: .none,
    tabItemType: .header,
    stretch: true,
    appearance: TabsHeader.h3.appearance,
    onSelect: { id in
        selectedId = id
    }
)
```

### Иконочные вкладки

```swift
let iconItems = [
    TabsItemData(id: "i1", label: "", value: nil, counterValue: nil, icon: Image(systemName: "house.fill"), isDisabled: false),
    TabsItemData(id: "i2", label: "", value: nil, counterValue: 5, icon: Image(systemName: "bell.fill"), isDisabled: false),
    TabsItemData(id: "i3", label: "", value: nil, counterValue: nil, icon: Image(systemName: "person.fill"), isDisabled: false)
]

SDDSTabs(
    items: iconItems,
    selectedId: selectedId,
    clipMode: .none,
    tabItemType: .icon,
    stretch: true,
    appearance: IconTabs.l.horizontal.appearance,
    onSelect: { id in
        selectedId = id
    }
)
```

### Вкладки без растягивания

```swift
SDDSTabs(
    items: items,
    selectedId: selectedId,
    clipMode: .none,
    tabItemType: .default,
    stretch: false, // Элементы плотно прижаты друг к другу
    appearance: TabsDefault.l.horizontal.appearance,
    onSelect: { id in
        selectedId = id
    }
)
```

