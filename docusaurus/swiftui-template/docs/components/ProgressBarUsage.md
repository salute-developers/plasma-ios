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
// Базовый прогресс-бар с акцентным стилем
@State private var progress = 0.5

SDDSProgressView(
    progress: $progress,
    isEnabled: true,
    appearance: ProgressBar.default.accent.appearance
)
```
