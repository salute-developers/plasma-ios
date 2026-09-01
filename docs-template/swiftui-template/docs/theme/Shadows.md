---
title: Токены теней
---

## Структура ShadowToken

Токены теней представлены структурой `ShadowToken`, которая может содержать один или несколько слоев теней. Каждый слой описывается структурой `Layer`:

```swift
public struct ShadowToken {
    public struct Layer {
        public let color: Color
        public let offsetX: CGFloat
        public let offsetY: CGFloat
        public let blurRadius: CGFloat
        public let spreadRadius: CGFloat
    }
    
    public let layers: [Layer]
}
```

### Параметры `Layer`:
- `color: Color` - цвет тени
- `offsetX: CGFloat` - смещение тени по оси X
- `offsetY: CGFloat` - смещение тени по оси Y
- `blurRadius: CGFloat` - радиус размытия тени
- `spreadRadius: CGFloat` - радиус распространения тени (непрямое управление размером тени)

## Применение токенов

### Прямое использование значения
```swift
Text("Hello, Shadow!")
    .padding()
    .background(Color.white)
    .shadow(Shadows.shadowM)
```

>Использовать токены теней необходимо через пространство имен `{{ docs-theme-codeReference }}`.
