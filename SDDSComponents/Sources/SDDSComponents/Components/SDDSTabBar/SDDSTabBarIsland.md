# SDDSTabBarIsland

`SDDSTabBarIsland` представляет собой плавающую панель навигации с табами, которая отображается поверх основного контента.

## Описание

Компонент создает компактную плавающую панель с табами, которая не занимает всю ширину экрана и имеет тень для выделения на фоне. Идеально подходит для случаев, когда нужно сэкономить место на экране или создать более современный дизайн.

## Параметры

- `items`: Массив элементов табов (TabBarItemData)
- `selectedIndex`: Binding к текущему выбранному индексу таба
- `appearance`: Параметры внешнего вида таб-бара (опционально)
- `onTabSelected`: Callback при выборе таба (опционально)

## Окружение

- `tabBarIslandAppearance`: Стандартные настройки внешнего вида таб-бара острова
- `colorScheme`: Цветовая схема (light/dark)

## Особенности

- Плавающий дизайн с тенью для выделения на фоне
- Компактный размер для экономии места на экране
- Поддерживает настраиваемые размеры и отступы для элементов
- Адаптивный дизайн с учетом скругленных углов
- Поддержка кастомных иконок и текста для каждого таба
- Автоматическое центрирование на экране

## Примеры использования

### Базовый таб-бар остров

```swift
SDDSTabBarIsland(
    items: tabBarItems,
    selectedIndex: $selectedIndex,
    appearance: TabBarIsland.m.default.appearance
)
```

### Таб-бар остров с кастомным callback

```swift
SDDSTabBarIsland(
    items: tabBarItems,
    selectedIndex: $selectedIndex,
    appearance: TabBarIsland.l.accent.appearance,
    onTabSelected: { index in
        print("Выбран таб: \(index)")
        // Дополнительная логика при выборе таба
    }
)
```

### Использование с модификатором tabBarIsland

```swift
struct ContentView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            // Основной контент
            Text("Содержимое")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .tabBarIsland(
            items: viewModel.tabBarItems,
            selectedIndex: $selectedIndex,
            appearance: viewModel.appearance
        )
    }
}
```

## Интеграция с SDDSDemoApp

В `SDDSDemoApp` компонент демонстрируется в `TabBarIslandView`:

```swift
struct TabBarIslandView: View {
    @ObservedObject private var viewModel: TabBarIslandViewModel
    
    var body: some View {
        List {
            Section {
                tabBarTypeSelectionView
                VariationsView(viewModel: viewModel)
            }
        }
        .tabBarIsland(
            items: viewModel.tabBarItems,
            selectedIndex: $viewModel.selectedIndex,
            appearance: viewModel.appearance
        )
        .navigationTitle("TabBar Island")
    }
}
```

## Стили и темы

Компонент поддерживает различные стили через `TabBarIslandAppearance`:

- Размеры и отступы
- Цвета фона и элементов
- Скругления углов
- Тени и эффекты
- Типографика для текста

## Доступность

- Поддержка VoiceOver с описанием навигации
- Адаптивные размеры для различных устройств
- Контрастные цвета для лучшей читаемости
- Поддержка Dynamic Type для масштабирования текста

## Отличия от SDDSTabBar

| SDDSTabBar | SDDSTabBarIsland |
|------------|------------------|
| Занимает всю ширину экрана | Компактный размер |
| Прикреплен к низу экрана | Плавающий дизайн |
| Заполняет safe area | Не влияет на safe area |
| Стандартный дизайн | Современный дизайн с тенью |

## Рекомендации по использованию

- Используйте для компактных интерфейсов
- Подходит для модернизации существующих приложений
- Идеален для случаев, когда нужно сэкономить место
- Рекомендуется для приложений с минималистичным дизайном
