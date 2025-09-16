---
title: CodeField
---

`SDDSCodeField` представляет собой компонент для ввода кода с визуальным отображением цифр в отдельных полях.

## Описание

Компонент предназначен для ввода числовых кодов (например, SMS-кодов, PIN-кодов) с визуальным представлением каждой цифры в отдельном поле. Поддерживает группировку полей для лучшего восприятия длинных кодов.

## Основные возможности

- Ввод только числовых символов
- Визуальное отображение каждой цифры в отдельном поле
- Группировка полей для лучшего восприятия
- Настраиваемые размеры и стили
- Поддержка подписи с различным выравниванием
- Автоматическое разбиение кода по группам
- Режим скрытого ввода (secure input) с отображением точек

## Использование

### Базовое использование

```swift
SDDSCodeField(
    groups: CodeFieldGroup.four,
    caption: "Введите код из СМС",
    onCodeChanged: { code in
        print("Введен код: \(code)")
    }
)
```

### С группировкой полей

```swift
SDDSCodeField(
    groups: CodeFieldGroup.six,
    caption: "Код подтверждения",
    captionAlignment: .leading,
    keyboardType: .numberPad,
    appearance: CodeField.m.segmented.appearance,
    onCodeChanged: { code in
        print("Введен код: \(code)")
    }
)
```

### С кастомными группами

```swift
SDDSCodeField(
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
SDDSCodeField(
    groups: CodeFieldGroup.four,
    caption: "Введите PIN-код",
    captionAlignment: .center,
    keyboardType: .numberPad,
    isHidden: true,
    appearance: CodeField.l.appearance,
    onCodeChanged: { code in
        print("Введен PIN: \(code)")
    }
)
```

При `isHidden: true`:
- Введенные символы отображаются как точки
- Текущий вводимый символ показывается как текст
- После ввода и перехода на следующую позицию символ становится точкой
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
Если `true`, то введенные символы отображаются как точки (режим secure input). По умолчанию `false`.

### appearance: CodeFieldAppearance?
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
1. Горизонтальный стек полей, сгруппированных по логике groups
2. Каждое поле имеет размер size.width × size.height
3. Отступы между полями в группе: size.itemSpacing
4. Отступы между группами: size.groupSpacing
5. Форма полей: appearance.itemShape
6. Форма групп: appearance.groupShape
7. Подпись с отступом: size.captionSpacing

## Ввод данных

- Ввод происходит через невидимый TextField
- Поддерживаются только числовые символы
- Автоматическое разбиение кода по группам
- При вводе "123456" с группами [3, 3] отображается как "123 456" 
