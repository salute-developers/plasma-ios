# ``SDDSThemeCore``

Рантайм-ядро токенов темы SDDS: портируемый набор типов без зависимостей на другие пакеты
проекта.

@Metadata {
    @PageColor(green)
}

## Overview

От `SDDSThemeCore` зависит слой токенов любой сгенерированной темы — `Tokens/`, `Fonts/` и
`Theme.swift`. Именно поэтому токены можно поставлять отдельно от библиотеки компонентов:
ядро не знает ни про `SDDSComponents`, ни про `SDDSIcons`.

Обратной зависимости быть не должно — любой `import SDDSComponents` отсюда ломает
портируемость и конвейер генерации тем.

## Topics

### Токены

- ``ColorToken``
- ``TypographyToken``
- ``AdaptiveTypographyToken``
- ``GradientToken``
- ``ShapeToken``
- ``ShadowToken``
- ``SpacingToken``

### Состояния

- ``StatefulValue``
- ``InteractiveState``
- ``ValueState``

### Тема и тенанты

- ``Tenant``
- ``ThemeTenantRegistry``
- ``Subtheme``

### Сервисы

- ``EnvironmentValueProvider``
- ``FontsService``
- ``FontInfo``
