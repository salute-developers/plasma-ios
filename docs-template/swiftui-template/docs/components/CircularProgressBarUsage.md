---
title: CircularProgressBar
---

Компонент для отображения кругового прогресс-бара.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `progress` | `Double` | Значение прогресса от 0 до 1 |
| `suffix` | `String` | Суффикс для отображения значения (по умолчанию "%") |
| `hasTrack` | `Bool` | Флаг отображения фоновой дорожки (по умолчанию true) |
| `appearance` | `CircularProgressBarAppearance?` | Параметры внешнего вида прогресс-бара (опционально) |
| `content` | `AnyView?` | Пользовательское содержимое вместо значения (опционально) |

## Окружение
- `circularProgressBarAppearance`: Стандартные настройки внешнего вида прогресс-бара

## Примеры использования

### Базовый прогресс-бар

```swift
// @sample: SDDSComponentsFixtures/Samples/CircularProgressBar/SDDSCircularProgressBar_Simple.swift
```

<!-- @screenshot: SDDSComponentsFixtures.CircularProgressBar.SDDSCircularProgressBar_Simple -->

## Стиль CircularProgressBar

В большинстве случаев подходят готовые сгенерированные стили темы; при необходимости стиль можно собрать вручную из токенов.

<!-- @style-api -->
