---
title: CollapsingNavigationBar
sidebar_label: CollapsingNavigationBar
---

`SDDSCollapsingNavigationBar` — компонент сворачиваемой навигационной панели. Внешний вид задаётся единым `CollapsingNavigationBarAppearance`; кнопка «назад» показывается, когда в appearance задан `backIcon`. При прокрутке контента бар плавно сворачивается и разворачивается.

## Примеры использования

### Главная страница (без кнопки «назад»)

Используйте appearance с `backIcon == nil` (например, пресет Main Page из темы).

```swift
@StateObject private var collapsingState = CollapsingNavigationBarState()

SDDSCollapsingNavigationBar(
    appearance: mainPageAppearance,
    expandedTitle: { Text("Заголовок") },
    expandedDescription: { Text("Описание в развёрнутом состоянии") },
    collapsedTitle: { Text("Заголовок") },
    collapsedDescription: { Text("") },
    expandedTextAlign: .left,
    collapsedTextAlign: .center,
    actionStart: { EmptyView() },
    actionEnd: { EmptyView() },
    state: collapsingState,
    scrollBehavior: .exitUntilCollapsed
) {
    VStack {
        ForEach(0..<50, id: \.self) { i in
            Text("Элемент \(i)")
                .padding()
        }
    }
}
```

### Внутренняя страница с кнопкой «назад» и действиями

Используйте appearance с заданным `backIcon` (например, пресет Internal Page из темы).

```swift
@StateObject private var collapsingState = CollapsingNavigationBarState()

SDDSCollapsingNavigationBar(
    appearance: internalPageAppearance,
    expandedTitle: { Text("Детали") },
    expandedDescription: { Text("Подзаголовок") },
    collapsedTitle: { Text("Детали") },
    collapsedDescription: { Text("") },
    expandedTextAlign: .left,
    collapsedTextAlign: .center,
    actionStart: { EmptyView() },
    actionEnd: {
        Button(action: {}) {
            Image(systemName: "ellipsis")
        }
    },
    state: collapsingState,
    scrollBehavior: .exitUntilCollapsed,
    onBackPressed: { dismiss() }
) {
    Text("Прокручиваемый контент")
}
```

### С фоновым контентом и блоком между баром и скроллом

