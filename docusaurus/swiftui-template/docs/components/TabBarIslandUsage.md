---
title: TabBarIsland
sidebar_label: TabBarIsland
---

`SDDSTabBarIsland` — компонент для отображения плавающей панели навигации с табами.

## Примеры использования

### Базовое использование

```swift
SDDSTabBarIsland(
    items: tabBarItems,
    selectedIndex: $selectedIndex
)
```

### Островок с кастомным внешним видом

```swift
SDDSTabBarIsland(
    items: tabBarItems,
    selectedIndex: $selectedIndex,
    appearance: TabBarIsland.m.default.appearance
)
```

### Островок с обработчиком событий

```swift
SDDSTabBarIsland(
    items: tabBarItems,
    selectedIndex: $selectedIndex,
    appearance: TabBarIsland.l.accent.appearance,
    onTabSelected: { index in
        print("Выбран таб: \(index)")
    }
)
```

### Создание элементов островка

```swift
let tabBarItems: [TabBarItemData] = [
    TabBarItemData(
        content: AnyView(Asset.starOutline36.image),
        selectedContent: AnyView(Asset.starFill36.image),
        text: "Избранное",
        appearance: tabBarItemAppearance,
        extra: nil,
        onTap: { selectedIndex = 0 }
    ),
    TabBarItemData(
        content: AnyView(Asset.notificationOutline36.image),
        selectedContent: AnyView(Asset.notificationFill36.image),
        text: "Уведомления",
        appearance: tabBarItemAppearance,
        extra: AnyView(SDDSIndicator()),
        onTap: { selectedIndex = 1 }
    )
]
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `items` | `[TabBarItemData]` | Массив элементов табов |
| `selectedIndex` | `Binding<Int>` | Индекс выбранной вкладки |
| `appearance` | `TabBarIslandAppearance?` | Параметры внешнего вида островка |
| `onTabSelected` | `((Int) -> Void)?` | Callback при выборе таба |

## TabBarIslandAppearance

| Параметр | Тип | Описание |
|----------|-----|----------|
| `backgroundColor` | `ColorToken` | Цвет фона островка |
| `shadow` | `ShadowToken` | Тень островка |
| `tabBarItemAppearance` | `TabBarItemAppearance` | Стиль элементов таб-бара |
| `size` | `TabBarIslandSizeConfiguration` | Конфигурация размеров и отступов |

## Стилизация

Компонент использует токены из темы:

- `ColorToken.backgroundDefaultPrimary` — фон островка
- `ColorToken.textDefaultPrimary` — цвет текста
- `ColorToken.accentPrimary` — цвет активной вкладки
- `ColorToken.shadowPrimary` — цвет тени
- `TypographyToken.bodyM` — типографика текста
- `SpacingToken.tabBarIslandPadding` — отступы островка

## Примеры в интерфейсе

### Плавающий островок внизу экрана

```swift
ZStack {
    // Основной контент
    TabView(selection: $selectedTab) {
        HomeView()
            .tag(0)
        
        SearchView()
            .tag(1)
        
        ProfileView()
            .tag(2)
    }
    
    VStack {
        Spacer()
        
        // Плавающий островок
        TabBarIsland(
            selectedTab: $selectedTab,
            tabs: [
                TabBarItem(title: "Главная", icon: Asset.homeFill24.image),
                TabBarItem(title: "Поиск", icon: Asset.searchFill24.image),
                TabBarItem(title: "Профиль", icon: Asset.personFill24.image)
            ]
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 34) // Отступ для безопасной зоны
    }
}
```

### Островок с анимацией появления

```swift
TabBarIsland(
    selectedTab: $selectedTab,
    tabs: tabs,
    isVisible: showTabBar
)
.animation(.easeInOut(duration: 0.3), value: showTabBar)
```

### Островок с кастомными отступами

```swift
TabBarIsland(
    selectedTab: $selectedTab,
    tabs: tabs,
    appearance: TabBarIslandAppearance(
        padding: 12,
        cornerRadius: 20
    )
)
.padding(.horizontal, 20)
.padding(.bottom, 20)
```

### Островок с обработчиком событий

```swift
TabBarIsland(
    selectedTab: $selectedTab,
    tabs: tabs,
    onTabSelected: { index in
        // Дополнительная логика при выборе вкладки
        withAnimation {
            selectedTab = index
        }
        
        // Аналитика или другие действия
        analytics.track("tab_selected", properties: ["tab_index": index])
    }
)
```
