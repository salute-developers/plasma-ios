# IntegrationCore

Ядро интеграции песочницы: абстракции историй (stories), тем и состояний, общие для демо и
песочницы SwiftUI. Набор небольших локальных SwiftPM-пакетов.

**В клиентское приложение не идёт** — нужен только `SDDSDemoApp`.

## Пакеты

| Пакет | Что внутри | Зависимости |
|---|---|---|
| `SandboxCore/` | `Story`, `StoryRegistry`, `ComponentKey`, `Properties`, `UiState`, `ThemeManager`, `SandboxThemeProvider` | нет |
| `SandboxSwiftUI/` | SwiftUI-слой рендера песочницы | `SandboxCore` |
| `SandboxDemoTheme/` | демо-тема песочницы, дефолты провайдера, резолвер вариаций | `SandboxCore`, `SDDSComponents`, `SDDSThemeCore`, все `Themes/*` |

## Как связано

`SandboxCore` описывает модель историй и провайдер темы; `SandboxDemoTheme` даёт дефолтную
тему; `SandboxSwiftUI` рендерит. Всё это потребляет `SDDSDemoApp`.

`SandboxCore` не зависит ни от чего — поэтому на него могут ссылаться и пакеты тем.

## Сборка и тесты

Пакеты собираются в составе `SDDS.xcworkspace`. Отдельно:

```sh
swift test --package-path IntegrationCore/SandboxCore
```

XCFrameworks:

```sh
ruby scripts/build_integrationcore_xcframeworks.rb
```

## Грабли

- **`StoryRegistry` — точка расширения.** Новая история должна быть зарегистрирована, иначе
  не появится в песочнице. Часть регистраций генерируется скриптом
  [`scripts/generate_sandbox_stories.py`](../scripts/generate_sandbox_stories.py).
- Коммит-скоуп: `sdds-icore/sandbox`.

## Ссылки

- [SDDSDemoApp/README.md](../SDDSDemoApp/README.md) — запуск песочницы и подключение новой темы.
