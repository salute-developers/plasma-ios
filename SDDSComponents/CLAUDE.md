# CLAUDE.md — SDDSComponents

Библиотека UI-компонентов SDDS (SwiftUI + UIKit) и их appearance-модель.

**Полное описание, структура, сборка и примеры — [README.md](README.md). Читай его вместо `grep`.**

## Что нужно помнить агенту

- Компоненты завязаны на весь публичный API пакета и на абстракции вариаций
  (`Variation<T>`, `AppearanceVariation`, `StatefulColor`). Отсоединить один компонент от
  библиотеки без остального графа нельзя — учитывай при рефакторинге.
- **Изменение публичного appearance-API ломает сгенерированные `Themes/*`.** Меняешь API —
  проверь генерацию тем (см. [../DesignSystemBuilder/CLAUDE.md](../DesignSystemBuilder/CLAUDE.md)).
- **Снапшот-тесты чувствительны к симулятору и масштабу** — сверяйся с именем устройства из
  `scripts/run_tests.rb`, не подменяй симулятор произвольно.
- **Настройки сборки — в таргетах, не в командной строке `xcodebuild`**: из-за макро-пакета
  `SDDSApiInfo` глобальные `MACH_O_TYPE`, `BUILD_LIBRARY_FOR_DISTRIBUTION`, `SKIP_INSTALL`
  и `-sdk` ломают плагин. Платформу задаём только через `-destination`.
- Коммит-скоуп: `sdds-icore/uikit` или `sdds-icore/uikit-swift` (см. корневой
  [CONTRIBUTING.md](../CONTRIBUTING.md)).
