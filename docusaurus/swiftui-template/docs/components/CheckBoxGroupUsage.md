---
title: CheckBoxGroup
---

Компонент для отображения группы связанных чекбоксов.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `behaviour` | `CheckboxGroupBehaviour` | Поведение группы чекбоксов |
| `appearance` | `CheckboxGroupAppearance?` | Параметры внешнего вида группы чекбоксов (опционально) |

## Окружение
- `checkboxGroupAppearance`: Стандартные настройки внешнего вида группы чекбоксов

## Примеры использования

### Иерархическая группа чекбоксов

```swift
let parentData = CheckboxData(
    state: .constant(.deselected),
    title: "Parent Label",
    subtitle: "Parent Description",
    isEnabled: true,
    appearance: Checkbox.m.default.appearance,
    accessibility: SelectionControlAccessibility()
)

let childData = (0..<5).map { index in
    CheckboxData(
        state: .constant(.deselected),
        title: "Label \(index + 1)",
        subtitle: "Description \(index + 1)",
        isEnabled: true,
        appearance: Checkbox.m.default.appearance,
        accessibility: SelectionControlAccessibility()
    )
}

SDDSCheckboxGroup(
    behaviour: .hierarchical(parent: parentData, child: childData),
    size: SDDSCheckboxGroupSize.large,
    appearance: CheckboxGroup.m.appearance
)
```
