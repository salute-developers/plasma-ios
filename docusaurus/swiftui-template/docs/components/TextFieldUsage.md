---
title: TextField
---

Настраиваемое текстовое поле с поддержкой различных стилей, макетов и конфигураций.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `value` | `Binding<TextFieldValue>` | Значение текстового поля (`single` или `multiple`) |
| `title` | `String` | Заголовок текстового поля |
| `optionalTitle` | `String` | Дополнительный заголовок (например, для опциональных полей) |
| `placeholder` | `String` | Текст placeholder, отображаемый при пустом поле |
| `caption` | `String` | Подпись под текстовым полем |
| `textBefore` | `String` | Префикс перед текстом или плейсхолдером |
| `textAfter` | `String` | Суффикс после текста или плейсхолдера |
| `disabled` | `Bool` | Флаг, указывающий, отключено ли поле |
| `readOnly` | `Bool` | Флаг, указывающий, включено ли поле только на режим чтения |
| `divider` | `Bool` | Флаг, указывающий, показывать ли линию разделителя |
| `layout` | `TextFieldLayout` | Макет текстового поля |
| `accessibility` | `TextFieldAccessibility` | Параметры доступности |
| `iconViewProvider` | `ViewProvider?` | Поставщик левой иконки |
| `iconActionViewProvider` | `ViewProvider?` | Поставщик правой иконки действия |
| `appearance` | `TextFieldAppearance?` | Параметры внешнего вида текстового поля |

## Окружение
- `textFieldAppearance`: Стандартные настройки внешнего вида текстового поля

## Значения поля (TextFieldValue)

`TextFieldValue` определяет тип значения текстового поля:

- `single(String)`: Одиночное текстовое значение
- `multiple(String, [ChipData])`: Множественное значение с чипами

## Макеты (TextFieldLayout)

`TextFieldLayout` определяет макет текстового поля:

- `default`: Стандартный макет
- `clear`: Чистый макет без дополнительных элементов

## Примеры использования

### Базовое текстовое поле

```swift
@State private var value = TextFieldValue.single("")

SDDSTextField(
    value: $value,
    title: "Title",
    optionalTitle: "",
    placeholder: "Enter the text",
    caption: "Caption",
    appearance: TextField.m.default.appearance
)
``` 
