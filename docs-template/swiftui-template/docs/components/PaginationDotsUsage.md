---
title: PaginationDots
---

Компонент для отображения набора точек пагинации с активным элементом.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `selectedIndex` | `Int` | Индекс активной точки |
| `totalCount` | `Int` | Общее количество точек |
| `visibleCount` | `Int` | Количество видимых точек в окне |
| `appearance` | `PaginationDotsAppearance?` | Параметры внешнего вида компонента |

## Окружение

- `paginationDotsAppearance`: стандартные настройки внешнего вида `PaginationDots`

## Пример использования

```swift
// @sample: SDDSComponentsFixtures/Samples/PaginationDots/SDDSPaginationDots_Simple.swift
```

<!-- @screenshot: SDDSComponentsFixtures.PaginationDots.SDDSPaginationDots_Simple -->

## Стиль PaginationDots

В большинстве случаев подходят готовые сгенерированные стили темы; при необходимости стиль можно собрать вручную из токенов.

<!-- @style-api -->
