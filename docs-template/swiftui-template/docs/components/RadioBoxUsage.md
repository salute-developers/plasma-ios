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
// @sample: SDDSComponentsFixtures/Samples/RadioBox/SDDSRadiobox_Simple.swift
```

<!-- @screenshot: SDDSComponentsFixtures.RadioBox.SDDSRadiobox_Simple -->

## Стиль RadioBox

В большинстве случаев подходят готовые сгенерированные стили темы; при необходимости стиль можно собрать вручную из токенов.

<!-- @style-api -->
