# SDDSRectSkeleton

Компонент для отображения прямоугольного скелетона с анимированным градиентом, используемый для индикации загрузки контента.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | SkeletonAppearance? | Параметры внешнего вида скелетона (опционально) |

## Окружение

- `skeletonAppearance`: Стандартные настройки внешнего вида скелетона

## Параметры внешнего вида (SkeletonAppearance)

`SkeletonAppearance` определяет параметры внешнего вида скелетона:

- `shape`: Форма скелетона (PathDrawer)
- `gradient`: Градиент для анимации
- `size`: Конфигурация размеров скелетона
- `duration`: Длительность анимации в миллисекундах

## Конфигурация размеров (SkeletonSizeConfiguration)

`SkeletonSizeConfiguration` определяет размеры скелетона:

- Протокол для настройки размеров скелетона
- `ZeroSkeletonSizeConfiguration`: Конфигурация с нулевыми значениями

## Примеры использования

### Базовый прямоугольный скелетон
```swift
SDDSRectSkeleton(
    appearance: SkeletonAppearance(
        shape: CornerRadiusDrawer(cornerRadius: 8),
        gradient: .skeletonGradient,
        duration: 2000
    )
)
.frame(width: 200, height: 100)
```

### Скелетон с кастомной формой
```swift
SDDSRectSkeleton(
    appearance: SkeletonAppearance(
        shape: CircleDrawer(),
        gradient: .skeletonGradient,
        size: ZeroSkeletonSizeConfiguration(),
        duration: 1500
    )
)
.frame(width: 50, height: 50)
```

### Скелетон с настройками по умолчанию
```swift
SDDSRectSkeleton()
    .frame(width: 300, height: 20)
``` 