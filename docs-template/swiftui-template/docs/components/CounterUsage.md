---
title: Counter
---

Компонент счетчика, отображающий числовое значение с настраиваемым внешним видом и состояниями.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `text` | `String` | Текст (числовое значение) для отображения в счетчике |
| `appearance` | `CounterAppearance?` | Кастомизация внешнего вида счетчика (опционально) |
| `isAnimating` | `Bool` | Флаг анимации счетчика |
| `isHighlighted` | `Bool` | Флаг подсветки счетчика |
| `isHovered` | `Bool` | Флаг состояния наведения |
| `isSelected` | `Bool` | Флаг выбранного состояния |

## Окружение
- `counterAppearance`: Стандартные настройки внешнего вида счетчиков

## Пример использования

```swift
// @sample: SDDSComponentsFixtures/Samples/Counter/SDDSCounter_Simple.swift
``` 

<!-- @screenshot: SDDSComponentsFixtures.Counter.SDDSCounter_Simple -->

## Стиль Counter

В большинстве случаев подходят готовые сгенерированные стили темы; при необходимости стиль можно собрать вручную из токенов.

<!-- @style-api -->
