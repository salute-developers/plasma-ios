---
title: FormItem
---

Контейнер над полем ввода с title, optional, caption, counter и hint. По контракту повторяет Android `FormItem`: это визуальная оболочка, а не форма с валидацией.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `appearance` | `FormItemAppearance?` | Внешний вид из темы; `nil` берется из окружения |
| `hint` | `(() -> View)?` | Кастомный hint-slot |
| `title` | `(() -> View)?` | Заголовок |
| `optional` | `(() -> View)?` | Текст optional для `formType = .optional` |
| `titleCaption` | `(() -> View)?` | Дополнительный заголовок |
| `caption` | `(() -> View)?` | Подпись под контентом |
| `counter` | `(() -> View)?` | Счетчик справа снизу |
| `enabled` | `Bool` | Включенное состояние |
| `content` | `() -> View` | Основной контент (обычно `SDDSTextField`, `SDDSCheckbox`, `Text`) |

Отдельный overload:

| Параметр | Тип | Описание |
|----------|-----|----------|
| `hasHint` | `Bool` | Показывает иконку hint из `appearance.hintIcon` |
| `onHintPressed` | `(() -> Void)?` | Обработчик тапа по hint |

## Группировка

- `SDDSFormVertical` — вертикальная группа `SDDSFormItem` (spacing по умолчанию `4`)
- `SDDSFormHorizontal` — горизонтальная группа `SDDSFormItem` (spacing по умолчанию `4`)

## Окружение

- `formItemAppearance`: дефолтный appearance для `SDDSFormItem`, `SDDSFormVertical`, `SDDSFormHorizontal`

## Пример использования

```swift
// @sample: SDDSComponentsFixtures/Samples/FormItem/SDDSFormItem_Simple.swift
```

<!-- @screenshot: SDDSComponentsFixtures.FormItem.SDDSFormItem_Simple -->

## Стиль FormItem

В большинстве случаев подходят готовые сгенерированные стили темы; при необходимости стиль можно собрать вручную из токенов.

<!-- @style-api -->
