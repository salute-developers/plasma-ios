---
title: AvatarGroup
---

Компонент представляет собой группу аватаров, отображаемых в ряд с наложением и обводкой между ними.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `data` | `[SDDSAvatarData]` | Массив данных аватаров для отображения |
| `lastAvatar` | `SDDSAvatarData` | Данные для последнего аватара, который отображается, если количество аватаров превышает |
| `maxDisplayingAvatarCount` | Int | Максимальное количество отображаемых аватаров. По умолчанию 3 |
| `size` | `AvatarGroupSizeConfiguration` | Конфигурация размеров для группы аватаров, включая максимальное количество отображаемых аватаров, ширину обводки и расстояние между аватарами |
| `appearance` | `AvatarGroupAppearance?` | Параметры внешнего вида (опционально) |

## Окружение


- `avatarGroupAppearance`: Стандартные настройки внешнего вида

## Пример использования

```swift
// @sample: SDDSComponentsFixtures/Samples/AvatarGroup/SDDSAvatarGroup_Simple.swift
```

<!-- @screenshot: SDDSComponentsFixtures.AvatarGroup.SDDSAvatarGroup_Simple -->

## Стиль AvatarGroup

В большинстве случаев подходят готовые сгенерированные стили темы; при необходимости стиль можно собрать вручную из токенов.

<!-- @style-api -->
