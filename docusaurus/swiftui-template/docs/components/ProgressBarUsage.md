---
title: ProgressBar
---

Настраиваемый прогресс-бар, который может быть настроен с помощью различных параметров.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `progress` | `Binding<Double>` | Значение прогресса (от 0 до 1), отображаемое в виде заполняющейся полосы |
| `isEnabled` | `Bool` | Флаг, указывающий, доступен ли прогресс-бар для взаимодействия |
| `appearance` | `ProgressBarAppearance?` | Параметры внешнего вида прогресс-бара |
| `accessibility` | `ProgressBarAccessibility` | Параметры доступности для прогресс-бара |

## Окружение
- `progressBarAppearance`: Стандартные настройки внешнего вида прогресс-бара

## Пример использования

```swift
// @sample: SDDSComponentsFixtures/Samples/ProgressBar/SDDSProgressView_Simple.swift
```
