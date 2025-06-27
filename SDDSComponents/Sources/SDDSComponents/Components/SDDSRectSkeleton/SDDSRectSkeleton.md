# SDDSRectSkeleton

Компонент для отображения прямоугольного скелетона с анимированным градиентом, используемый для индикации загрузки контента.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | SkeletonAppearance? | Параметры внешнего вида скелетона (опционально) |

## Окружение

- `skeletonAppearance`: Стандартные настройки внешнего вида скелетона

## Направление анимации

Компонент автоматически адаптируется к направлению макета:
- **LTR (слева направо)**: анимация идет слева направо
- **RTL (справа налево)**: анимация идет справа налево

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

### Скелетон с кастомными настройками
```swift
SDDSRectSkeleton(
    appearance: SkeletonAppearance(
        shape: CornerRadiusDrawer(cornerRadius: 4),
        gradient: .skeletonGradient,
        duration: 1500
    )
)
.frame(width: 150, height: 80)
```

### Использование с окружением
```swift
.environment(\.skeletonAppearance, SkeletonAppearance(
    shape: CornerRadiusDrawer(cornerRadius: 6),
    gradient: .skeletonGradient,
    duration: 1800
))

SDDSRectSkeleton()
    .frame(width: 180, height: 60)
``` 