# CLAUDE.md — SDDSComponents

Библиотека UI-компонентов SDDS для iOS (SwiftUI + UIKit). Крупнейший пакет проекта
(~387 Swift-файлов). Здесь живут сами компоненты и их appearance-модель.

## Структура

- `Sources/SDDSComponents/` — исходники всех компонентов (по папкам на компонент).
- `Assets.xcassets/` — ресурсы компонентов.
- `SDDSComponentsPreview/` — SwiftUI-превью.
- `SDDSComponentsTests/` — тесты (в т.ч. снапшоты).
- `SDDSComponents.xcodeproj`, `Package.swift` — сборка через Xcode/SwiftPM.

## Зависимости

- `SDDSThemeCore` — типы токенов (ColorToken, TypographyToken, ShapeToken, …).
- `SDDSIcons` — иконки (`Asset.*`).
- `Vendor/InputMask` — маскирование ввода (submodule).

Компоненты завязаны на весь публичный API `SDDSComponents` и на appearance-типы
(`FormItemAppearance`, `TextFieldAppearance`, `BadgeAppearance`, …) плюс абстракции
вариаций (`Variation<T>`, `AppearanceVariation`, `StatefulColor`). Отсоединить один
компонент от библиотеки без остального графа нельзя — учитывай при рефакторинге.

## Сборка и тесты

```sh
# Сначала один раз собрать зависимости (XCFrameworks):
../scripts/build_all_static_dependencies.sh

cd SDDSComponents
xcodebuild -project SDDSComponents.xcodeproj -scheme SDDSComponents \
  -destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6' build

xcodebuild -project SDDSComponents.xcodeproj -scheme SDDSComponents \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro Max' test
```

Линт — общий `../lint.sh` (swiftlint, `.swiftlint.yml` в корне).

## Грабли

- Снапшот-тесты чувствительны к симулятору/масштабу — сверяйся с именем устройства из
  `scripts/run_tests.rb`, не подменяй симулятор произвольно.
- Appearance-типы генерируются/потребляются вместе с темами: изменение публичного
  appearance-API компонента ломает сгенерированные `Themes/*`. Меняешь API — проверь
  генерацию тем (см. [../DesignSystemBuilder/CLAUDE.md](../DesignSystemBuilder/CLAUDE.md)).
- Коммит-скоуп: `sdds-icore/uikit` или `sdds-icore/uikit-swift` (см. корневой
  [CONTRIBUTING.md](../CONTRIBUTING.md)).
