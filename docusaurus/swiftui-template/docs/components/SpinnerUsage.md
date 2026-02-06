---
title: Spinner
---

Компонент для отображения анимированного спиннера загрузки.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `isAnimating` | `Bool` | Флаг анимации вращения спиннера (по умолчанию true) |
| `appearance` | `SpinnerAppearance?` | Параметры внешнего вида спиннера (опционально) |

## Окружение
- `spinnerAppearance`: Стандартные настройки внешнего вида спиннера
- `colorScheme`: Цветовая схема (light/dark)

## Особенности
- Автоматически применяет градиент от startColor до endColor
- Поддерживает настраиваемый угол отрисовки (angle)
- Использует закругленные концы линии (strokeCap)
- Анимированное вращение вокруг своей оси
- Настраиваемые размеры и отступы
- Ширина линии рассчитывается пропорционально размеру спиннера

## Примеры использования

### Базовый спиннер

```swift
// @sample: SDDSComponentsFixtures/Samples/Spinner/SDDSSpinner_Simple.swift
```

### Спинер с кастомными цветами

```swift
SDDSSpinner(
    isAnimating: true,
    appearance: Spinner.l.accent.appearance
)
```

### Остановленный спиннер

```swift
SDDSSpinner(
    isAnimating: false,
    appearance: Spinner.s.info.appearance
)
```

### Спинер с environment appearance

```swift
SDDSSpinner(isAnimating: true)
```

## Внешний вид (SpinnerAppearance)

### Параметры
- `backgroundColor`: Цвет фона спиннера
- `angle`: Угол отрисовки дуги (в градусах, 360 = полный круг)
- `strokeCap`: Стиль концов линии (.round, .butt, .square)
- `startColor`: Начальный цвет градиента
- `endColor`: Конечный цвет градиента
- `size`: Конфигурация размеров

### Размеры (SpinnerSizeConfiguration)
- `size`: Размер спиннера в пикселях
- `padding`: Отступ от спиннера до границ контейнера

## Расчет ширины линии

Ширина линии рассчитывается по формуле:
```
lineThickness = minSpinnerThickness * (size / minSpinnerSize)
```

Где:
- `minSpinnerThickness = 1.5`
- `minSpinnerSize = 16`

Это обеспечивает пропорциональную толщину линии относительно размера спиннера.

## Анимация

Спиннер автоматически анимируется при `isAnimating = true`:
- Плавное вращение на 360 градусов
- Линейная анимация с продолжительностью 1 секунда
- Бесконечное повторение без реверса
