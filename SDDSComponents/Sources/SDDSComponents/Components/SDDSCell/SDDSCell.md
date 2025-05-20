# SDDSCell

Компонент для отображения строки с различными типами контента и возможностью настройки выравнивания.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | CellAppearance? | Параметры внешнего вида ячейки (опционально) |
| alignment | CellContentAlignment | Выравнивание контента (top/center/bottom) |
| label | String | Текст метки |
| title | String | Основной текст |
| subtitle | String | Дополнительный текст |
| disclosureEnabled | Bool | Включить отображение disclosure |
| disclosureImage | Image? | Изображение для disclosure |
| disclosureText | String | Текст для disclosure |
| leftContent | ViewBuilder | Контент слева |
| rightContent | ViewBuilder | Контент справа |

## Окружение
- `cellAppearance`: Стандартные настройки внешнего вида ячейки

## Выравнивание контента (CellContentAlignment)

`CellContentAlignment` определяет возможные варианты выравнивания контента в ячейке:

- `top`: Контент выравнивается по верхней границе ячейки
- `center`: Контент выравнивается по центру ячейки
- `bottom`: Контент выравнивается по нижней границе ячейки

## Примеры использования

### Базовая ячейка

```swift
SDDSCell(
    appearance: Cell.l.appearance,
    alignment: .center,
    label: "label",
    title: "title",
    subtitle: "subtitle",
    disclosureEnabled: true,
    disclosureImage: nil,
    disclosureText: "disclosure",
    leftContent: {
        MyView()
    },
    rightContent: {
        MyView()
    }
)
```
