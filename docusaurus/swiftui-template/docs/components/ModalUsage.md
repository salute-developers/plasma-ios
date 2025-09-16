---
title: Modal
---

Компонент для отображения модального окна с возможностью настройки внешнего вида и дополнительных элементов.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `content` | `() -> Content` | Контент модального окна |
| `closeImage` | `Image?` | Изображение кнопки закрытия |
| `appearance` | `ModalAppearance` | Параметры внешнего вида модального окна |
| `onClose` | `() -> Void` | Обработчик закрытия модального окна |

## Окружение

- `modalAppearance`: Стандартные настройки внешнего вида модального окна

## Параметры внешнего вида (ModalAppearance)

`ModalAppearance` определяет параметры внешнего вида модального окна:

- `backgroundColor`: Цвет фона модального окна
- `closeColor`: Цвет кнопки закрытия
- `size`: Конфигурация размеров модального окна

## Конфигурация размеров (ModalSizeConfiguration)

`ModalSizeConfiguration` определяет размеры и отступы модального окна:

- `closeSize`: Размер кнопки закрытия
- `paddingStart`: Отступ слева
- `paddingEnd`: Отступ справа
- `paddingTop`: Отступ сверху
- `paddingBottom`: Отступ снизу
- `shape`: Форма модального окна
- `shadow`: Тень модального окна

## Примеры использования

### Базовое модальное окно
```swift
SDDSModal(
    content: {
        Text("Содержимое модального окна")
    },
    closeImage: Asset.close36.image,
    appearance: Modal.default.appearance,
    onClose: {
        // Обработка закрытия
    }
)
```

### Модальное окно с кастомным внешним видом
```swift
SDDSModal(
    content: {
        VStack {
            Text("Заголовок")
            Text("Описание")
        }
    },
    closeImage: Image(systemName: "xmark"),
    appearance: ModalAppearance(
        backgroundColor: .surfaceDefaultSolidCard,
        closeColor: .textDefaultSecondary,
        size: ModalSize.default
    ),
    onClose: {
        // Обработка закрытия
    }
)
```

### Использование с модификатором View
```swift
Text("Открыть модальное окно")
    .modal(
        isPresented: $isPresented,
        appearance: Modal.default.appearance,
        closeImage: Asset.close36.image,
        useNativeBlackout: true,
        onShow: {
            // Обработка показа
        },
        onClose: {
            // Обработка закрытия
        }
    ) {
        Text("Содержимое модального окна")
    }
``` 
