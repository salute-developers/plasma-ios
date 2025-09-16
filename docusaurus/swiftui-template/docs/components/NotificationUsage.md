---
title: Notification
---

Компонент для отображения уведомлений с возможностью настройки внешнего вида и позиционирования.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `isPresented` | `Binding<Bool>` | Состояние отображения уведомления |
| `appearance` | `NotificationAppearance` | Параметры внешнего вида уведомления |
| `position` | `ToastPosition` | Позиция уведомления на экране |
| `duration` | `TimeInterval` | Время отображения уведомления |
| `hasClose` | `Bool` | Показывать ли кнопку закрытия |
| `onShow` | `((ToastID) -> Void)?` | Обработчик показа уведомления |
| `onClose` | `((ToastID) -> Void)?` | Обработчик закрытия уведомления |
| `content` | `() -> Content` | Контент уведомления |

## Окружение

- `notificationAppearance`: Стандартные настройки внешнего вида уведомления

## Параметры внешнего вида (NotificationAppearance)

`NotificationAppearance` определяет параметры внешнего вида уведомления:

- `backgroundColor`: Цвет фона уведомления
- `closeColor`: Цвет кнопки закрытия
- `size`: Конфигурация размеров уведомления

## Конфигурация размеров (NotificationSizeConfiguration)

`NotificationSizeConfiguration` определяет размеры и отступы уведомления:

- `closeSize`: Размер кнопки закрытия
- `paddingStart`: Отступ слева
- `paddingEnd`: Отступ справа
- `paddingTop`: Отступ сверху
- `paddingBottom`: Отступ снизу
- `shape`: Форма уведомления

## Позиции уведомления (ToastPosition)

`ToastPosition` определяет возможные позиции уведомления на экране:

- `topCenter`: Верхний центр экрана
- `topLeft`: Верхний левый угол
- `topRight`: Верхний правый угол
- `bottomCenter`: Нижний центр экрана
- `bottomLeft`: Нижний левый угол
- `bottomRight`: Нижний правый угол

## Примеры использования

### Базовое уведомление
```swift
Text("Показать уведомление")
    .notification(
        isPresented: $isNotificationPresented,
        appearance: Notification.default.appearance,
        position: .topCenter,
        duration: 3.0,
        hasClose: true
    ) {
        Text("Текст уведомления")
    }
```

### Уведомление с кастомным внешним видом
```swift
Text("Показать уведомление")
    .notification(
        isPresented: $isNotificationPresented,
        appearance: NotificationAppearance(
            backgroundColor: .surfaceDefaultSolidCard,
            closeColor: .textDefaultSecondary,
            size: NotificationSize.default
        ),
        position: .topRight,
        duration: 5.0,
        hasClose: true,
        onShow: { toastID in
            print("Уведомление показано: \(toastID)")
        },
        onClose: { toastID in
            print("Уведомление закрыто: \(toastID)")
        }
    ) {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            Text("Операция выполнена успешно")
        }
    }
```

### Уведомление без кнопки закрытия
```swift
Text("Показать уведомление")
    .notification(
        isPresented: $isNotificationPresented,
        appearance: Notification.default.appearance,
        position: .bottomCenter,
        duration: 2.0,
        hasClose: false
    ) {
        Text("Автоматически исчезнет через 2 секунды")
    }
``` 
