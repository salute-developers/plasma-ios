---
title: RectSkeleton
sidebar_label: RectSkeleton
---

`SDDSRectSkeleton` — компонент для отображения прямоугольного скелетона с анимированным градиентом.

## Примеры использования

### Базовое использование

```swift
SDDSRectSkeleton()
```

### Скелетон с кастомными размерами

```swift
SDDSRectSkeleton()
    .frame(width: 200, height: 100)
```

### Скелетон с кастомным внешним видом

```swift
SDDSRectSkeleton(
    appearance: SkeletonAppearance(
        shape: CornerRadiusDrawer(cornerRadius: 8),
        gradient: .skeletonGradient,
        duration: 2000
    )
)
```

### Скелетон с закругленными углами

```swift
SDDSRectSkeleton(
    appearance: SkeletonAppearance(
        shape: CornerRadiusDrawer(cornerRadius: 12)
    )
)
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `appearance` | `SkeletonAppearance?` | Параметры внешнего вида скелетона |

## Стилизация

Компонент использует токены из темы для цветов и размеров:

- `ColorToken.skeletonPrimary` — основной цвет скелетона
- `ColorToken.skeletonSecondary` — вторичный цвет скелетона
- `SpacingToken.skeletonPadding` — отступы скелетона

## Примеры в интерфейсе

### Карточка с скелетоном

```swift
VStack(alignment: .leading, spacing: 12) {
    RectSkeleton()
        .frame(height: 120)
    
    VStack(alignment: .leading, spacing: 8) {
        RectSkeleton()
            .frame(height: 16)
        
        RectSkeleton()
            .frame(width: 150, height: 14)
    }
}
.padding()
```

### Список с скелетонами

```swift
LazyVStack(spacing: 16) {
    ForEach(0..<5) { _ in
        HStack(spacing: 12) {
            RectSkeleton()
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                RectSkeleton()
                    .frame(height: 16)
                
                RectSkeleton()
                    .frame(width: 100, height: 14)
            }
            
            Spacer()
        }
    }
}
.padding()
```
