# Функциональные Требования к Компоненту SDDSSwitch

## Поддержка различных состояний

- **On**: Переключатель включен
- **Off**: Переключатель выключен
- **Enabled**: Переключатель доступен для взаимодействия.
- **Disabled**: Переключатель недоступен для взаимодействия (серая или приглушенная версия).

## Настраиваемая типографика

- Возможность задавать шрифт для текста заголовка и подзаголовка (размер, стиль, вес).

## Цветовые токены

- **TitleColor**: Цвет текста заголовка.
- **SubtitleColor**: Цвет текста подзаголовка.
- **TintColor**: Цвет самого переключателя.

## Поддержка различных размеров
- Определение размеров с помощью протокола **SizeConfiguration**.

## Конфигурация отступов

- Возможность настроить отступ между заголовком и подзаголовком.

## Гибкость в настройке ширины

- Возможность задать фиксированную ширину или позволить переключателю занимать минимально необходимое пространство.

## Адаптивность к контенту

- Переключатель автоматически сжимается или расширяется в зависимости от наличия заголовка и подзаголовка.

## Доступность (Accessibility)

- Поддержка VoiceOver и других технологий доступности.
- Настройка меток доступности (accessibility labels) и описаний (hints).
- Использование структуры SwitchAccessibility для настройки параметров доступности.

## Интерактивность

- Поддержка различных типов взаимодействий (обычное нажатие).

## Композиция стилей

- Возможность создания различных стилей переключателей с предопределенными цветовыми схемами и типографикой.