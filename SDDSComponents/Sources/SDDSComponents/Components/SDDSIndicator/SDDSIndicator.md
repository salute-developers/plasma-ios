# SDDSIndicator

Компонент для отображения индикатора, который может использоваться для обозначения обязательных полей или других важных элементов интерфейса.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | IndicatorAppearance? | Параметры внешнего вида индикатора (опционально) |

## Окружение
- `indicatorAppearance`: Стандартные настройки внешнего вида индикатора

## Пример использования

```swift
// Базовый индикатор
SDDSIndicator(
    appearance: Indicator.m.accent.appearance
)
```
