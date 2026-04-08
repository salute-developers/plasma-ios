---
title: Image
---

`SDDSImage` — компонент для отображения `SwiftUI.Image` с фиксированным **соотношением сторон** из сгенерированной темы (`ImageSize` / `ImageAppearance`).

Вариации ratio генерируются ThemeBuilder из `image_config.json` и доступны в теме как `Image.ratio_*`.

## Параметры

| Параметр    | Тип                 | Описание                                                                              |
|-------------|---------------------|---------------------------------------------------------------------------------------|
| image       | `SwiftUI.Image`     | Изображение для отображения                                                           |
| appearance  | `ImageAppearance?`  | Внешний вид (ratio). По умолчанию — `EnvironmentValues.imageAppearance`               |

## Окружение

- `imageAppearance`: дефолтные настройки ratio для `SDDSImage`, если `appearance` не передан в инициализаторе.

## Примеры использования

```swift
// @sample: SDDSComponentsFixtures/Samples/Image/SDDSImage_Ratio16x9.swift
```

```swift
// @sample: SDDSComponentsFixtures/Samples/Image/SDDSImage_Ratio1x1.swift
```
