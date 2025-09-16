---
title: Токены скруглений
---

## Структура ShapeToken

Токены скруглений представлены структурой `ShapeToken`, которая содержит:
- `cornerRadius: CGFloat` - радиус скругления
- `kind: Kind` - тип формы (в настоящее время поддерживается только `.round`)

```swift
public struct ShapeToken {
    public enum Kind: String {
        case round
    }
    
    public let cornerRadius: CGFloat
    public let kind: Kind
}
```

## Применение токенов

### Прямое использование значения
```swift
Rectangle()
    .shape(Shapes.shapeRoundM)
```

```swift
Rectangle()
    .shape(pathDrawer: Shapes.shapeRoundM.pathDrawer)
```

```swift
Rectangle()
    .clipShape(RoundedRectangle(cornerRadius: Shapes.shapeRoundM.cornerRadius))
```

## Структура именования

Все токены сгруппированы по размеру скругления: Xxs, Xs, S, M, L, Xl, Xxl и Rounded. Название токена имеет следующую структуру:
```
CornerRadius/cR<название размера>
```

Также доступны вычисляемые токены скруглений:
```
CornerRadius/calc:[cR<название размера> - 2]
```

Пример: токену `CornerRadius/cRm` соответствует атрибут `{{ docs-theme-codeReference }}.shapeRoundM`.

Пример: `CornerRadius/calc:[cRl - 2]` соответствует вызову `{{ docs-theme-codeReference }}.shapeRoundL` с кастомным радиусом.

>Большинство компонентов из `SDDSComponents` также поддерживают установку свойства `shape` через стили.
