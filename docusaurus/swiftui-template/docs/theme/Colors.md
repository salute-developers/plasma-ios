---
title: Токены цвета и градиентов
---

Токены цвета делятся на несколько логических групп, согласно назначению элемента: `text`, `surface`, `background` и `outline`.

Эти группы в свою очередь делятся на подтемы:
- `Default` - По умолчанию, значения токенов меняются в зависимости от темы
- `OnDark` - Статические значения токенов из тёмной темы, не меняются при переключении темы,
- `OnLight` - Статические значения токенов из светлой темы, не меняются при переключении темы,
- `Inverse` Инвертированные значения токенов подтемы `Default`.

## Структура токенов

### ColorToken
Токены цвета представлены структурой `ColorToken`, которая содержит:
- `darkColor: Color` - цвет для тёмной темы
- `lightColor: Color` - цвет для светлой темы

### GradientToken
Токены градиентов представлены структурой `GradientToken`, которая содержит:
- `description: String` - описание градиента
- `darkGradients: [GradientKind]` - градиенты для тёмной темы
- `lightGradients: [GradientKind]` - градиенты для светлой темы

### Типы градиентов
- `LinearGradient` - линейный градиент с углом наклона
- `RadialGradient` - радиальный градиент с центром и радиусами
- `AngularGradient` - угловой градиент с начальным и конечным углами
- `PlainColor` - простой цвет без градиента

## Применение токенов

### ColorToken

Для применения токенов цвета используйте метод `.color(for:)`:
```swift
Text("Hello")
    .foregroundColor(Colors.textDefaultPrimary.color(for: colorScheme))
```

```swift
Rectangle()
    .fill(Colors.surfaceDefaultAccent.color(for: colorScheme))
```

### GradientToken

Для применения градиентов используйте модификатор `.gradient()`:
```swift
Rectangle()
    .gradient(Gradients.textDefaultAccentGradient, colorScheme: colorScheme)
```

```swift
Rectangle()
    .gradient(Gradients.textDefaultAccentGradient)
```

### Дополнительные методы ColorToken

```swift
// Получение цвета для конкретной темы
let lightColor = colorToken.color(for: .light)
let darkColor = colorToken.color(for: .dark)

// Применение альфы к токену
let semiTransparentColor = colorToken.withAlpha(multipliedBy: 0.5)
```

### Структура именования токена цвета
```
область применения + подтема + название состояния
```

Например,
- Токену с названием `🌕 Surfaces Default/Accent/surfaceAccent` в коде будет соответствовать аттрибут `{{ docs-theme-codeReference }}.surfaceDefaultAccent`.
- Токену c названием `🌕 Surfaces Default/Transparent/surfaceTransparentSecondary` в коде будет соответствовать аттрибут `{{ docs-theme-codeReference }}.surfaceDefaultTransparentSecondary`

>Использовать токены цвета и градиентов необходимо через пространство имен `{{ docs-theme-codeReference }}`.