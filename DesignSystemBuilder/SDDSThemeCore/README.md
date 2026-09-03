# SDDSThemeCore

Рантайм-ядро токенов темы SDDS. Минимальный портируемый пакет: только
`Foundation` / `SwiftUI` / `UIKit`, **без внутренних зависимостей** на другие пакеты проекта.

Именно от него зависит слой токенов любой сгенерированной темы (`Themes/*/Tokens`, `Fonts/`,
`Theme.swift`) — поэтому токены можно бандлить отдельно от `SDDSComponents`.

## Что здесь

| Группа | Типы |
|---|---|
| Токены | `ColorToken`, `TypographyToken`, `AdaptiveTypographyToken`, `GradientToken`, `ShapeToken`, `ShadowToken`, `SpacingToken`, `FontInfo` |
| Тема и тенанты | `ThemeTenantRegistry`, `Tenant`, `Subtheme` |
| Сервисы | `EnvironmentValueProvider`, `FontsService`, `EmbeddedFont` |

`EnvironmentValueProvider` — реестр дефолтных appearance-значений: его заполняет
`Theme.initialize()` конкретной темы, из него компоненты берут внешний вид, когда `appearance`
не передан явно.

## Почему это важно

- Слой токенов самодостаточен и переносим — его можно отдать клиенту без библиотеки компонентов.
- Слой компонентов (appearance-типы) требует весь граф `SDDSComponents` и отделяется тяжело.
- **Держите ядро без зависимостей на компоненты.** Любой `import SDDSComponents` отсюда ломает
  портируемость и конвейер генерации тем.

## Сборка и тесты

Отдельный XCFramework (проект живёт уровнем выше):

```sh
ruby ./scripts/build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore
```

Тесты — `SDDSThemeCoreTests` в составе пакета `DesignSystemBuilder`:

```sh
swift test --package-path DesignSystemBuilder
```

## Грабли

- Изменение публичного типа токена меняет контракт для **всех** сгенерированных `Themes/*` —
  после такой правки прогоняйте генерацию тем.
- Пакет уезжает в релиз отдельным `SDDSThemeCore.xcframework` со своей версией, не совпадающей
  с версиями компонентов и тем (см. [`release-manifest.json`](../../release-manifest.json)).

## Ссылки

- [DesignSystemBuilder/README.md](../README.md) — CLI генерации тем.
- [Themes/README.md](../../Themes/README.md) — что генерируется поверх этих типов.
