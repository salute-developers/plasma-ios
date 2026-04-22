---
title: Carousel
---

Горизонтальная карусель с навигационными кнопками и индикатором из точек.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `selection` | `Binding<Int>` | Индекс текущей страницы |
| `pageCount` | `Int` | Количество страниц |
| `hasIndicator` | `Bool` | Показывать индикатор (по умолчанию `true`) |
| `hasControls` | `Bool` | Показывать кнопки prev/next (по умолчанию `true`) |
| `indicatorVisibleCount` | `Int` | Макс. число видимых точек (по умолчанию как у `SDDSPaginationDots`) |
| `userScrollEnabled` | `Bool` | Разрешить свайп между страницами; если `false`, навигация только кнопками и `selection` |
| `appearance` | `CarouselAppearance?` | Внешний вид; `nil` берётся из окружения |

Расположение кнопок (`inner` / `outer`), отступы и стили кнок / точек задаются токенами темы в `CarouselAppearance.size` и вложенных `indicatorAppearance` / `nextButtonAppearance` / `prevButtonIcon` и т.д.

## Окружение

- `carouselAppearance`: значения по умолчанию для `SDDSCarousel`, если `appearance` не передан

## Пример использования

```swift
// @sample: SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Samples/Carousel/CarouselSamples.swift
```
