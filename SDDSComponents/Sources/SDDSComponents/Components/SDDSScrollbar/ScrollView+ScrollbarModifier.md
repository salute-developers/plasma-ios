# ScrollView+ScrollbarModifier

Модификатор для добавления кастомного скроллбара к ScrollView.

Этот модификатор автоматически создает и управляет кастомным скроллбаром для ScrollView.
Скроллбар появляется при скролле и автоматически исчезает через 3 секунды после остановки.
При долгом нажатии (как в Safari) scrollbar увеличивается в ширине в 2 раза.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| scrollBarData | ScrollBarData | Данные для настройки скроллбара |
| isScrolling | Binding<Bool> | Binding для отслеживания состояния скролла (опционально) |

## Примеры использования

### Базовое использование
```swift
ScrollView {
    Text("Длинный контент...")
}
.scrollbar(scrollBarData: scrollBarData)
```

### С отслеживанием состояния скролла
```swift
@State private var isScrolling = false

ScrollView {
    Text("Длинный контент...")
}
.scrollbar(scrollBarData: scrollBarData, isScrolling: $isScrolling)
```

### С кастомными настройками скроллбара
```swift
let customScrollBarData = ScrollBarData(
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

ScrollView {
    Text("Длинный контент...")
}
.scrollbar(scrollBarData: customScrollBarData)
```

## Особенности

- Скроллбар автоматически появляется при начале скролла
- Автоматически исчезает через 3 секунды после остановки скролла
- Адаптируется к размеру контента
- Поддерживает настройку внешнего вида через ScrollBarData
- При долгом нажатии (0.5 секунды) scrollbar увеличивается в ширине в 2 раза
- Анимация изменения размера происходит с продолжительностью 0.2 секунды
- Максимальное расстояние для распознавания долгого нажатия составляет 50 пикселей

## Поведение при долгом нажатии

Модификатор поддерживает поведение, аналогичное Safari:
1. При нажатии на scrollbar начинается отсчет времени (0.5 секунды)
2. Если нажатие удерживается достаточно долго, scrollbar увеличивается в ширине в 2 раза
3. При отпускании scrollbar возвращается к исходному размеру
4. Все изменения размера происходят с плавной анимацией 