```swift
SDDSCollapsingNavigationBar(
    appearance: mainPageAppearance,
    expandedTitle: { Text("Настройки") },
    expandedDescription: { Text("Описание") },
    collapsedTitle: { Text("Настройки") },
    collapsedDescription: { Text("") },
    actionStart: { EmptyView() },
    actionEnd: { EmptyView() },
    backgroundContent: { AnyView(LinearGradient(colors: [.blue.opacity(0.3), .clear], startPoint: .top, endPoint: .bottom)) },
    middleContent: { AnyView(Text("Дополнительный блок под баром").padding()) },
    state: collapsingState,
    scrollBehavior: .enterAlways
) {
    List(0..<100, id: \.self) { i in
        Text("Строка \(i)")
    }
}
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `appearance` | `CollapsingNavigationBarAppearance` | Внешний вид бара; кнопка «назад» показывается при `appearance.backIcon != nil` |
| `expandedTitle` | `() -> ExpandedTitle` | Заголовок в развёрнутом состоянии |
| `expandedDescription` | `() -> ExpandedDescription` | Описание в развёрнутом состоянии |
| `collapsedTitle` | `() -> CollapsedTitle` | Заголовок в свёрнутом состоянии |
| `collapsedDescription` | `() -> CollapsedDescription` | Описание в свёрнутом состоянии |
| `expandedTextAlign` | `NavigationBarTextAlign` | Выравнивание текста в развёрнутом состоянии (по умолчанию `.left`) |
| `collapsedTextAlign` | `NavigationBarTextAlign` | Выравнивание текста в свёрнутом состоянии (по умолчанию `.center`) |
| `centerAlignmentStrategy` | `CollapsingNavigationBarCenterAlignmentStrategy` | В сжатом состоянии: `.relative` — центр между Action Start и Action End; `.absolute` — центр по всей ширине edgeStack (по умолчанию `.relative`) |
| `actionStart` | `() -> ActionStart` | Левые действия (leading) |
| `actionEnd` | `() -> ActionEnd` | Правые действия (trailing) |
| `backgroundContent` | `(() -> AnyView)?` | Фоновый контент в развёрнутом состоянии (опционально) |
| `middleContent` | `(() -> AnyView)?` | Блок между баром и прокручиваемым контентом (опционально) |
| `state` | `CollapsingNavigationBarState` | Объект состояния для управления и наблюдения за свёрнутостью |
| `scrollBehavior` | `CollapsingNavigationBarScrollBehavior` | Поведение при скролле |
| `onBackPressed` | `() -> Void` | Обработчик кнопки «назад» (вызывается при нажатии, если задан `appearance.backIcon`) |
| `content` | `() -> Content` | Прокручиваемый контент под баром |

## CollapsingNavigationBarState

`CollapsingNavigationBarState` — наблюдаемый объект состояния. Компонент обновляет его при скролле.

| Свойство | Тип | Описание |
|----------|-----|----------|
| `heightOffsetLimit` | `CGFloat` | Лимит смещения высоты (бар сворачивается до этого значения) |
| `heightOffset` | `CGFloat` | Текущее смещение высоты (между `heightOffsetLimit` и 0) |
| `contentOffset` | `CGFloat` | Накопленное смещение прокрученного контента |
| `collapsedFraction` | `CGFloat` | Доля свёрнутости: 0 — развёрнут, 1 — свёрнут (вычисляемое) |

Инициализация:

```swift
@StateObject private var state = CollapsingNavigationBarState(
    heightOffsetLimit: -.greatestFiniteMagnitude,
    heightOffset: 0,
    contentOffset: 0
)
```

## CollapsingNavigationBarScrollBehavior

Поведение бара при скролле:

- **`.pinned`** — бар закреплён: обновляется только `contentOffset`, высота не меняется
- **`.enterAlways`** — бар сразу сворачивается при скролле вверх и сразу появляется при скролле вниз
- **`.exitUntilCollapsed`** — бар сворачивается при скролле вверх и разворачивается только когда контент прокручен до верха

## NavigationBarTextAlign

Выравнивание заголовка и описания:

- **`.left`** — по левому краю
- **`.center`** — по центру
- **`.right`** — по правому краю

При **`centerAlignmentStrategy == .relative`** текст выравнивается внутри центральной зоны (между левыми и правыми действиями). При **`.absolute`** см. раздел ниже.

## CollapsingNavigationBarCenterAlignmentStrategy

Стратегия выравнивания заголовка и описания в **сжатом** состоянии:

- **`.relative`** (по умолчанию) — Title/Description по центру **между** Action Start и Action End (центральная зона). При разной ширине кнопок центр смещается.
- **`.absolute`** — Title/Description всегда по геометрическому центру edgeStack (по всей ширине), независимо от длины Action 1 / Action 2.

## Окружение

- `collapsingNavigationBarAppearance`: настройки внешнего вида по умолчанию

## CollapsingNavigationBarAppearance

Единый тип внешнего вида:

| Параметр | Тип | Описание |
|----------|-----|----------|
| `backIcon` | `Image?` | Иконка кнопки «назад»; при `nil` кнопка не показывается |
| `backIconColor` | `ColorToken` | Цвет иконки «назад» |
| `actionStartColor` | `ColorToken` | Цвет левого действия |
| `actionEndColor` | `ColorToken` | Цвет правого действия |
| `textColor` | `ColorToken` | Цвет текста |
| `titleColor` | `ColorToken` | Цвет заголовка |
| `descriptionColor` | `ColorToken` | Цвет описания |
| `backgroundColor` | `ColorToken` | Цвет фона бара |
| `actionButtonAppearance` | `ButtonAppearance?` | Стиль кнопок действий (опционально) |
| `textTypography` | `TypographyConfiguration` | Типографика текста |
| `titleTypography` | `TypographyConfiguration` | Типографика заголовка (развёрнутое состояние) |
| `titleTypographyCollapsed` | `TypographyConfiguration` | Типографика заголовка (свёрнутое состояние) |
| `descriptionTypography` | `TypographyConfiguration` | Типографика описания (развёрнутое состояние) |
| `descriptionTypographyCollapsed` | `TypographyConfiguration` | Типографика описания (свёрнутое состояние) |
| `shadow` | `ShadowToken` | Тень панели |
| `size` | `CollapsingNavigationBarSizeConfiguration` | Размеры и отступы |

## CollapsingNavigationBarSizeConfiguration

| Параметр | Тип | Описание |
|----------|-----|----------|
| `backIconMargin` | `CGFloat` | Отступ между кнопкой «назад» и левым действием (используется при `backIcon != nil`) |
| `descriptionPadding` | `CGFloat` | Отступ между заголовком и описанием (развёрнутое состояние) |
| `descriptionPaddingCollapsed` | `CGFloat` | Отступ между заголовком и описанием (свёрнутое состояние) |
| `paddingStart` | `CGFloat` | Отступ слева |
| `paddingEnd` | `CGFloat` | Отступ справа |
| `paddingTop` | `CGFloat` | Отступ сверху |
| `paddingBottom` | `CGFloat` | Отступ снизу |
| `horizontalSpacing` | `CGFloat` | Горизонтальный отступ между элементами |
| `textBlockTopMargin` | `CGFloat` | Отступ сверху для блока заголовка/описания |
| `bottomShape` | `PathDrawer` | Форма нижней границы бара |

## Удобные инициализаторы

Компонент предоставляет перегрузки без части действий:

- Без `actionStart` — передаётся `EmptyView()` слева
- Без `actionEnd` — передаётся `EmptyView()` справа
- Без обоих — только заголовок/описание по центру

## Особенности

- Кнопка «назад» отображается только когда в `appearance` задан `backIcon`
- Состояние свёрнутости доступно через `state.collapsedFraction` для анимаций или кастомной логики
- `middleContent` не прокручивается вместе с контентом — остаётся под свёрнутым баром
- `backgroundContent` отображается только в развёрнутом состоянии под заголовком и описанием
- **centerAlignmentStrategy**: в сжатом состоянии `.relative` — центр между кнопками, `.absolute` — центр по всей ширине edgeStack
