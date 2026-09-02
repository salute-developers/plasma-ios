# CLAUDE.md — SDDSThemeCore

Рантайм-ядро токенов темы SDDS. Минимальный, портируемый пакет (~46 Swift-файлов) — только
`Foundation`/`SwiftUI`/`UIKit`, **без внутренних зависимостей** на другие пакеты проекта.
Именно от него зависят сгенерированные токены темы (`Themes/*/Tokens`, `Fonts`, `Theme.swift`).

## Что здесь

Публичные типы токенов и инфраструктура темы:
- Токены: `ColorToken`, `TypographyToken`, `GradientToken`, `ShapeToken`, `ShadowToken`,
  `SpacingToken`, `AdaptiveTypographyToken`, `FontInfo`.
- Тема/тенанты: `ThemeTenantRegistry`, `Tenant`, `Subtheme`.
- Сервисы/провайдеры: `EnvironmentValueProvider`, `FontsService`.

## Почему это важно

- Слой токенов самодостаточен: его можно бандлить отдельно от `SDDSComponents`.
- Слой компонентов (appearance-типы) требует весь граф `SDDSComponents` — отделяется тяжело.
- Держи ядро без зависимостей на компоненты: любой импорт `SDDSComponents` отсюда ломает
  портируемость и конвейер генерации.

## Грабли

- Изменение публичного типа токена меняет контракт для всех сгенерированных `Themes/*` —
  проверяй генерацию (см. [../CLAUDE.md](../CLAUDE.md)).
- Тесты — `SDDSThemeCoreTests` (рядом в `DesignSystemBuilder/`).
