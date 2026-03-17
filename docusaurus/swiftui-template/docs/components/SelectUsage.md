---
title: Select
---

Компонент выбора значения из выпадающего списка с поддержкой режимов `single` и `multiple`, а также триггера в виде `TextField` или `Button`.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `triggerStyle` | `SelectTriggerStyle` | Визуальный тип триггера (`.textField` или `.button`) |
| `text` | `String` | Текст выбранного значения (обычно для `single`) |
| `chips` | `[ChipData]` | Выбранные значения в виде чипов (обычно для `multiple`) |
| `title` | `String` | Заголовок триггера |
| `optionalTitle` | `String` | Дополнительный заголовок |
| `placeholder` | `String` | Placeholder, если выбор пустой |
| `caption` | `String` | Подпись под триггером |
| `textBefore` | `String` | Префикс текста |
| `textAfter` | `String` | Суффикс текста |
| `disabled` | `Bool` | Полностью отключает компонент |
| `readOnly` | `Bool` | Режим только чтения |
| `appearance` | `SelectAppearance?` | Кастомный внешний вид |
| `isDropdownPresented` | `Binding<Bool>` | Состояние открытия/закрытия dropdown |
| `options` | `[SelectOption]` | Элементы списка |
| `selectionMode` | `SelectSelectionMode?` | Режим выбора (`single`/`multiple`) |
| `closeOnSingleSelection` | `Bool` | Закрывать ли dropdown после выбора в `single` |
| `isLoading` | `Bool` | Показывает контент загрузки |
| `shouldShowEmptyState` | `Bool` | Показывает empty state при пустом списке |
| `placementMode` | `PopoverPlacementMode` | Режим позиционирования dropdown |
| `onOptionTap` | `((Int) -> Void)?` | Callback выбора элемента по индексу |
| `headerContent` | `() -> HeaderContent` | Слот для заголовка списка |
| `footerContent` | `() -> FooterContent` | Слот для футера списка |
| `loaderContent` | `() -> LoaderContent` | Слот для лоадера |
| `emptyStateContent` | `() -> EmptyStateContent` | Слот для empty state |

## Дополнительно

- `SelectOption` описывает элемент списка и хранит `id`, `title`, `subtitle`, `isSelected`, `isEnabled`.
- Для внешнего управления состоянием открытия можно использовать `SDDSSelectState`.
- В режиме `multiple` для `button` длинный текст выбранных значений обрезается с `...`, сохраняя фиксированную ширину кнопки.

## Примеры использования

### Single с TextField trigger

```swift
// @sample: SDDSComponentsFixtures/Samples/Select/SDDSSelect_SingleTextField.swift
```

### Multiple с Button trigger

```swift
// @sample: SDDSComponentsFixtures/Samples/Select/SDDSSelect_MultipleButton.swift
```
