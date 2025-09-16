---
title: Токены типографики
---

## Структура TypographyToken

Токены типографики представлены структурой `TypographyToken`, которая содержит:
- `fontName: String` - название шрифта
- `weight: Weight` - вес шрифта (ultraLight, thin, light, regular, medium, semibold, bold, heavy, black, normal)
- `style: Style` - стиль шрифта (normal, italic)
- `size: CGFloat` - размер шрифта
- `lineHeight: CGFloat` - высота строки
- `kerning: CGFloat` - межбуквенное расстояние

```swift
public struct TypographyToken {
    public enum Weight: String {
        case ultraLight, thin, light, regular, medium
        case semibold, bold, heavy, black, normal
    }
    
    public enum Style: String {
        case normal, italic
    }
    
    public let fontName: String
    public let weight: Weight
    public let style: Style
    public let size: CGFloat
    public let lineHeight: CGFloat
    public let kerning: CGFloat
}
```

## AdaptiveTypographyToken

Для адаптивной типографики используется `AdaptiveTypographyToken`, который содержит три варианта для разных размеров экрана:
- `small: TypographyToken` - для маленьких экранов
- `medium: TypographyToken` - для средних экранов  
- `large: TypographyToken` - для больших экранов

## TypographyConfiguration

`TypographyConfiguration` - это протокол для настройки типографики в компонентах. Он позволяет адаптивно выбирать токен типографики в зависимости от размера компонента:

```swift
public protocol GeneralTypographyConfiguration {
    associatedtype Size = SizeConfiguration
    func typography(with size: Size) -> TypographyToken?
}
```

### Использование в компонентах

В компонентах типографика настраивается через `TypographyConfiguration`:

```swift
// В appearance компонента
let titleTypography: TypographyConfiguration
let subtitleTypography: TypographyConfiguration

// Получение токена для конкретного размера
let typography = appearance.titleTypography.typography(with: appearance.size)
```

## Применение токенов

### Прямое использование значения
```swift
Text("Hello")
    .typography(Typographies.bodyLBold.token)
```

```swift
Text("Hello")
    .font(.custom(Typographies.bodyLBold.token.fontName, 
                  size: Typographies.bodyLBold.token.size))
    .fontWeight(Typographies.bodyLBold.token.weight)
```

### Использование через TypographyConfiguration

В компонентах типографика часто настраивается через `TypographyConfiguration`:

```swift
let typography = appearance.titleTypography.typography(with: appearance.size)
Text("Title")
    .typography(typography)
```

`TypographyConfiguration` позволяет адаптивно выбирать токен типографики в зависимости от размера компонента:

```swift
// Получение токена для конкретного размера
if let typography = appearance.titleTypography.typography(with: appearance.size) {
    Text("Title")
        .typography(typography)
}
```

## Структура названия токена типографики
```
Группа + Подгруппа + Уникальное название токена
```

Токены типографики делятся на группы: `Display`, `Body`, `Header`, `Text`.
И на подгруппы: `Large Screens`, `Medium Screens`, `Small Screens`.

Figma токену с названием `Body/BodyL B` будет соответствовать в коде аттрибут `{{ docs-theme-codeReference }}.bodyLBold`.

>Важно отметить, что выбор подгруппы `Large Screens`, `Medium Screens`, `Small Screens` происходит автоматически в зависимости от размера экрана устройства.
