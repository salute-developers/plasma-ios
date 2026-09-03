# SDDSComponents

Библиотека UI-компонентов SDDS для iOS на **SwiftUI + UIKit**. Крупнейший пакет репозитория:
здесь живут сами компоненты и их appearance-модель, на которую опираются сгенерированные темы.

- Продукт SwiftPM: `SDDSComponents` (`Package.swift`), плюс `SDDSComponents.xcodeproj`.
- В релиз уезжает как `SDDSComponents.xcframework` (статический).

## Структура

| Путь | Что это |
|---|---|
| `Sources/SDDSComponents/Components/` | исходники компонентов, по папке на компонент |
| `Sources/SDDSComponents/Common/` | общие абстракции: `Variation`, `AppearanceVariation`, `ComponentAppearanceVariation`, `StatefulColor` |
| `Sources/SDDSComponents/Constants/` | модификаторы и расширения `View` |
| `Assets.xcassets/` | ресурсы компонентов |
| `SDDSComponentsPreview/` | SwiftUI-превью |
| `SDDSComponentsTests/` | тесты, в том числе снапшотные |

## Зависимости

| Пакет | Зачем |
|---|---|
| `SDDSThemeCore` | типы токенов (`ColorToken`, `TypographyToken`, `ShapeToken`, …) |
| `InputMask` (`Vendor/`) | маскирование ввода, git submodule |
| `SDDSApiInfo` | маркерные макросы разметки API стилей, **build-only** |

`SDDSIcons` в зависимостях пакета **нет** — иконки подключает слой тем и приложение.

## Appearance-модель

Внешний вид компонента описывается структурой `*Appearance` (`ButtonAppearance`,
`TextFieldAppearance`, `FormItemAppearance`, …). Тема генерирует поверх неё вариации, и
обращение к ним читается как «размер → стиль»:

```swift
BasicButton(
    title: "Оплатить",
    subtitle: "",
    appearance: SDDSServTheme.BasicButton.l.accent.appearance,
    layoutMode: .wrapContent,
    action: {}
)
```

Если `appearance` не передан, компонент берёт значение из `EnvironmentValueProvider` — его
заполняет `Theme.initialize()` темы.

Компоненты завязаны на весь публичный API пакета и на abstractions вариаций. Отсоединить один
компонент от библиотеки без остального графа нельзя — учитывайте при рефакторинге.

## Сборка и тесты

Сначала один раз собрать зависимости (XCFrameworks):

```sh
../scripts/build_all_static_dependencies.sh
```

```sh
xcodebuild -project SDDSComponents.xcodeproj -scheme SDDSComponents \
  -destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6' build
```

```sh
xcodebuild -project SDDSComponents.xcodeproj -scheme SDDSComponents \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro Max' test
```

Линт — общий `../lint.sh` (swiftlint, конфиг `.swiftlint.yml` в корне).

## Грабли

- **Снапшот-тесты чувствительны к симулятору и масштабу.** Сверяйтесь с именем устройства из
  [`scripts/run_tests.rb`](../scripts/run_tests.rb), не подменяйте симулятор произвольно.
- **Изменение публичного appearance-API ломает сгенерированные `Themes/*`.** Меняете API —
  перегенерируйте темы, см. [DesignSystemBuilder/README.md](../DesignSystemBuilder/README.md).
- **Настройки сборки задаются в таргетах, не в командной строке `xcodebuild`.** Из-за
  зависимости на макро-пакет `SDDSApiInfo` глобальные `MACH_O_TYPE`,
  `BUILD_LIBRARY_FOR_DISTRIBUTION`, `SKIP_INSTALL` и `-sdk` ломают macro-плагин. Платформу
  задаём только через `-destination`.

## Ссылки

- [Корневой README](../README.md) — граф зависимостей и подключение ДС в приложение.
- [SDDSApiInfo](../SDDSApiInfo/README.md) — разметка `@ApiName`, `@ApiInfo` и прочие маркеры.
- [Tools/SDDSApiInfoGenerator](../Tools/SDDSApiInfoGenerator/README.md) — снятие `ios-api-meta.json`.
- [SDDSComponentsFixtures](../SDDSComponentsFixtures/README.md) — компилируемые примеры для доков.
