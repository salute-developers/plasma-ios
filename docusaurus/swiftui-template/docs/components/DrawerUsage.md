---
title: Drawer
---

Компонент для отображения выдвижной панели с настраиваемым внешним видом и различными режимами отображения.

## Параметры модификатора drawer

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `isPresented` | `Binding<Bool>` | Привязка к булевому значению, определяющему, отображается ли drawer |
| `appearance` | `DrawerAppearance` | Параметры внешнего вида drawer |
| `alignment` | `DrawerAlignment` | Выравнивание drawer на экране (`.top`, `.bottom`, `.left`, `.right`). По умолчанию `.bottom` |
| `overlayAppearance` | `OverlayAppearance?` | Параметры внешнего вида оверлея (опционально) |
| `drawerWidth` | `CGFloat?` | Явная ширина drawer (опционально) |
| `drawerHeight` | `CGFloat?` | Явная высота drawer (опционально) |
| `moveContentEnabled` | `Bool` | Включает режим, при котором основной контент сдвигается вместе с drawer. По умолчанию `false` |
| `peekOffset` | `CGFloat?` | Смещение для частичного отображения drawer, когда он закрыт (опционально). Работает только когда `moveContentEnabled = false` |
| `closePlacement` | `DrawerClosePlacement` | Размещение кнопки закрытия относительно header (`.left` или `.right`). По умолчанию `.right` |
| `hasHeader` | `Bool` | Флаг наличия header |
| `hasFooter` | `Bool` | Флаг наличия footer |
| `onClose` | `(() -> Void)?` | Обработчик закрытия drawer (опционально) |
| `header` | `() -> Header` | Верхняя часть drawer (опционально) |
| `content` | `() -> Content` | Основное содержимое drawer |
| `footer` | `() -> Footer` | Нижняя часть drawer (опционально) |

## Окружение

- `drawerAppearance`: Стандартные настройки внешнего вида drawer

## Выравнивание (DrawerAlignment)

`DrawerAlignment` определяет варианты выравнивания drawer на экране:

- `top`: Drawer выдвигается сверху
- `bottom`: Drawer выдвигается снизу
- `left`: Drawer выдвигается слева
- `right`: Drawer выдвигается справа

## Размещение кнопки закрытия (DrawerClosePlacement)

`DrawerClosePlacement` определяет размещение кнопки закрытия относительно header:

- `left`: Кнопка закрытия слева от header
- `right`: Кнопка закрытия справа от header

## Параметры внешнего вида (DrawerAppearance)

`DrawerAppearance` определяет параметры внешнего вида drawer:

- `backgroundColor`: Цвет фона drawer
- `closeColor`: Цвет кнопки закрытия
- `closeIcon`: Изображение кнопки закрытия (опционально)
- `shadow`: Тень drawer (опционально)
- `size`: Конфигурация размеров drawer

## Конфигурация размеров (DrawerSizeConfiguration)

`DrawerSizeConfiguration` определяет размеры и отступы drawer:

- `paddingStart`: Отступ слева
- `paddingEnd`: Отступ справа
- `paddingTop`: Отступ сверху
- `paddingBottom`: Отступ снизу
- `closeIconHeaderPadding`: Отступ между кнопкой закрытия и header
- `closeIconOffsetX`: Горизонтальное смещение кнопки закрытия
- `closeIconOffsetY`: Вертикальное смещение кнопки закрытия
- `closeIconSize`: Размер кнопки закрытия
- `closeIconPlacement`: Размещение иконки закрытия (`.inner`, `.none`, `.outer`)

## Режимы отображения

### Режим "Above Content" (moveContentEnabled = false)

В этом режиме drawer отображается поверх основного контента. Основной контент остается неподвижным, а drawer выдвигается поверх него.

### Режим "Move Content" (moveContentEnabled = true)

В этом режиме основной контент сдвигается вместе с drawer, создавая эффект "выталкивания" контента. Drawer занимает часть экрана, а основной контент сдвигается в противоположную сторону.

### Peek Offset

Когда `peekOffset` задан и `moveContentEnabled = false`, drawer частично виден даже когда закрыт. Пользователь может растянуть drawer до полного открытия, потянув в направлении открытия, или свернуть его обратно к позиции с peekOffset.

## Примеры использования

### Базовый drawer снизу

```swift
@State private var isDrawerPresented = false

Text("Открыть drawer")
    .drawer(
        isPresented: $isDrawerPresented,
        appearance: DrawerCloseInner.m.default.appearance,
        hasHeader: false,
        hasFooter: false,
        content: {
            Text("Содержимое drawer")
        }
    )
```

### Drawer с header и footer

```swift
@State private var isDrawerPresented = false

Text("Открыть drawer")
    .drawer(
        isPresented: $isDrawerPresented,
        appearance: DrawerCloseInner.m.default.appearance,
        hasHeader: true,
        hasFooter: true,
        header: {
            Text("Заголовок")
        },
        content: {
            Text("Содержимое drawer")
        },
        footer: {
            Text("Подвал")
        }
    )
```

### Drawer слева с режимом "Move Content"

```swift
@State private var isDrawerPresented = false

Text("Открыть drawer")
    .drawer(
        isPresented: $isDrawerPresented,
        appearance: DrawerCloseInner.m.default.appearance,
        alignment: .left,
        drawerWidth: 200,
        moveContentEnabled: true,
        hasHeader: false,
        hasFooter: false,
        content: {
            Text("Содержимое drawer")
        }
    )
```

### Drawer с peekOffset

```swift
@State private var isDrawerPresented = false

Text("Открыть drawer")
    .drawer(
        isPresented: $isDrawerPresented,
        appearance: DrawerCloseInner.m.default.appearance,
        alignment: .bottom,
        peekOffset: 80,
        hasHeader: false,
        hasFooter: false,
        content: {
            Text("Содержимое drawer")
        }
    )
```

### Drawer с overlay

```swift
@State private var isDrawerPresented = false

Text("Открыть drawer")
    .drawer(
        isPresented: $isDrawerPresented,
        appearance: DrawerCloseInner.m.default.appearance,
        overlayAppearance: Overlay.default.appearance,
        hasHeader: false,
        hasFooter: false,
        content: {
            Text("Содержимое drawer")
        }
    )
```

### Drawer с кастомным размещением кнопки закрытия

```swift
@State private var isDrawerPresented = false

Text("Открыть drawer")
    .drawer(
        isPresented: $isDrawerPresented,
        appearance: DrawerCloseInner.m.default.appearance,
        closePlacement: .left,
        hasHeader: true,
        hasFooter: false,
        header: {
            Text("Заголовок")
        },
        content: {
            Text("Содержимое drawer")
        }
    )
```

### Использование SDDSDrawer напрямую

```swift
SDDSDrawer(
    appearance: DrawerCloseInner.m.default.appearance,
    closePlacement: .right,
    hasHeader: true,
    hasFooter: true,
    header: {
        Text("Заголовок")
    },
    content: {
        Text("Содержимое drawer")
    },
    footer: {
        Text("Подвал")
    }
)
```



