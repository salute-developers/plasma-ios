# CLAUDE.md — IntegrationTests

Интеграционный тест релизных xcframework'ов: чистое iOS-приложение на каждую тему подключает
`SDDSThemeCore`, `SDDSComponents`, `InputMask`, `SDDSIcons` и `<Scheme>.xcframework` так, как
это делает внешний клиент, и гоняет hosted-XCTest на симуляторе (`Theme.initialize`, аппиранс
темы, токены, рендер `BasicButton`, иконки).

## Структура

- `XCFrameworkIntegration/XCFrameworkIntegration.xcodeproj` — сгенерирован, коммитится.
- `XCFrameworkIntegration/Shared/App/` — общие исходники приложения.
- `XCFrameworkIntegration/Templates/*.erb` — шаблоны файлов, зависящих от темы.
- `XCFrameworkIntegration/Generated/<Scheme>/` — `ThemeEntry.swift`, `IntegrationTests.swift`
  (сгенерированы, коммитятся).
- `XCFrameworkIntegration/Frameworks/` — xcframework'и (в `.gitignore`, наполняет скрипт).
- `TestResults/` — `<Scheme>.xcresult` (в `.gitignore`).

## Запуск локально

```sh
scripts/release/build_release.sh local --skip-cli          # ~50 мин, все артефакты
# release-artifacts + build: SDDSIcons.xcframework в ассеты релиза не входит (отдельный
# релиз SDDSIcons-v*), поэтому берём его из build/
scripts/integration/run_integration_test.sh release-artifacts build
# только одна тема, из каталогов сборки:
scripts/integration/run_integration_test.sh --theme SDDSServTheme DesignSystemBuilder/build build Themes/build
```

CI: `.github/workflows/integration-test.yml` (push в `develop`, PR в `main`, ручной запуск).

## Перегенерация проекта

Добавили тему в `Themes/` — запусти `ruby scripts/integration/generate_integration_project.rb`
и закоммить `XCFrameworkIntegration/`. Шаблоны и общие исходники правь руками, `Generated/` и
`.xcodeproj` — нет. Генератор идемпотентен: повторный запуск не меняет `pbxproj`.

## Грабли

- Статические фреймворки — только Do Not Embed; динамические (`InputMask`, `SDDSIcons`) —
  Embed & Sign. Правило проекта, генератор его кодирует.
- Схема `Integration<Scheme>` использует имя таргета темы (`SDDSServTheme`), а не папки
  (`SDDSservTheme`).
- **`Theme.initialize(onComplete:)` вызывает колбэк только после загрузки шрифтов с CDN**
  (`SDDSThemeCore.FontsService`). В тесте колбэк не ждём: без сети до
  `cdn-app.sberdevices.ru` это упирается в таймаут URLSession (~60 с и больше).
- **Наборы вариаций компонентов у тем разные** (у `PlasmaHomeDSTheme` нет `BasicButton.l`).
  Генератор выбирает размер из тех, что есть у темы (`SIZE_VARIATION_PREFERENCE`), поэтому
  шаблон не хардкодит вариацию.
- Коммит-скоуп: `sdds-ios/build-system`.
