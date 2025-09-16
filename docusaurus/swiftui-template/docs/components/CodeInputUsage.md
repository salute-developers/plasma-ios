---
title: CodeInput
---

`SDDSCodeInput` представляет собой компонент для ввода кода с визуальным отображением в виде кружочков.

## Описание

Компонент предназначен для ввода числовых кодов (например, SMS-кодов, PIN-кодов) с визуальным представлением в виде кружочков. В отличие от `SDDSCodeField`, который отображает цифры в прямоугольных полях, `SDDSCodeInput` использует кружочки для отображения состояния ввода.

## Основные возможности

- Ввод только числовых символов
- Визуальное отображение в виде кружочков
- Группировка полей для лучшего восприятия
- Настраиваемые размеры и стили
- Поддержка подписи с различным выравниванием
- Автоматическое разбиение кода по группам
- Режим скрытого ввода (secure input) с отображением заполненных кружочков

## Отличия от SDDSCodeField

### Визуальное представление
- **SDDSCodeField**: Прямоугольные поля с цифрами
- **SDDSCodeInput**: Кружочки с обводкой (stroke) и заполнением (fill)

### Состояния отображения
- **Пустое поле**: Только обводка кружочка (strokeColor)
- **Заполненное поле**: Цифра в центре кружочка
- **Скрытый ввод (isHidden = true)**: Заполненный кружочек вместо цифры
- **Ошибка**: Цвета ошибки для обводки и заполнения

### Фокус
- **SDDSCodeField**: Имеет состояние фокуса с изменением цвета фона
- **SDDSCodeInput**: Фокус влияет только на цвет обводки (strokeColorFocused)

## Использование

### Базовое использование

```swift
SDDSCodeInput(
    groups: CodeFieldGroup.four,
    caption: "Введите код из СМС",
    onCodeChanged: { code in
        print("Введен код: \(code)")
    }
)
```

### С группировкой полей

```swift
SDDSCodeInput(
    groups: CodeFieldGroup.six,
    caption: "Код подтверждения",
    captionAlignment: .leading,
    keyboardType: .numberPad,
    appearance: CodeInput.m.appearance,
    onCodeChanged: { code in
        print("Введен код: \(code)")
    }
)
```

### С кастомными группами

```swift
SDDSCodeInput(
    groups: [
        CodeFieldGroup(count: 3),
        CodeFieldGroup(count: 2),
        CodeFieldGroup(count: 1)
    ],
    caption: "Код доступа",
    onCodeChanged: { code in
        print("Введен код: \(code)")
    }
)
```

### Скрытый ввод (Secure Input)

```swift
SDDSCodeInput(
    groups: CodeFieldGroup.four,
    caption: "Введите PIN-код",
    captionAlignment: .center,
    keyboardType: .numberPad,
    isHidden: true,
    appearance: CodeInput.l.appearance,
    onCodeChanged: { code in
        print("Введен PIN: \(code)")
    }
)
```

При `isHidden: true`:
- Введенные символы отображаются как заполненные кружочки
- Текущий вводимый символ показывается как цифра
- После ввода и перехода на следующую позицию символ становится заполненным кружочком
- Копирование/вставка отключены

## Параметры

### groups: [CodeFieldGroup]
Массив групп полей для отображения кода. Каждая группа определяет количество полей в ней.

### caption: String
Подпись под полями ввода. Если пустая, подпись не отображается.

### captionAlignment: TextAlignment
Выравнивание подписи (.leading, .center, .trailing).

### keyboardType: UIKeyboardType
Тип клавиатуры для ввода (по умолчанию .numberPad).

### isHidden: Bool
Если `true`, то введенные символы отображаются как заполненные кружочки (режим secure input). По умолчанию `false`.

### appearance: CodeInputAppearance?
Кастомизация внешнего вида компонента.

### onCodeChanged: (String) -> Void
Callback, вызываемый при изменении кода.

## Фабричные методы CodeFieldGroup

### four
Создает группу с 4 полями:
```swift
CodeFieldGroup.four // [CodeFieldGroup(count: 4)]
```

### five
Создает группу с 5 полями:
```swift
CodeFieldGroup.five // [CodeFieldGroup(count: 5)]
```

### six
Создает две группы по 3 поля каждая:
```swift
CodeFieldGroup.six // [CodeFieldGroup(count: 3), CodeFieldGroup(count: 3)]
```

## Визуальное представление

Компонент отображает:
1. Горизонтальный стек кружочков, сгруппированных по логике groups
2. Каждый кружочек имеет размер size.itemWidth × size.itemHeight
3. Обводка кружочка: size.strokeWidth
4. Заполнение кружочка: size.dotSize (только для скрытого ввода)
5. Отступы между кружочками в группе: size.itemSpacing
6. Отступы между группами: size.groupSpacing
7. Подпись с отступом: size.captionPadding

## Состояния кружочков

### Пустое поле
- Только обводка (strokeColor)
- Размер: itemWidth × itemHeight
- Толщина обводки: strokeWidth

### Заполненное поле (обычный режим)
- Обводка + цифра в центре
- Цвет цифры: codeColor
- Цвет обводки: strokeColor

### Заполненное поле (скрытый режим)
- Обводка + заполненный кружочек
- Цвет заполнения: fillColor
- Размер заполнения: dotSize

### Состояние ошибки
- Цвет обводки: strokeColorError
- Цвет заполнения: fillColorError
- Цвет цифры: codeColorError

### Состояние фокуса
- Цвет обводки: strokeColorFocused

## Ввод данных

- Ввод происходит через невидимый TextField
- Поддерживаются только числовые символы
- Автоматическое разбиение кода по группам
- При вводе "123456" с группами [3, 3] отображается как "123 456"
- Анимации ошибок и валидация аналогичны SDDSCodeField
