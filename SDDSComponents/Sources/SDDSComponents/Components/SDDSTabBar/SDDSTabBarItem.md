# SDDSTabBarItem

`SDDSTabBarItem` представляет собой отдельный элемент таба в `SDDSTabBar` или `SDDSTabBarIsland`.

## Описание

Компонент отображает иконку, текст и опциональные дополнительные элементы (badge, counter, indicator) в виде таба. Поддерживает состояния выбора и наведения.

## Параметры

- `content`: Основное содержимое таба в невыбранном состоянии (обычно иконка)
- `selectedContent`: Содержимое таба в выбранном состоянии (обычно иконка с другим цветом или стилем)
- `text`: Текстовая метка таба
- `appearance`: Параметры внешнего вида элемента таба
- `extra`: Дополнительные элементы (badge, counter, indicator)
- `onTap`: Callback при нажатии на таб

## Окружение

- `tabBarItemAppearance`: Стандартные настройки внешнего вида элемента таба
- `colorScheme`: Цветовая схема (light/dark)

## Особенности

- Автоматическое позиционирование дополнительных элементов в правом верхнем углу
- Поддержка различных состояний (selected, disabled)
- Различное содержимое для выбранного и невыбранного состояния
- Адаптивные размеры и отступы
- Поддержка кастомных иконок и текста
- Интеграция с системой тем SDDS

## Примеры использования

### Базовый элемент таба

```swift
SDDSTabBarItem(
    content: AnyView(Image(systemName: "house")),
    selectedContent: AnyView(Image(systemName: "house.fill")),
    text: "Главная",
    appearance: TabBarItem.m.default.appearance,
    onTap: { print("Нажат таб Главная") }
)
```

### Таб с дополнительными элементами

```swift
SDDSTabBarItem(
    content: AnyView(Image(systemName: "bell")),
    selectedContent: AnyView(Image(systemName: "bell.fill")),
    text: "Уведомления",
    appearance: TabBarItem.l.accent.appearance,
    extra: AnyView(
        Text("3")
            .font(.caption)
            .foregroundColor(.white)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Color.red)
            .clipShape(Capsule())
    ),
    onTap: { print("Нажат таб Уведомления") }
)
```

### Таб с кастомным содержимым

```swift
SDDSTabBarItem(
    content: AnyView(
        VStack(spacing: 4) {
            Image(systemName: "person.circle")
                .font(.title2)
            Text("Профиль")
                .font(.caption)
        }
    ),
    selectedContent: AnyView(
        VStack(spacing: 4) {
            Image(systemName: "person.circle.fill")
                .font(.title2)
            Text("Профиль")
                .font(.caption)
        }
    ),
    text: "",
    appearance: TabBarItem.m.default.appearance,
    onTap: { print("Нажат таб Профиль") }
)
```

## Интеграция с SDDSTabBar

```swift
struct ContentView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            // Основной контент
            Text("Содержимое")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .tabBar(
            items: [
                            TabBarItemData(
                content: AnyView(Image(systemName: "house")),
                selectedContent: AnyView(Image(systemName: "house.fill")),
                text: "Главная",
                appearance: TabBarItem.m.default.appearance,
                extra: nil,
                onTap: { selectedIndex = 0 }
            ),
            TabBarItemData(
                content: AnyView(Image(systemName: "star")),
                selectedContent: AnyView(Image(systemName: "star.fill")),
                text: "Избранное",
                appearance: TabBarItem.m.default.appearance,
                extra: nil,
                onTap: { selectedIndex = 1 }
            )
            ],
            selectedIndex: $selectedIndex,
            appearance: TabBar.m.default.appearance
        )
    }
}
```

## Стили и темы

Компонент поддерживает различные стили через `TabBarItemAppearance`:

- Размеры и отступы
- Цвета для различных состояний
- Типографика для текста
- Настройки дополнительных элементов

## Доступность

- Поддержка VoiceOver с описанием содержимого
- Адаптивные размеры для различных устройств
- Контрастные цвета для лучшей читаемости
