# SDDSTextArea

Настраиваемое текстовое поле с поддержкой различных стилей, макетов и конфигураций.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| value | Binding<TextAreaValue> | Значение текстового поля (`single` или `multiple`) |
| title | String | Заголовок текстового поля |
| optionalTitle | String | Дополнительный заголовок (например, для опциональных полей) |
| placeholder | String | Текст placeholder, отображаемый при пустом поле |
| caption | String | Подпись под текстовым полем |
| counter | String | Текст счетчика (например, для отображения количества символов) |
| disabled | Bool | Флаг, указывающий, отключено ли поле |
| readOnly | Bool | Флаг, указывающий, включено ли поле только на режим чтения |
| divider | Bool | Флаг, указывающий, показывать ли линию разделителя |
| heightMode | TextAreaHeightMode | Режим высоты текстового поля (фиксированная или динамическая) |
| layout | TextAreaLayout | Макет текстового поля (`default`, `clear`) |
| accessibility | TextAreaAccessibility | Параметры доступности текстового поля |
| iconActionViewProvider | ViewProvider? | Поставщик правой иконки действия |
| appearance | TextAreaAppearance? | Параметры внешнего вида текстового поля |

## Окружение
- `textAreaAppearance`: Стандартные настройки внешнего вида текстового поля

## Режимы высоты (TextAreaHeightMode)

`TextAreaHeightMode` определяет режим высоты текстового поля:

- `fixed(CGFloat)`: Фиксированная высота
- `dynamic`: Высота автоматически подстраивается под содержимое

## Макеты (TextAreaLayout)

`TextAreaLayout` определяет макет текстового поля:

- `default`: Стандартный макет
- `clear`: Чистый макет без дополнительных элементов

## Примеры использования

### Базовое текстовое поле

```swift
TextArea(
    value: .constant(.single("Value")),
    title: "Title",
    optionalTitle: "optional",
    placeholder: "Placeholder",
    caption: "caption",
    counter: "counter",
    disabled: false,
    readOnly: false,
    dynamicHeight: true,
    appearance: TextArea.l.default.appearance,
    iconActionViewProvider: ViewProvider(iconActionView)
)
```
