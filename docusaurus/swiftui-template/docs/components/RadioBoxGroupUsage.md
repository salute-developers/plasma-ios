---
title: RadioBoxGroup
---

Компонент представляет собой группу радиобоксов, настроенных с помощью RadioboxData.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `radioboxData` | `[RadioboxData]` | Массив данных для инициализации группы радиобоксов |
| `size` | `RadioboxGroupSizeConfiguration` | Конфигурация размеров группы (устаревший параметр) |
| `appearance` | `RadioboxGroupAppearance?` | Параметры внешнего вида группы радиобоксов (опционально) |

## Окружение
- `radioboxGroupAppearance`: Стандартные настройки внешнего вида группы радиобоксов

## Пример использования

```swift
// Создание группы из 5 радиобоксов
let radioboxData = (0..<5).map { index in
    RadioboxData(
        title: "Option \(index + 1)",
        subtitle: "Description \(index + 1)",
        isSelected: .constant(index == 0),
        appearance: Radiobox.m.appearance,
        accessibility: SelectionControlAccessibility()
    )
}

SDDSRadioboxGroup(
    radioboxData: radioboxData,
    appearance: RadioboxGroup.m.appearance
)
```
