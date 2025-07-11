# SDDSListItem

Компонент для отображения элемента списка с настраиваемым заголовком, правым контентом и интерактивностью.

Компонент поддерживает различные состояния (обычное, наведение, отключенное) и автоматически применяет соответствующие стили.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| title | String | Заголовок элемента списка |
| rightContent | ViewBuilder | Кастомный контент справа от заголовка (опционально) |
| disabled | Bool | Флаг отключения элемента |
| appearance | ListItemAppearance? | Параметры внешнего вида элемента списка (опционально) |
| onTap | (() -> ())? | Обработчик нажатия на элемент (опционально) |

## Окружение
- `listItemAppearance`: Стандартные настройки внешнего вида элемента списка

## Особенности
- Поддерживает hover состояния (только на macOS)
- Автоматически применяет opacity 0.4 для отключенных элементов
- Использует настраиваемые отступы и размеры из appearance
- Поддерживает кастомные формы через PathDrawer
- Применяет типографику в зависимости от размера

## Примеры использования

### Базовый элемент списка

```swift
SDDSListItem(
    title: "Простой элемент",
    appearance: ListItemNormal.m.appearance
)
```

### Элемент с иконкой справа

```swift
SDDSListItem(
    title: "Элемент с иконкой",
    rightContent: { Image(systemName: "chevron.right") },
    appearance: ListItemNormal.m.appearance
)
```

### Интерактивный элемент

```swift
SDDSListItem(
    title: "Нажми меня",
    rightContent: { Image(systemName: "plus.circle") },
    onTap: { print("Элемент нажат") },
    appearance: ListItemNormal.m.appearance
)
```

### Отключенный элемент

```swift
SDDSListItem(
    title: "Отключенный элемент",
    disabled: true,
    appearance: ListItemNormal.m.appearance
)
```

### Элемент с кастомным rightContent

```swift
SDDSListItem(
    title: "С кастомным контентом",
    rightContent: {
        HStack {
            Text("Доп. текст")
            Button("Действие") {}
        }
    },
    appearance: ListItemNormal.m.appearance
)
```

### Элемент списка с кастомным внешним видом

```swift
var customAppearance = ListItemAppearance()
customAppearance.titleColor = .accentColor
customAppearance.backgroundColor = ButtonColor(defaultColor: .surfaceDefaultClear)

SDDSListItem(
    title: "Кастомный элемент",
    appearance: customAppearance
)
```

## Структура внешнего вида

`ListItemAppearance` содержит следующие параметры:

- `titleTypography`: Типографика заголовка
- `titleColor`: Цвет заголовка
- `disclosureIconColor`: Цвет иконки раскрытия
- `disclosureIcon`: Иконка раскрытия (опционально)
- `backgroundColor`: Цвет фона с поддержкой состояний
- `size`: Конфигурация размеров

## Размеры

`ListItemSizeConfiguration` определяет размеры элемента списка:

- `contentPaddingEnd`: Отступ содержимого справа
- `height`: Высота элемента
- `paddingBottom`: Нижний отступ
- `paddingEnd`: Правый отступ
- `paddingStart`: Левый отступ
- `paddingTop`: Верхний отступ
- `shape`: Форма элемента (скругления)

## Состояния

Компонент поддерживает следующие состояния:

- **Обычное**: Стандартное отображение с полной прозрачностью
- **Наведение**: Изменение цвета фона при наведении курсора (только на macOS)
- **Отключенное**: Снижение прозрачности до 0.4 и отключение взаимодействия 