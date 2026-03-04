---
title: Toolbar
sidebar_label: Toolbar
---

`SDDSToolbar` — компонент для группировки контента по слотам с поддержкой divider и ориентации.

## Описание

Компонент повторяет поведение Android `ToolBar`:

- количество слотов задается через `slotsAmount`;
- контент передается по слотам через `slots`;
- divider отображается только между слотами;
- ориентация берется из `appearance.size.orientation`.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `slots` | `[ToolbarSlotData]` | Массив данных слотов с контентом |
| `slotsAmount` | `Int` | Количество слотов в Toolbar |
| `hasDivider` | `Bool` | Показывать divider между слотами |
| `appearance` | `ToolbarAppearance?` | Настройки внешнего вида |

## ToolbarSlotData

| Поле | Тип | Описание |
|------|-----|----------|
| `id` | `UUID` | Идентификатор слота |
| `views` | `[AnyView]` | Массив элементов, размещаемых внутри слота |

## ToolbarAppearance

| Параметр | Тип | Описание |
|----------|-----|----------|
| `backgroundColor` | `ColorToken` | Цвет фона Toolbar |
| `shadow` | `ShadowToken` | Тень контейнера |
| `dividerAppearance` | `DividerAppearance?` | Стиль divider между слотами |
| `size` | `ToolbarSizeConfiguration` | Размеры и отступы Toolbar |

## ToolbarSizeConfiguration

| Параметр | Тип | Описание |
|----------|-----|----------|
| `paddingStart` | `CGFloat` | Внешний отступ слева |
| `paddingEnd` | `CGFloat` | Внешний отступ справа |
| `paddingTop` | `CGFloat` | Внешний отступ сверху |
| `paddingBottom` | `CGFloat` | Внешний отступ снизу |
| `shape` | `PathDrawer` | Форма контейнера |
| `slotPadding` | `CGFloat` | Отступ между слотами (по Android-логике first/middle/last) |
| `dividerMargin` | `CGFloat` | Отступ divider от краев контейнера |
| `orientation` | `TabsOrientation` | Ориентация (`horizontal` / `vertical`) |

## Примеры использования

### Базовый Toolbar

```swift
let slots: [ToolbarSlotData] = [
    ToolbarSlotData(views: [
        AnyView(IconButton(iconAttributes: .init(image: Asset.starFill36.image, alignment: .leading), action: {})),
        AnyView(IconButton(iconAttributes: .init(image: Asset.starFill36.image, alignment: .leading), action: {}))
    ]),
    ToolbarSlotData(views: [
        AnyView(BasicButton(title: "Label", subtitle: "", action: {}))
    ]),
    ToolbarSlotData(views: [
        AnyView(IconButton(iconAttributes: .init(image: Asset.starFill36.image, alignment: .leading), action: {})),
        AnyView(IconButton(iconAttributes: .init(image: Asset.starFill36.image, alignment: .leading), action: {}))
    ])
]

SDDSToolbar(
    slots: slots,
    slotsAmount: 3,
    hasDivider: true,
    appearance: ToolbarHorizontal.l.appearance
)
```

### Вертикальный Toolbar

```swift
SDDSToolbar(
    slots: slots,
    slotsAmount: 3,
    hasDivider: true,
    appearance: ToolbarVertical.m.appearance
)
```

### Изменение количества слотов

```swift
@State private var slotsAmount = 3
@State private var hasDivider = true

SDDSToolbar(
    slots: slots,
    slotsAmount: slotsAmount,
    hasDivider: hasDivider,
    appearance: ToolbarHorizontal.s.appearance
)
```

## Особенности layout-логики

- `slotsAmount = 0` — Toolbar без слотов и divider.
- `slotsAmount = 1` — один слот без divider.
- `slotsAmount > 1 && hasDivider = true` — divider только между слотами.
- В `horizontal` режиме между слотами рисуются вертикальные divider.
- В `vertical` режиме между слотами рисуются горизонтальные divider.
