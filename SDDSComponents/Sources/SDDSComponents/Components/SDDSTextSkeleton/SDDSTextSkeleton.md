# SDDSTextSkeleton

Компонент для отображения текстового скелетона с несколькими строками, имитирующими загружаемый текст.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | SkeletonAppearance? | Параметры внешнего вида скелетона (опционально) |
| lineCount | Int | Количество строк текста (по умолчанию 3) |
| textTypography | TypographyToken | Типографика для определения высоты строк |
| lineWidthProvider | SkeletonLineWidthProvider | Провайдер ширины строк |

## Окружение

- `skeletonAppearance`: Стандартные настройки внешнего вида скелетона

## Провайдеры ширины строк (SkeletonLineWidthProvider)

`SkeletonLineWidthProvider` определяет, как рассчитывается ширина каждой строки:

### FullWidthLineProvider
Все строки имеют полную ширину (100%).

### VariedWidthLineProvider
- Последняя строка: 50% ± 15% ширины
- Остальные строки: 90% ± 5% ширины

## Примеры использования

### Базовый текстовый скелетон
```swift
SDDSTextSkeleton(
    appearance: SkeletonAppearance(
        shape: CornerRadiusDrawer(cornerRadius: 4),
        gradient: .skeletonGradient,
        duration: 2000
    ),
    lineCount: 3,
    textTypography: .semibold14,
    lineWidthProvider: FullWidthLineProvider()
)
```

### Скелетон с переменной шириной строк
```swift
SDDSTextSkeleton(
    appearance: SkeletonAppearance(
        shape: CornerRadiusDrawer(cornerRadius: 4),
        gradient: .skeletonGradient,
        duration: 1500
    ),
    lineCount: 4,
    textTypography: .regular16,
    lineWidthProvider: VariedWidthLineProvider()
)
```

### Скелетон с настройками по умолчанию
```swift
SDDSTextSkeleton()
    .frame(maxWidth: .infinity)
``` 