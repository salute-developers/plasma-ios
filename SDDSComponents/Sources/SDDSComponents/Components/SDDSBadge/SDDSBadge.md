# SDDSBadge

Компонент для отображения меток, статусов или тегов с возможностью добавления иконок и обработки нажатий.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| label | String | Текст бейджа |
| image | Image? | Иконка бейджа (опционально) |
| alignment | BadgeAlignment | Выравнивание иконки (leading/trailing) |
| style | BadgeStyle | Стиль бейджа |
| appearance | BadgeAppearance? | Параметры внешнего вида бейджа |
| action | (() -> Void)? | Действие при нажатии на бейдж (опционально) |

## Окружение

- `badgeAppearance`: Стандартные настройки внешнего вида бейджа

## Стили бейджа (BadgeStyle)

`BadgeStyle` определяет стиль отображения компонента:

- `basic`: Базовый стиль бейджа без иконки
- `icon`: Стиль бейджа с поддержкой отображения иконки

## Выравнивание иконки (BadgeAlignment)

`BadgeAlignment` определяет расположение иконки относительно текста:

- `leading`: Иконка слева от текста
- `trailing`: Иконка справа от текста

## Примеры использования

### Базовый бейдж

```swift
SDDSBadge(
    label: "Label",
    image: nil,
    alignment: .leading,
    style: .basic,
    appearance: Badge.m.default.appearance
)
```

### Бейдж с иконкой и акцентным стилем

```swift
SDDSBadge(
    label: "Label",
    image: Image(systemName: "star.fill"),
    alignment: .trailing,
    style: .icon,
    appearance: Badge.m.accent.appearance
)
```
