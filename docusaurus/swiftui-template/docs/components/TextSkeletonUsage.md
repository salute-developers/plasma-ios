---
title: TextSkeleton
sidebar_label: TextSkeleton
---

`SDDSTextSkeleton` — компонент для отображения текстового скелетона с несколькими строками.

## Примеры использования

### Базовое использование

```swift
// @sample: SDDSComponentsFixtures/Samples/TextSkeleton/SDDSTextSkeleton_Simple.swift
```

### Скелетон с заданным количеством строк

```swift
SDDSTextSkeleton(lineCount: 5)
```

### Скелетон с кастомной типографикой

```swift
SDDSTextSkeleton(
    lineCount: 3,
    textTypography: {{ docs-theme-codeReference }}.TypographyToken.bodyLBold.token
)
```

### Скелетон с кастомным провайдером ширины строк

```swift
SDDSTextSkeleton(
    lineCount: 4,
    lineWidthProvider: VariedWidthLineProvider()
)
```

### Скелетон с кастомным внешним видом

```swift
SDDSTextSkeleton(
    appearance: SkeletonAppearance(
        shape: CornerRadiusDrawer(cornerRadius: 4),
        gradient: .skeletonGradient,
        duration: 2000
    ),
    lineCount: 3,
    textTypography: {{ docs-theme-codeReference }}.TypographyToken.bodyM.token,
    lineWidthProvider: FullWidthLineProvider(),
    lineSpacing: 2.0
)
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `appearance` | `SkeletonAppearance?` | Параметры внешнего вида скелетона |
| `lineCount` | `Int` | Количество строк текста (по умолчанию 3) |
| `textTypography` | `TypographyToken` | Типографика для определения высоты строк |
| `lineWidthProvider` | `SkeletonLineWidthProvider` | Провайдер ширины строк |
| `lineSpacing` | `CGFloat` | Расстояние между строками |

## Стилизация

Компонент использует токены из темы:

- `ColorToken.skeletonPrimary` — основной цвет скелетона
- `ColorToken.skeletonSecondary` — вторичный цвет скелетона
- `TypographyToken.bodyM` — размер текста по умолчанию

## Примеры в интерфейсе

### Заголовок с скелетоном

```swift
VStack(alignment: .leading, spacing: 8) {
    if isLoading {
        TextSkeleton(width: 200, height: 24)
    } else {
        Text("Заголовок")
            .typography({{ docs-theme-codeReference }}.TypographyToken.headlineL.token)
    }
}
```

### Описание с скелетоном

```swift
VStack(alignment: .leading, spacing: 4) {
    if isLoading {
        VStack(alignment: .leading, spacing: 4) {
            TextSkeleton(width: 300, height: 16)
            TextSkeleton(width: 250, height: 16)
            TextSkeleton(width: 180, height: 16)
        }
    } else {
        Text("Описание товара или услуги")
            .typography({{ docs-theme-codeReference }}.TypographyToken.bodyM.token)
    }
}
```

### Список с текстовыми скелетонами

```swift
VStack(alignment: .leading, spacing: 12) {
    ForEach(0..<3) { index in
        HStack {
            TextSkeleton(width: 20, height: 16)
            TextSkeleton(width: 120, height: 16)
            Spacer()
        }
    }
}
```

### Карточка с текстовыми скелетонами

```swift
VStack(alignment: .leading, spacing: 12) {
    TextSkeleton(width: 150, height: 20)
    
    TextSkeleton(width: 200, height: 16)
    
    HStack {
        TextSkeleton(width: 80, height: 14)
        Spacer()
        TextSkeleton(width: 60, height: 14)
    }
}
.padding()
```
