# CLAUDE.md — IntegrationCore

Ядро интеграции песочницы: абстракции историй (stories), тем и состояний, общие для
демо/песочницы SwiftUI. Набор небольших локальных SwiftPM-пакетов.

## Структура

- `SandboxCore/` — базовые типы песочницы (`Story`, `StoryRegistry`, `ComponentKey`,
  `Properties`, `UiState`, `ThemeManager`, `SandboxThemeProvider`). Есть `Tests/SandboxCoreTests`.
- `SandboxDemoTheme/` — демо-тема песочницы (`Theme.swift`,
  `SandboxThemeProvider+SandboxDefaults.swift`, `SandboxThemeVariationResolver.swift`).
- `SandboxSwiftUI/` — SwiftUI-слой песочницы.

## Как связано

`SandboxCore` описывает модель историй и провайдер темы; `SandboxDemoTheme` даёт дефолтную
тему; `SandboxSwiftUI` рендерит. Используется демо-приложением `SDDSDemoApp`.

## Сборка/тесты

Пакеты SwiftPM — собираются в составе `SDDS.xcworkspace`. Тесты `SandboxCore`:
```sh
swift test --package-path IntegrationCore/SandboxCore
```

## Грабли

- Реестр историй (`StoryRegistry`) — точка расширения: новая история должна регистрироваться,
  иначе не появится в песочнице.
- Коммит-скоуп: `sdds-icore/sandbox`.
