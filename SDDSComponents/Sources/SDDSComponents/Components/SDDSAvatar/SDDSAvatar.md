# SDDSAvatar

Компонент для отображения аватара пользователя с возможностью настройки внешнего вида и дополнительных элементов.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| text | String | Текст аватара (обычно инициалы пользователя) |
| image | AvatarImageSource? | Изображение аватара |
| placeholderImage | AvatarImageSource? | Изображение-заглушка, отображаемое при отсутствии основного изображения |
| status | AvatarStatus | Статус пользователя |
| appearance | AvatarAppearance? | Параметры внешнего вида аватара (опционально) |
| accessibility | AvatarAccessibility | Параметры доступности для аватара |
| extra | AvatarExtra<Content> | Дополнительный контент с указанием его расположения (опционально) |

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
```

### Аватар с изображением
```swift
SDDSAvatar(
    text: "JD",
    image: .url(URL(string: "https://example.com/avatar.jpg")!),
    placeholderImage: nil,
    status: .offline,
    appearance: Avatar.l.appearance,
    accessibility: AvatarAccessibility()
)
```

### Аватар с дополнительным контентом
```swift
SDDSAvatar(
    text: "JD",
    image: nil,
    placeholderImage: nil,
    status: .hidden,
    appearance: Avatar.m.appearance,
    accessibility: AvatarAccessibility(),
    extra: AvatarExtra(placement: .topRight) {
        SDDSBadge(text: "3", appearance: Badge.s.appearance)
    }
)
```
