---
title: Text (SDDSText)
---

`SDDSText` — тонкая обёртка над `SwiftUI.Text` с поддержкой дизайн-системного окраса через ``FillStyle`` (цвет или градиент) и параметров отображения текста. Не генерируется ThemeBuilder; окрас задаётся только через ``FillStyle``.

## Параметры

| Параметр               | Тип                     | Описание                                                                 |
|------------------------|-------------------------|--------------------------------------------------------------------------|
| source                 | `SDDSTextSource`        | Строка, локализация, `AttributedString` и др.                             |
| fillStyle              | `FillStyle?`            | Цвет/градиент; если `nil`, берётся из окружения                           |
| lineLimit              | `Int?`                  | Лимит строк                                                             |
| minimumScaleFactor      | `CGFloat?`              | Минимальный масштаб шрифта                                               |
| multilineTextAlignment | `TextAlignment?`        | Выравнивание многострочного текста                                       |
| truncationMode         | `Text.TruncationMode?`  | Режим усечения                                                          |

Удобные инициализаторы: `SDDSText(_ string:)`, `SDDSText(_ key: LocalizedStringKey)`.

## Источник текста (`SDDSTextSource`)

Варианты: `String`, `LocalizedStringKey`, `AttributedString`, обёртка над `Text` (см. `SDDSComponents`).

## Окружение

- `sddsTextEnvironment` (`SDDSTextEnvironment`): дефолтный `fillStyle`, `lineLimit`, масштаб, выравнивание, truncation. Локальные параметры `init` переопределяют значения из окружения.

## Примеры использования

```swift
// @sample: SDDSComponentsFixtures/Samples/Text/SDDSText_DefaultColor.swift
```

```swift
// @sample: SDDSComponentsFixtures/Samples/Text/SDDSText_Gradient.swift
```
