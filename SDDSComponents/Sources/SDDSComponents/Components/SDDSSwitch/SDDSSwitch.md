# SDDSSwitch

Настраиваемый переключатель, который может быть настроен с помощью различных параметров.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| title | String | Текст заголовка для переключателя |
| subtitle | String | Текст подзаголовка для переключателя |
| isOn | Binding<Bool> | Связка состояния включения/выключения переключателя |
| isEnabled | Bool | Флаг, указывающий, включен ли переключатель |
| appearance | SwitchAppearance? | Параметры внешнего вида переключателя |
| switchAccessibility | SwitchAccessibility | Параметры доступности для переключателя |

## Окружение
- `switchAppearance`: Стандартные настройки внешнего вида переключателя

## Пример использования

```swift
@State isOn: Bool = true
SDDSSwitch(
    title: "Label",
    subtitle: "Description",
    isOn: $isOn,
    isEnabled: true,
    appearance: Switch.l.appearance,
    switchAccessibility: SwitchAccessibility()
)
```
