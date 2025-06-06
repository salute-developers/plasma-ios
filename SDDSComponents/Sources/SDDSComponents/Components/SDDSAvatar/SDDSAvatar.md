# SDDSAvatar

Компонент для отображения аватара пользователя с возможностью настройки внешнего вида и дополнительных элементов.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| image | Image? | Изображение аватара |
| initials | String? | Инициалы пользователя |
| status | AvatarStatus | Статус пользователя |
| extra | AvatarExtra<Content> | Дополнительный контент с указанием его расположения |
| appearance | AvatarAppearance? | Параметры внешнего вида аватара |

## Окружение

- `avatarAppearance`: Стандартные настройки внешнего вида аватара

## Статусы аватара (AvatarStatus)

`AvatarStatus` определяет возможные статусы пользователя:

- `hidden`: Статус скрыт
- `online`: Пользователь онлайн
- `offline`: Пользователь оффлайн

## Дополнительный контент (AvatarExtra)

`AvatarExtra` позволяет добавить произвольный контент (например, бейдж, иконку или счетчик) к аватару с возможностью указания его расположения.

### Расположение контента (AvatarExtraPlacement)

`AvatarExtraPlacement` определяет расположение дополнительного контента относительно аватара:

- `none`: Без дополнительного контента
- `topLeft`: Верхний левый угол
- `topRight`: Верхний правый угол
- `bottomLeft`: Нижний левый угол
- `bottomRight`: Нижний правый угол

## Примеры использования

### Аватар с статусом
```swift
 SDDSAvatar(
     text: "JD",
     image: nil,
     placeholderImage: nil,
     status: .online,
     appearance: Avatar.xxl.appearance,
     accessibility: AvatarAccessibility()
 )
)
```
