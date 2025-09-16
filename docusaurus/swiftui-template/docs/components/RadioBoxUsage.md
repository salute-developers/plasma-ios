---
title: RadioBox
---

Компонент радиокнопки, который позволяет пользователю выбрать один вариант из группы опций.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `isSelected` | `Binding<Bool>` | Состояние выбранности |
| `title` | `String` | Текст заголовка радиокнопки |
| `subtitle` | `String?` | Текст подзаголовка радиокнопки (опционально) |
| `isEnabled` | `Bool` | Флаг доступности радиокнопки |
| `images` | `RadioboxImages?` | Изображения для состояний выбранности и невыбранности |
| `appearance` | `RadioboxAppearance?` | Параметры внешнего вида радиокнопки |
| `accessibility` | `SelectionControlAccessibility` | Параметры доступности |

## Окружение
- `radioboxAppearance`: Стандартные настройки внешнего вида

## Примеры использования

### Базовая радиокнопка

```swift
 @State isSelected: Bool = true
 SDDSRadiobox(
     isSelected: $isSelected,
     title: "Value",
     subtitle: "Description",
     isEnabled: true,
     appearance: Radiobox.m.appearance
 )
```
