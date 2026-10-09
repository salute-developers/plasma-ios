---
title: NavigationBar
sidebar_label: NavigationBar
---

`SDDSNavigationBar` — компонент навигационной панели с поддержкой двух типов страниц: главная страница (MainPage) и внутренняя страница с кнопкой "назад" (InternalPage).

## Примеры использования

### Main Page - базовое использование

```swift
// @sample: SDDSComponentsFixtures/Samples/NavigationBar/SDDSNavigationBar_Simple.swift
```

### Internal Page с кнопкой "назад"

```swift
SDDSNavigationBar(
    type: .internalPage(appearance: internalPageAppearance),
    title: "Детали",
    textPlacement: .inline,
    textAlign: .left,
    contentPlacement: .inline,
    backAction: {
        navigationController.popViewController()
    },
    actionEnd: {
        Button(action: {}) {
            Image(systemName: "ellipsis")
        }
    }
) {
    Text("Дополнительный контент")
}
```

### NavigationBar с иконкой и контентом внизу

```swift
SDDSNavigationBar(
    type: .mainPage(appearance: mainPageAppearance),
    title: "Настройки",
    icon: Image(systemName: "gear"),
    textPlacement: .bottom,
    textAlign: .center,
    contentPlacement: .bottom,
    actionStart: {
        Button(action: {}) {
            Text("Action 1")
        }
    },
    actionEnd: {
        Button(action: {}) {
            Text("Action 2")
        }
    }
) {
    VStack {
        Text("Дополнительная информация")
        Text("Описание страницы")
    }
}
```

### NavigationBar без actions

```swift
SDDSNavigationBar(
    type: .internalPage(appearance: internalPageAppearance),
    title: "Просмотр",
    textPlacement: .inline,
    textAlign: .center,
    contentPlacement: .bottom,
    backAction: {
        dismiss()
    }
) {
    Text("Основной контент")
}
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `type` | `NavigationBarType` | Тип навигационной панели (`.mainPage` или `.internalPage`) |
| `title` | `String` | Заголовок навигационной панели |
| `icon` | `Image?` | Опциональная иконка рядом с заголовком |
| `textPlacement` | `NavigationBarTextPlacement` | Размещение текста (`.bottom` или `.inline`) |
| `textAlign` | `NavigationBarTextAlign` | Выравнивание текста (`.center`, `.left`, `.right`) |
| `contentPlacement` | `NavigationBarContentPlacement` | Размещение контента (`.bottom` или `.inline`) |
| `backAction` | `(() -> Void)?` | Действие при нажатии на кнопку "назад" (только для InternalPage) |
| `actionStart` | `() -> ActionStart` | Левый action (closure, возвращающий View) |
| `actionEnd` | `() -> ActionEnd` | Правый action (closure, возвращающий View) |
| `content` | `() -> Content` | Дополнительный контент (closure, возвращающий View) |

## NavigationBarType

Тип навигационной панели определяет её внешний вид и функциональность:

- **`.mainPage(appearance: NavigationBarAppearance)`** — главная страница приложения без кнопки "назад"
- **`.internalPage(appearance: NavigationBarAppearance)`** — внутренняя страница с кнопкой "назад" слева

## NavigationBarTextPlacement

Определяет размещение заголовка:

- **`.bottom`** — заголовок размещается под actions
- **`.inline`** — заголовок размещается на одной линии с actions

## NavigationBarTextAlign

Определяет выравнивание заголовка (работает только с `.inline` placement):

- **`.center`** — заголовок по центру между actions
- **`.left`** — заголовок слева после left action
- **`.right`** — заголовок справа перед right action

## NavigationBarContentPlacement

Определяет размещение дополнительного контента:

- **`.bottom`** — контент размещается под навигационной панелью
- **`.inline`** — контент размещается справа от заголовка

## Окружение

- `navigationBarAppearance`: Стандартные настройки внешнего вида панели

## NavigationBarAppearance

Внешний вид общий для обоих типов панели. `backIcon` и `backIconColor` использует
только внутренняя страница — у главной кнопки «назад» нет.

| Параметр | Тип | Описание |
|----------|-----|----------|
| `backIconColor` | `ColorToken` | Цвет иконки кнопки "назад" (только `.internalPage`) |
| `backIcon` | `Image?` | Иконка кнопки "назад" (только `.internalPage`) |
| `actionStartColor` | `ColorToken` | Цвет левого action |
| `actionEndColor` | `ColorToken` | Цвет правого action |
| `textColor` | `ColorToken` | Цвет заголовка |
| `backgroundColor` | `ColorToken` | Цвет фона |
| `textTypography` | `TypographyConfiguration` | Типографика заголовка |
| `shadow` | `ShadowToken` | Тень панели |
| `size` | `NavigationBarSizeConfiguration` | Размеры и отступы |

## Size Configuration

### NavigationBarSizeConfiguration

| Параметр | Тип | Описание |
|----------|-----|----------|
| `backIconMargin` | `CGFloat` | Отступ между кнопкой "назад" и left action (только `.internalPage`) |
| `paddingStart` | `CGFloat` | Отступ слева |
| `paddingEnd` | `CGFloat` | Отступ справа |
| `paddingTop` | `CGFloat` | Отступ сверху |
| `paddingBottom` | `CGFloat` | Отступ снизу |
| `horizontalSpacing` | `CGFloat` | Расстояние между actions когда они рядом |
| `textBlockTopMargin` | `CGFloat` | Отступ сверху для блока текста |
| `bottomShape` | `PathDrawer` | Форма нижней границы |

## Особенности

- Кнопка "назад" автоматически отображается только для `.internalPage` типа
- Кнопка "назад" всегда находится слева от left action
- При `contentPlacement = .inline` контент располагается справа от заголовка
- При `textAlign` = `.left` или `.right` заголовок работает только с `textPlacement = .inline`
- `horizontalSpacing` применяется между actions когда они находятся рядом (слева или справа)
- Типографика заголовка автоматически подбирается в зависимости от size configuration

