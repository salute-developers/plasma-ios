---
title: Note
---

Компонент для отображения информационных сообщений с возможностью кастомизации контента.

Компонент представляет собой вертикальный layout с опциональной иконкой, заголовком, текстом, кнопкой-действием и кнопкой закрытия.

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
- `noteAppearance`: Стандартные настройки внешнего вида компонента Note

## Особенности
- Поддержка опциональной иконки слева или сверху (ContentBefore)
- Автоматическое определение размера ContentBefore (если iconSize = 0, используется размер из ViewBuilder)
- Опциональная кнопка закрытия в правом верхнем углу
- LinkButton для действий с опциональной иконкой
- Настраиваемое позиционирование ContentBefore (top/center)
- Однострочный текст с автоматическим обрезанием

## Примеры использования

### Базовое сообщение с иконкой

```swift
// @sample: SDDSComponentsFixtures/Samples/Note/SDDSNote_Simple.swift
```

### Сообщение с кнопкой-действием

```swift
SDDSNote(
    title: "Обновление доступно",
    text: "Доступна новая версия приложения",
    linkButtonTitle: "Обновить",
    onLinkButtonTap: {
        print("Обновить приложение")
    }
) {
    Image("updateIcon")
        .resizable()
        .frame(width: 24, height: 24)
}
.environment(\.noteAppearance, Note.l.positive.appearance)
```

### Сообщение с кнопкой закрытия

```swift
SDDSNote(
    title: "Уведомление",
    text: "Вы получили новое сообщение",
    onClose: {
        print("Закрыть уведомление")
    }
) {
    Image(systemName: "envelope.fill")
        .resizable()
        .frame(width: 24, height: 24)
}
.environment(\.noteAppearance, Note.l.hasClose.info.appearance)
```

### Сообщение без ContentBefore

```swift
SDDSNote(
    title: "Предупреждение",
    text: "Проверьте введенные данные",
    linkButtonTitle: "Понятно",
    onLinkButtonTap: {
        print("Закрыть")
    }
)
.environment(\.noteAppearance, Note.l.warning.appearance)
```

### Сообщение с scalable иконкой

```swift
SDDSNote(
    title: "Важная информация",
    text: "Прочитайте внимательно",
    linkButtonTitle: "Подробнее",
    onLinkButtonTap: {
        print("Показать детали")
    }
) {
    Image("customIcon")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 36, height: 36)
}
.environment(\.noteAppearance, Note.l.contentScalable.default.appearance)
```

### Полный пример с иконкой LinkButton

```swift
SDDSNote(
    title: "Ошибка загрузки",
    text: "Не удалось загрузить данные",
    linkButtonTitle: "Повторить",
    linkButtonIcon: Image(systemName: "arrow.clockwise"),
    onLinkButtonTap: {
        print("Повторить загрузку")
    },
    onClose: {
        print("Закрыть сообщение об ошибке")
    }
) {
    Image(systemName: "exclamationmark.triangle.fill")
        .resizable()
        .frame(width: 24, height: 24)
}
.environment(\.noteAppearance, Note.l.hasClose.negative.appearance)
```

## Структура внешнего вида

`NoteAppearance` содержит следующие параметры:

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

`NoteSizeConfiguration` определяет размеры компонента:

- `shape`: Форма компонента (скругление углов)
- `titlePaddingEnd`: Отступ справа у заголовка (для кнопки закрытия)
- `iconSize`: Размер иконки ContentBefore (0 = scalable)
- `contentBeforeEndMargin`: Отступ справа от ContentBefore
- `paddingStart`: Отступ слева
- `paddingTop`: Отступ сверху
- `paddingEnd`: Отступ справа
- `paddingBottom`: Отступ снизу
- `textTopMargin`: Отступ сверху у текста
- `actionTopMargin`: Отступ сверху у LinkButton
- `closeTopMargin`: Отступ сверху у кнопки закрытия
- `closeEndMargin`: Отступ справа у кнопки закрытия
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
- `Note.l.default.appearance`
- `Note.m.hasClose.positive.appearance`
- `Note.s.contentScalable.warning.appearance`
- `Note.xs.hasCloseContentScalable.negative.appearance`

## Особенности работы с ContentBefore

### Фиксированный размер (iconSize > 0)
Когда `iconSize` задан в конфигурации (24, 16 и т.д.), компонент применяет этот размер к ContentBefore:

```swift
SDDSNote(
    title: "Сообщение",
    text: "Текст сообщения"
) {
    Image("icon")
        .resizable() // Будет масштабирован до iconSize
}
.environment(\.noteAppearance, Note.l.default.appearance) // iconSize = 24
```

### Scalable размер (iconSize = 0)
Когда `iconSize = 0`, ContentBefore использует свой собственный размер:

```swift
SDDSNote(
    title: "Сообщение",
    text: "Текст сообщения"
) {
    Image("customIcon")
        .resizable()
        .frame(width: 36, height: 36) // Этот размер будет использован
}
.environment(\.noteAppearance, Note.l.contentScalable.default.appearance)
```

## Взаимодействие

- Кнопка закрытия отображается только если `closeSize > 0` и передан `onClose`
- LinkButton отображается только если передан `linkButtonTitle`
- ContentBefore не отображается если передан `EmptyView`
- Иконка LinkButton отображается справа от текста

