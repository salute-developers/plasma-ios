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
// Создание счетчика с предупреждающим стилем
let warningCounter = SDDSCounter(
    text: "1",
    appearance: Counter.l.warning.appearance,
    isAnimating: false,
    isHighlighted: true,
    isHovered: false,
    isSelected: false
)
``` 
