# SDDSAvatarGroup

Компонент представляет собой группу аватаров, отображаемых в ряд с наложением и обводкой между ними.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| data | [SDDSAvatarData] | Массив данных аватаров для отображения |
| lastAvatar | SDDSAvatarData | Данные для последнего аватара, который отображается, если количество аватаров превышает |
| maxDisplayingAvatarCount | Int | Максимальное количество отображаемых аватаров. По умолчанию 3 |
| size | AvatarGroupSizeConfiguration | Конфигурация размеров для группы аватаров, включая максимальное количество отображаемых аватаров, ширину обводки и расстояние между аватарами |
| appearance | AvatarGroupAppearance? | Параметры внешнего вида (опционально) |

## Окружение


- `avatarGroupAppearance`: Стандартные настройки внешнего вида

## Пример использования

```swift
SDDSAvatarGroup(
    data: exampleAvatars,
    lastAvatar: lastAvatarData,
    size: defaultSize,
    appearance: AvatarGroup.s.appearance
)

// Массив данных аватаров для отображения
static var exampleAvatars: [SDDSAvatarData] {
    [
        SDDSAvatarData(
            text: "JD",
            image: nil,
            placeholderImage: nil,
            status: .offline,
            appearance: Avatar.l.appearance,
            accessibility: defaultAccessibility
        ),
        SDDSAvatarData(
            text: "ML",
            image: .image(Image(systemName: "person.fill")),
            placeholderImage: nil,
            status: .offline,
            appearance: Avatar.l.appearance,
            accessibility: defaultAccessibility
        ),
        SDDSAvatarData(
            text: "ML",
            image: .image(Image(systemName: "person.fill")),
            placeholderImage: nil,
            status: .offline,
            appearance: Avatar.l.appearance,
            accessibility: defaultAccessibility
        )
    ]
}

// Данные для последнего аватара
static var lastAvatarData: SDDSAvatarData {
    SDDSAvatarData(
        text: "+5",
        image: nil,
        placeholderImage: nil,
        status: .hidden,
        appearance: Avatar.l.appearance,
        accessibility: defaultAccessibility
    )
}
```
