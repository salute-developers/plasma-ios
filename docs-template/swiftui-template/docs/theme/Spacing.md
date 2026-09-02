---
title: Токены отступов
---

## Структура SpacingToken

Токены отступов представлены структурой `SpacingToken`, которая содержит одно значение отступа:

```swift
public struct SpacingToken {
    public let value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
}
```

### Параметры:
- `value: CGFloat` - значение отступа в пунктах

## Применение токенов

### Прямое использование значения
```swift
VStack(spacing: Spacing.spacingM.value) {
    Text("Item 1")
    Text("Item 2")
}
```

>Использовать токены отступов необходимо через пространство имен `{{ docs-theme-codeReference }}`.
