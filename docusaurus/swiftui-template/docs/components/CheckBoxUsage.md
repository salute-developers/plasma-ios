---
title: CheckBox
---

Настраиваемый чекбокс, который может быть настроен с помощью различных параметров.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `state` | `Binding<SelectionControlState>` | Состояние чекбокса |
| `title` | `String` | Текст заголовка для чекбокса |
| `subtitle` | `String?` | Текст подзаголовка для чекбокса |
| `isEnabled` | `Bool` | Флаг, указывающий, включен ли чекбокс |
| `images` | `SelectionControlStateImages?` | Изображения для различных состояний чекбокса |
| `appearance` | `CheckboxAppearance?` | Параметры внешнего вида чекбокса |
| `accessibility` | `SelectionControlAccessibility` | Параметры доступности для чекбокса |

## Окружение
- `checkboxAppearance`: Стандартные настройки внешнего вида чекбокса

## Примеры использования

### Базовый чекбокс

```swift
// @sample: SDDSComponentsFixtures/Samples/CheckBox/SDDSCheckbox_Simple.swift
```
