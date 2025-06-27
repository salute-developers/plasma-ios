# SDDSToast

Компонент для отображения всплывающих уведомлений (toast) с возможностью настройки внешнего вида, позиции, и содержимого.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| isPresented | Binding<Bool> | Состояние отображения тоста |
| text | String | Текст тоста (для модификатора с текстом) |
| appearance | ToastAppearance | Параметры внешнего вида тоста |
| position | ToastPosition | Позиция тоста на экране |
| duration | TimeInterval | Время отображения тоста |
| contentEndPosition | ToasContentEndPosition | Позиция конечного контента |
| onShow | ((ToastID) -> Void)? | Обработчик показа тоста |
| onClose | ((ToastID) -> Void)? | Обработчик закрытия тоста |
| contentStart | () -> View | Начальный контент (иконка, кнопка и т.д.) |
| content | () -> View | Произвольный контент тоста |
| contentEnd | () -> View | Конечный контент (иконка, кнопка и т.д.) |

## Окружение

- `toastAppearance`: Стандартные настройки внешнего вида тостов

## Параметры внешнего вида (ToastAppearance)

`ToastAppearance` определяет параметры внешнего вида тоста:

- `backgroundColor`: Цвет фона тоста
- `textColor`: Цвет текста
- `contentStartColor`: Цвет начального контента
- `contentEndColor`: Цвет конечного контента
- `textTypography`: Типографика текста
- `size`: Конфигурация размеров тоста

## Конфигурация размеров (ToastSizeConfiguration)

`ToastSizeConfiguration` определяет размеры и отступы тоста:

- `contentStartSize`: Размер начального контента
- `contentEndSize`: Размер конечного контента
- `contentStartPadding`: Отступ после начального контента
- `contentEndPadding`: Отступ перед конечным контентом
- `paddingStart`: Отступ слева
- `paddingEnd`: Отступ справа
- `paddingTop`: Отступ сверху
- `paddingBottom`: Отступ снизу
- `shape`: Форма тоста

## Позиции тоста (ToastPosition)

`ToastPosition` определяет возможные позиции тоста на экране:

- `topCenter`, `topLeft`, `topRight`, `bottomCenter`, `bottomLeft`, `bottomRight`

## Позиции конечного контента (ToasContentEndPosition)

`ToasContentEndPosition` определяет расположение конечного контента:

- `centerRight`: По центру справа
- `topRight`: В правом верхнем углу

## Примеры использования

### Базовый тост с текстом
```swift
Text("Показать тост")
    .toast(
        isPresented: $isToastPresented,
        text: "Текст тоста",
        appearance: Toast.m.default.appearance,
        position: .topCenter,
        duration: 3.0,
        contentStart: { EmptyView() },
        contentEnd: { EmptyView() }
    )
```

### Тост с иконкой и кнопкой закрытия
```swift
Text("Показать тост")
    .toast(
        isPresented: $isToastPresented,
        text: "Текст тоста",
        appearance: Toast.m.default.appearance,
        position: .bottomRight,
        duration: 5.0,
        onShow: { toastID in print("Показан: \(toastID)") },
        onClose: { toastID in print("Закрыт: \(toastID)") },
        contentStart: { Image(systemName: "info.circle") },
        contentEnd: { Image(systemName: "xmark") }
    )
```

### Кастомный тост с произвольным содержимым
```swift
Text("Показать тост")
    .toast(
        isPresented: $isToastPresented,
        appearance: ToastAppearance(
            backgroundColor: .surfaceDefaultSolidCard,
            textColor: .textDefaultPrimary,
            contentStartColor: .iconDefault,
            contentEndColor: .iconDefault,
            textTypography: .default,
            size: DefaultToastSize()
        ),
        position: .topLeft,
        duration: 4.0,
        contentEndPosition: .topRight,
        contentStart: { Image(systemName: "star.fill") },
        content: { 
            HStack {
                Text("Кастомный")
                Text("текст")
            }
        },
        contentEnd: { Image(systemName: "xmark") }
    )
``` 