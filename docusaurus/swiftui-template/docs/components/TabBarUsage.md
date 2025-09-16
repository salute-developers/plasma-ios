---
title: TabBar
sidebar_label: TabBar
---

`SDDSTabBar` — компонент для отображения панели навигации с табами внизу экрана.

## Примеры использования

### Базовое использование

```swift
SDDSTabBar(
    items: tabBarItems,
    selectedIndex: $selectedIndex
)
```

### Таб-бар с кастомным внешним видом

```swift
SDDSTabBar(
    items: tabBarItems,
    selectedIndex: $selectedIndex,
    appearance: TabBar.m.default.appearance
)
```

### Таб-бар с обработчиком событий

```swift
SDDSTabBar(
    items: tabBarItems,
    selectedIndex: $selectedIndex,
    appearance: TabBar.l.accent.appearance,
    onTabSelected: { index in
        print("Выбран таб: \(index)")
    }
)
```

### Создание элементов таб-бара

```swift
let tabBarItems: [TabBarItemData] = [
    TabBarItemData(
        content: AnyView(Asset.homeOutline24.image),
        selectedContent: AnyView(Asset.homeFill24.image),
        text: "Главная",
        appearance: tabBarItemAppearance,
        extra: nil,
        onTap: { selectedIndex = 0 }
    ),
    TabBarItemData(
        content: AnyView(Asset.searchOutline24.image),
        selectedContent: AnyView(Asset.searchFill24.image),
        text: "Поиск",
        appearance: tabBarItemAppearance,
        extra: AnyView(SDDSCounter(text: "5")),
        onTap: { selectedIndex = 1 }
    )
]
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `items` | `[TabBarItemData]` | Массив элементов табов |
| `selectedIndex` | `Binding<Int>` | Индекс выбранной вкладки |
| `appearance` | `TabBarAppearance?` | Параметры внешнего вида таб-бара |
| `onTabSelected` | `((Int) -> Void)?` | Callback при выборе таба |

## TabBarItemData

| Параметр | Тип | Описание |
|----------|-----|----------|
| `content` | `AnyView` | Контент вкладки (обычно иконка) |
| `selectedContent` | `AnyView` | Контент выбранной вкладки |
| `text` | `String` | Текст вкладки |
| `appearance` | `TabBarItemAppearance` | Внешний вид элемента |
| `extra` | `AnyView?` | Дополнительный контент (бейдж, счетчик) |
| `onTap` | `(() -> Void)?` | Обработчик нажатия |

## Стилизация

Компонент использует токены из темы:

- `ColorToken.backgroundDefaultPrimary` — фон таб-бара
- `ColorToken.textDefaultPrimary` — цвет текста
- `ColorToken.accentPrimary` — цвет активной вкладки
- `TypographyToken.bodyM` — типографика текста
- `SpacingToken.tabBarPadding` — отступы таб-бара

## Примеры в интерфейсе

### Полноэкранный таб-бар

```swift
VStack(spacing: 0) {
    // Основной контент
    TabView(selection: $selectedTab) {
        HomeView()
            .tag(0)
        
        SearchView()
            .tag(1)
        
        ProfileView()
            .tag(2)
    }
    
    // Таб-бар
    TabBar(
        selectedTab: $selectedTab,
        tabs: [
            TabBarItem(title: "Главная", icon: Asset.homeFill24.image),
            TabBarItem(title: "Поиск", icon: Asset.searchFill24.image),
            TabBarItem(title: "Профиль", icon: Asset.personFill24.image)
        ]
    )
}
```

### Таб-бар с кастомным внешним видом

```swift
TabBar(
    selectedTab: $selectedTab,
    tabs: tabs,
    appearance: TabBarAppearance(
        backgroundColor: {{ docs-theme-codeReference }}.ColorToken.backgroundDefaultSecondary.color,
        selectedColor: {{ docs-theme-codeReference }}.ColorToken.accentPrimary.color,
        unselectedColor: {{ docs-theme-codeReference }}.ColorToken.textDefaultSecondary.color
    )
)
```

### Таб-бар с обработчиком событий

```swift
TabBar(
    selectedTab: $selectedTab,
    tabs: tabs,
    onTabSelected: { index in
        // Дополнительная логика при выборе вкладки
        print("Выбрана вкладка: \(index)")
    }
)
```
