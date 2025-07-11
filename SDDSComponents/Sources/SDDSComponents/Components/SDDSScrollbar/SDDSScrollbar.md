# SDDSScrollbar

Компонент для отображения кастомного скроллбара.

Компонент отображает трек и ползунок скроллбара с настраиваемыми параметрами внешнего вида.
Поддерживает различные размеры, цвета и формы в соответствии с дизайн-системой.
При долгом нажатии (как в Safari) scrollbar увеличивается в ширине в 2 раза.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | ScrollbarAppearance? | Параметры внешнего вида скроллбара (опционально) |
| hasTrack | Bool | Флаг отображения трека скроллбара |
| thumbOffset | CGFloat | Смещение ползунка скроллбара относительно трека |
| thumbHeight | CGFloat | Высота ползунка скроллбара |
| totalHeight | CGFloat | Общая высота области скроллбара |
| scrollBarPaddingBottom | CGFloat | Отступ снизу для скроллбара |
| scrollBarPaddingTop | CGFloat | Отступ сверху для скроллбара |
| onThumbDrag | ((CGFloat) -> Void)? | Callback для обработки перетаскивания ползунка (передает процент скролла 0.0-1.0) |
| onLongPressChanged | ((Bool) -> Void)? | Callback для обработки изменения состояния long press |

## Окружение
- `scrollbarAppearance`: Стандартные настройки внешнего вида скроллбара

## Примеры использования

### Базовый скроллбар с треком и обработчиками
```swift
SDDSScrollbar(
    appearance: Scrollbar.m.appearance,
    hasTrack: true,
    thumbOffset: 50,
    thumbHeight: 40,
    totalHeight: 200,
    scrollBarPaddingBottom: 10,
    scrollBarPaddingTop: 10,
    onThumbDrag: { percentage in
        // Обработка перетаскивания ползунка
        print("Scroll percentage: \(percentage)")
    },
    onLongPressChanged: { isLongPressed in
        // Обработка long press
        print("Long pressed: \(isLongPressed)")
    }
)
```

### Скроллбар без трека (только ползунок)
```swift
SDDSScrollbar(
    appearance: Scrollbar.s.appearance,
    hasTrack: false,
    thumbOffset: 30,
    thumbHeight: 30,
    totalHeight: 150,
    scrollBarPaddingBottom: 5,
    scrollBarPaddingTop: 5
)
```

### Скроллбар с кастомными цветами
```swift
var customAppearance = Scrollbar.m.appearance
customAppearance.thumbColor = .accentColor
customAppearance.trackColor = .surfaceDefaultTransparentSecondary

SDDSScrollbar(
    appearance: customAppearance,
    hasTrack: true,
    thumbOffset: 100,
    thumbHeight: 60,
    totalHeight: 300,
    scrollBarPaddingBottom: 15,
    scrollBarPaddingTop: 15
)
```

## Размеры

Компонент поддерживает следующие размеры:
- `s`: Ширина 2.0
- `m`: Ширина 4.0

## Особенности

- Компонент автоматически скрывает трек, если `hasTrack` установлен в `false`
- Минимальная высота ползунка составляет 1.0 пиксель
- Форма скроллбара настраивается через `ScrollbarAppearance.shape`
- Цвета адаптируются к текущей цветовой схеме (светлая/темная)
- При долгом нажатии (0.5 секунды) scrollbar увеличивается в ширине в 2 раза с плавной анимацией
- Анимация изменения размера происходит с продолжительностью 0.2 секунды
- Максимальное расстояние для распознавания долгого нажатия составляет 50 пикселей
- Поддерживает drag gesture для перетаскивания ползунка с мгновенной реакцией
- Плавные анимации появления/исчезновения и изменения размера
- Синхронизация с внешним скроллом контента

## Поведение при долгом нажатии

Компонент поддерживает поведение, аналогичное Safari:
1. При нажатии на scrollbar начинается отсчет времени (0.5 секунды)
2. Если нажатие удерживается достаточно долго, scrollbar увеличивается в ширине в 2 раза
3. При отпускании scrollbar возвращается к исходному размеру
4. Все изменения размера происходят с плавной анимацией

## Поведение при перетаскивании

Компонент поддерживает интерактивное перетаскивание ползунка:
1. Drag gesture активируется с минимальным расстоянием 0 пикселей для мгновенной реакции
2. При начале перетаскивания `onThumbDrag` callback вызывается с текущим процентом скролла
3. Во время перетаскивания callback вызывается непрерывно с обновленным процентом (0.0-1.0)
4. При завершении перетаскивания состояние сбрасывается для следующего взаимодействия
5. Анимации отключаются во время перетаскивания для плавного движения 