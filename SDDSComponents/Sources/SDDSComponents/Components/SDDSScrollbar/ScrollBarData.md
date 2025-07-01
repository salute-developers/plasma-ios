# ScrollBarData

Структура данных для настройки кастомного скроллбара.

`ScrollBarData` содержит все необходимые данные для настройки и отображения кастомного скроллбара.
Эта структура используется модификатором `scrollbar` для передачи параметров в `ScrollBarModifier`.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| hasTrack | Bool | Флаг отображения трека скроллбара |
| offsetY | CGFloat | Смещение по вертикали для позиционирования скроллбара |
| totalHeight | CGFloat | Общая высота области скроллбара |
| scrollBarThickness | CGFloat | Толщина скроллбара |
| scrollBarPaddingTop | CGFloat | Отступ сверху для скроллбара |
| scrollBarPaddingBottom | CGFloat | Отступ снизу для скроллбара |
| scrollBarPaddingEnd | CGFloat | Отступ справа для скроллбара |
| scrollBarTrackColor | ColorToken | Цвет трека скроллбара |
| scrollBarThumbColor | ColorToken | Цвет ползунка скроллбара |
| contentInsetTop | CGFloat | Верхний отступ для контента |

## Примеры использования

### Базовые настройки
```swift
let scrollBarData = ScrollBarData(
    hasTrack: true,
    offsetY: 0,
    totalHeight: 200,
    scrollBarThickness: 4,
    scrollBarPaddingTop: 10,
    scrollBarPaddingBottom: 10,
    scrollBarPaddingEnd: 8,
    scrollBarTrackColor: .surfaceDefaultTransparentPrimary,
    scrollBarThumbColor: .surfaceDefaultSolidTertiary,
    contentInsetTop: 0
)
```

### Скроллбар без трека
```swift
let scrollBarData = ScrollBarData(
    hasTrack: false,
    offsetY: 0,
    totalHeight: 150,
    scrollBarThickness: 2,
    scrollBarPaddingTop: 5,
    scrollBarPaddingBottom: 5,
    scrollBarPaddingEnd: 4,
    scrollBarTrackColor: .clearColor,
    scrollBarThumbColor: .surfaceDefaultSolidTertiary,
    contentInsetTop: 0
)
```

### Кастомные цвета
```swift
let scrollBarData = ScrollBarData(
    hasTrack: true,
    offsetY: 0,
    totalHeight: 250,
    scrollBarThickness: 6,
    scrollBarPaddingTop: 15,
    scrollBarPaddingBottom: 15,
    scrollBarPaddingEnd: 10,
    scrollBarTrackColor: .accentColor.opacity(0.2),
    scrollBarThumbColor: .accentColor,
    contentInsetTop: 20
)
```

## Особенности

- `hasTrack` определяет, будет ли отображаться фоновая область скроллбара
- `offsetY` используется для позиционирования скроллбара относительно контента
- `totalHeight` должна соответствовать высоте видимой области ScrollView
- `scrollBarThickness` влияет на ширину скроллбара
- Отступы (`scrollBarPadding*`) позволяют точно настроить позиционирование
- Цвета адаптируются к текущей цветовой схеме (светлая/темная)
- `contentInsetTop` добавляет дополнительный отступ сверху для контента 