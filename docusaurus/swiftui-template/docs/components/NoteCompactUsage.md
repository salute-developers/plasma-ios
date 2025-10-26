---
title: NoteCompact
---

Компактная версия компонента Note с горизонтальным layout'ом для отображения информационных сообщений.

Компонент представляет собой горизонтальный layout со всеми элементами в одну линию: иконка, заголовок/текст, кнопка-действие и кнопка закрытия.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| `title` | `String` | Заголовок сообщения |
| `text` | `String?` | Текст сообщения (опционально) |
| `linkButtonTitle` | `String?` | Текст для кнопки-ссылки (опционально) |
| `linkButtonIcon` | `Image?` | Иконка для кнопки-ссылки (опционально) |
| `onLinkButtonTap` | `(() -> Void)?` | Действие при нажатии на кнопку-ссылку |
| `onClose` | `(() -> Void)?` | Действие при нажатии на кнопку закрытия |
| `contentBefore` | `@ViewBuilder` | Контент перед основным содержимым (обычно иконка) |

## Окружение
- `noteCompactAppearance`: Стандартные настройки внешнего вида компонента NoteCompact

## Особенности
- Горизонтальный layout (все элементы в одну линию)
- Поддержка опциональной иконки слева
- Автоматическое определение размера ContentBefore (если iconSize = 0, используется размер из ViewBuilder)
- Опциональная кнопка закрытия справа
- LinkButton справа от текста с настраиваемыми отступами
- Настраиваемое позиционирование ContentBefore (top/center)
- Однострочный текст с автоматическим обрезанием

## Примеры использования

### Базовое компактное сообщение

```swift
SDDSNoteCompact(
    title: "Информация",
    text: "Важное сообщение"
) {
    Image(systemName: "info.circle")
        .resizable()
        .frame(width: 24, height: 24)
}
.environment(\.noteCompactAppearance, NoteCompact.l.default.appearance)
```

### Компактное сообщение с кнопкой-действием

```swift
SDDSNoteCompact(
    title: "Обновление",
    text: "Новая версия",
    linkButtonTitle: "Обновить",
    onLinkButtonTap: {
        print("Обновить приложение")
    }
) {
    Image("updateIcon")
        .resizable()
        .frame(width: 24, height: 24)
}
.environment(\.noteCompactAppearance, NoteCompact.m.positive.appearance)
```

### Компактное сообщение с кнопкой закрытия

```swift
SDDSNoteCompact(
    title: "Предупреждение",
    text: "Проверьте данные",
    linkButtonTitle: "Исправить",
    onLinkButtonTap: {
        print("Открыть форму")
    },
    onClose: {
        print("Закрыть уведомление")
    }
) {
    Image(systemName: "exclamationmark.triangle")
        .resizable()
        .frame(width: 16, height: 16)
}
.environment(\.noteCompactAppearance, NoteCompact.s.hasClose.warning.appearance)
```

### Компактное сообщение без иконки

```swift
SDDSNoteCompact(
    title: "Успешно",
    text: "Операция выполнена",
    linkButtonTitle: "Закрыть",
    onLinkButtonTap: {
        print("Закрыть")
    }
)
.environment(\.noteCompactAppearance, NoteCompact.m.positive.appearance)
```

### Компактное сообщение с scalable иконкой

```swift
SDDSNoteCompact(
    title: "Ошибка",
    text: "Что-то пошло не так",
    linkButtonTitle: "Повторить",
    linkButtonIcon: Image(systemName: "arrow.clockwise"),
    onLinkButtonTap: {
        print("Повторить действие")
    }
) {
    Image("errorIcon")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 36, height: 36)
}
.environment(\.noteCompactAppearance, NoteCompact.l.contentScalable.negative.appearance)
```

### Полный пример с всеми опциями

```swift
SDDSNoteCompact(
    title: "Важное уведомление",
    text: "Требуется ваше внимание",
    linkButtonTitle: "Действие",
    linkButtonIcon: Image(systemName: "arrow.right"),
    onLinkButtonTap: {
        print("Выполнить действие")
    },
    onClose: {
        print("Закрыть уведомление")
    }
) {
    Image("plasma")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 36, height: 36)
}
.environment(\.noteCompactAppearance, NoteCompact.l.hasCloseContentScalable.info.appearance)
```

## Структура внешнего вида

`NoteCompactAppearance` содержит следующие параметры:

- `backgroundColor`: Цвет фона компонента
- `iconColor`: Цвет иконки ContentBefore
- `closeColor`: Цвет кнопки закрытия
- `titleColor`: Цвет заголовка
- `textColor`: Цвет текста
- `titleTypography`: Типографика заголовка
- `textTypography`: Типографика текста
- `closeIcon`: Иконка для кнопки закрытия
- `linkButtonAppearance`: Внешний вид LinkButton
- `size`: Конфигурация размеров

## Размеры

`NoteCompactSizeConfiguration` определяет размеры компонента:

- `shape`: Форма компонента (скругление углов)
- `iconSize`: Размер иконки ContentBefore (0 = scalable)
- `contentBeforeEndMargin`: Отступ справа от ContentBefore
- `paddingStart`: Отступ слева
- `paddingTop`: Отступ сверху
- `paddingEnd`: Отступ справа
- `paddingBottom`: Отступ снизу
- `textTopMargin`: Отступ сверху у текста (между title и text)
- `actionStartMargin`: Отступ слева у LinkButton
- `actionEndMargin`: Отступ справа у LinkButton
- `closeStartMargin`: Отступ слева у кнопки закрытия
- `closeSize`: Размер кнопки закрытия (0 = скрыта)
- `contentBeforeArrangement`: Выравнивание ContentBefore (top/center)

## Варианты

Доступны следующие размеры:
- `l` - большой
- `m` - средний
- `s` - маленький
- `xs` - очень маленький

Модификаторы:
- `.hasClose` - с кнопкой закрытия
- `.contentScalable` - с scalable иконкой (центрированной)
- `.hasCloseContentScalable` - с кнопкой закрытия и scalable иконкой

Стили:
- `default` - стандартный стиль (серый)
- `positive` - позитивный (зеленый)
- `negative` - негативный (красный)
- `warning` - предупреждение (желтый)
- `info` - информационный (синий)

Примеры вариаций:
- `NoteCompact.l.default.appearance`
- `NoteCompact.m.hasClose.positive.appearance`
- `NoteCompact.s.contentScalable.warning.appearance`
- `NoteCompact.xs.hasCloseContentScalable.negative.appearance`

## Отличия от Note

### Layout
- **Note**: Вертикальный layout (title, text и linkButton расположены друг под другом)
- **NoteCompact**: Горизонтальный layout (все элементы в одну линию)

### Отступы
- **Note**: Использует `actionTopMargin`, `closeTopMargin`, `closeEndMargin`, `titlePaddingEnd`
- **NoteCompact**: Использует `actionStartMargin`, `actionEndMargin`, `closeStartMargin`

### Позиция кнопки закрытия
- **Note**: Правый верхний угол (над контентом в ZStack)
- **NoteCompact**: Справа в потоке контента (в HStack)

## Взаимодействие

- Кнопка закрытия отображается только если `closeSize > 0` и передан `onClose`
- LinkButton отображается только если передан `linkButtonTitle`
- ContentBefore не отображается если передан `EmptyView`
- Иконка LinkButton отображается справа от текста
- Все элементы выравниваются по вертикали согласно `contentBeforeArrangement`

