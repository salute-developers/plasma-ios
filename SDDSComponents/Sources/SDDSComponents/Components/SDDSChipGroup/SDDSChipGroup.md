# Функциональные Требования к Компоненту SDDSChipGroup

## Поддержка различных состояний

- **Data**: Массив данных для чипов, представленных структурой `ChipData`.

## Цветовые токены

- **titleColor**: Цвет текста заголовка чипа.
- **imageTintColor**: Цвет иконки чипа.
- **buttonTintColor**: Цвет кнопки чипа.
- **disabledAlpha**: Прозрачность для состояния, когда чип выключен.

## Поддержка различных размеров

- Определение размеров с помощью протокола **ChipGroupSizeConfiguration**.
- **insets**: Внутренние отступы.
- **maxColumns**: Максимальное количество столбцов в ряду.
- **alignment**: Выравнивание группы чипов (левое, правое, центрированное, убывающее количество элементов).

## Гибкость в настройке внешнего вида

- Поддержка различных стилей выравнивания через **ChipGroupAlignment**.
- **left**: Выравнивание по левому краю.
- **right**: Выравнивание по правому краю.
- **center**: Центрированное выравнивание.
- **decreasingLeft**: Убывающее количество элементов, выравненных по левому краю.
- **decreasingRight**: Убывающее количество элементов, выравненных по правому краю.

## Доступность (Accessibility)

- Поддержка VoiceOver и других технологий доступности.
- Настройка меток доступности (accessibility labels) и описаний (hints) для чипов.
- Использование структуры ChipAccessibility для настройки параметров доступности чипов.

## Композиция стилей

- Возможность создания различных стилей группы чипов с предопределенными цветовыми схемами.