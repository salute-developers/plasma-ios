# SDDSCard

Контейнерный компонент для отображения содержимого в виде карточки с настраиваемым внешним видом.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | CardAppearance? | Кастомизация внешнего вида карточки (опционально) |
| backgroundColor | Color? | Цвет фона карточки (опционально) |
| content | Content | Содержимое карточки |

## Окружение
- `cardAppearance`: Стандартные настройки внешнего вида карточек

## Пример использования

```swift
// Простая карточка с текстом
SDDSCard(appearance: Card.m.default.appearance) {
     VStack(alignment: .leading, spacing: 8) {
         Text("Header")
         Text("Description")
     }
 }
``` 
