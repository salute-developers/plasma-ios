---
title: Button
---

Компонент кнопки с различными стилями и состояниями.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `title` | `String` | Основной текст кнопки |
| `subtitle` | `String` | Дополнительный текст кнопки |
| `iconAttributes` | `ButtonIconAttributes?` | Атрибуты иконки (опционально) |
| `isDisabled` | `Bool` | Флаг отключенного состояния |
| `isLoading` | `Bool` | Флаг состояния загрузки |
| `spinnerImage` | `Image?` | Изображение для индикатора загрузки |
| `buttonStyle` | `ButtonStyle` | Стиль кнопки (.basic или .icon) |
| `appearance` | `ButtonAppearance?` | Кастомизация внешнего вида |
| `layoutMode` | `ButtonLayoutMode` | Режим компоновки (.wrapContent или .fillWidth) |
| `accessibility` | `ButtonAccessibility` | Параметры доступности |
| `counterViewProvider` | `ViewProvider?` | Провайдер для отображения счетчика |
| `isSelected` | `Bool` | Флаг выбранного состояния |
| `action` | `() -> Void` | Действие при нажатии на кнопку |

## Окружениеå
- `buttonAppearance`: Стандартные настройки внешнего вида кнопок

## Стили кнопки (ButtonStyle)

`ButtonStyle` определяет стили кнопки:

- `basic`: Базовый стиль кнопки
- `icon`: Стиль кнопки в виде иконки

## Режимы макета (ButtonLayoutMode)

`ButtonLayoutMode` определяет различные режимы макета для кнопки:

- `wrapContent`: Кнопка автоматически подстраивает свой размер в зависимости от содержимого
- `fixedWidth`: Кнопка имеет фиксированную ширину с выравниванием содержимого:
  - `.packed`: Центрированное выравнивание
  - `.spaceBetween`: Выравнивание бок о бок

## Примеры использования

### Базовая кнопка с иконкой

```swift
BasicButton(
    title: "Label",
    subtitle: "Value",
    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
    isDisabled: false,
    isLoading: false,
    spinnerImage: Image.image("spinner"),
    appearance: BasicButton.l.accent.appearance,
    layoutMode: .wrapContent,
    action: { print("Button did tap") }
)
```

### Кнопка-ссылка с акцентным стилем

```swift
LinkButton(
    title: "Label",
    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
    isDisabled: false,
    isLoading: false,
    spinnerImage: Image.image("spinner"),
    appearance: LinkButton.l.accent.appearance,
    layoutMode: .wrapContent,
    action: { print("Link did tap") }
)
```

### Кнопка-иконка с акцентным стилем

```swift
IconButton(
    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
    isDisabled: false,
    isLoading: false,
    spinnerImage: Image.image("spinner"),
    appearance: IconButton.l.accent.appearance,
    layoutMode: .fixedWidth(.packed),
    action: { print("Icon did tap") }
)
```

### Круглая кнопка-иконка с акцентным стилем

```swift
IconButton(
    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
    isDisabled: false,
    isLoading: false,
    spinnerImage: Image.image("spinner"),
    appearance: IconButton.l.pilled.accent.appearance,
    layoutMode: .wrapContent,
    action: { print("Rounded Icon did tap") }
) 
