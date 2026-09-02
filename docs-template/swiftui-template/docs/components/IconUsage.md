---
title: Icon (SDDSIcon)
---

`SDDSIcon` — обёртка над `SwiftUI.Image` для **иконок** (template + tint или градиент через ``FillStyle``). Не генерируется dsbuilder; дефолты задаются через окружение ``SDDSIconEnvironment``.

## Параметры

| Параметр   | Тип               | Описание                                                                |
|------------|-------------------|-------------------------------------------------------------------------|
| source     | `SDDSImageSource` | `Image`, ассет по имени, SF Symbol                                      |
| fillStyle  | `FillStyle?`      | Цвет/градиент; если `nil` — из окружения                                |
| sideLength | `CGFloat?`        | Квадратный размер (ширина = высота); если `nil` — из окружения          |

## Источник изображения (`SDDSImageSource`)

Минимум: `image(Image)`, `asset(name:bundle:)`, `systemSymbol(name:)`.

## Окружение

- `sddsIconEnvironment` (`SDDSIconEnvironment`): дефолтный `fillStyle` и опциональный `defaultSize` (сторона квадрата).

## Примеры использования

```swift
// @sample: SDDSComponentsFixtures/Samples/Icon/SDDSIcon_TintColor.swift
```

<!-- @screenshot: SDDSComponentsFixtures.Icon.SDDSIcon_TintColor -->

```swift
// @sample: SDDSComponentsFixtures/Samples/Icon/SDDSIcon_Gradient.swift
```

<!-- @screenshot: SDDSComponentsFixtures.Icon.SDDSIcon_Gradient -->

## Стиль Icon

В большинстве случаев подходят готовые сгенерированные стили темы; при необходимости стиль можно собрать вручную из токенов.

<!-- @style-api -->
