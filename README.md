### SDDS iOS

Проект объединяет в себе набор решений по адаптации дизайн-системы SDDS для приложений iOS.

## Third-Party Dependencies

This project includes code from the following third-party libraries:
- [InputMask](https://github.com/RedMadRobot/input-mask-ios) by RedMadRobot - MIT License

See [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md) for complete license texts.

## Cборка проекта

Для сборки проекта необходимо запустить ruby script:
```
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace
```

Также можно собрать только необходимые модули, если передать их списком в качестве аргумента `m`:

```
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace -m SDDSSwiftUI,SDDSIcons
```

Артефакты сборки появятся в папке `/build`.

### Сборка отдельных Xcode-проектов

Сборку можно выполнять по отдельности для каждого проекта (без workspace). Сначала нужно один раз собрать зависимости (XCFrameworks), например через скрипт:
```
./scripts/build_all_static_dependencies.sh
```
или через workspace (см. выше). После этого:

**SDDSComponents:**
```
cd SDDSComponents
xcodebuild -project SDDSComponents.xcodeproj -scheme SDDSComponents -destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6' build
```

**SDDSDemoApp:**
```
cd SDDSDemoApp
xcodebuild -project SDDSDemoApp.xcodeproj -scheme SDDSDemoApp -destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6' build
```

Вместо `iPhone 16,OS=18.6` укажите доступный симулятор из списка `xcodebuild -destination 'platform=iOS Simulator' -showdestinations`.

## CLI дизайн-системы (`dsbuilder`)

`DesignSystemBuilder/` — единый CLI дизайн-системы. Один бинарник делает и генерацию тем
(`Themes/<Name>Theme` — токены, типографика, вариации компонентов), и сборку
документационного бандла:

```
cd DesignSystemBuilder && ./build_cli.sh      # → build/dsbuilder/dsbuilder
```

```
./build/dsbuilder/dsbuilder                                   # генерация тем (подкоманда themes)
./build/dsbuilder/dsbuilder docs extract   --repo-root ..     # сэмплы документации
./build/dsbuilder/dsbuilder docs aggregate --repo-root .. --theme SDDSserv
```

Отдельный режим — **автономные исходники** (`--standalone`): тема собирается в плоскую папку
`.swift`, которая компилируется одним модулем без линковки наших библиотек. Исходники для
сборки можно забрать прямо с релиза по номеру версии, не имея чекаута репозитория:

```
./dsbuilder ./config.json --standalone --components --sources-version release-18-08-2026
```

Как получить бинарь CLI и как выглядит конфиг для запуска вне репозитория — см.
[«Исходники с релиза»](DesignSystemBuilder/README.md#исходники-с-релиза---sources-version).
Каждый релиз публикует xcframework'и (`SDDSThemeCore`, `InputMask`, `SDDSComponents`, темы;
иконки идут отдельным релизом `SDDSIcons-v*` через `release_icons.yml`), `dsbuilder-cli-<tag>.zip` (сам CLI) и `SDDSSources-<tag>.zip` (исходники
SDDS, собирает [scripts/package_sources.sh](scripts/package_sources.sh)). Тот же набор локально
собирает [scripts/release/build_release.sh](scripts/release/build_release.sh) `<tag>`.

### Интеграционный тест релизных артефактов

`.github/workflows/integration-test.yml` после мержа в `develop` и на PR в `main` подключает
собранные xcframework'и в чистое приложение на каждую тему
([IntegrationTests/](IntegrationTests/CLAUDE.md)) и гоняет тесты на симуляторе. Слои
артефактов кэшируются по хэшам исходников — пересобирается только изменившийся. Локально:

```
scripts/release/build_release.sh local --skip-cli
scripts/integration/run_integration_test.sh release-artifacts build
```

`SDDSIcons.xcframework` берётся из `build/`: в ассеты датного релиза он не входит (у иконок
отдельный релиз `SDDSIcons-v*`).

**Как подключать xcframework'и в приложение** (проверено этим тестом): статические
`SDDSThemeCore`, `SDDSComponents` и тему — как **Do Not Embed**; динамические `InputMask` и
`SDDSIcons` — как **Embed & Sign**. `FRAMEWORK_SEARCH_PATHS` должен указывать на каталог с
xcframework'ами. Ресурсы `SDDSComponents` (спиннер) и `SDDSIcons` при такой схеме доезжают
без дополнительных шагов. `Theme.initialize(onComplete:)` вызывает колбэк только после
загрузки шрифтов с CDN — не блокируй на нём запуск приложения.

Тесты CLI — `swift test --package-path DesignSystemBuilder` (или `ruby scripts/run_tests.rb`).
Подробности — [DesignSystemBuilder/README.md](DesignSystemBuilder/README.md) и
[docs/DOCS_BUNDLE.md](docs/DOCS_BUNDLE.md).

> Одноимённый внешний `dsbuilder` (Kotlin/Native, репозиторий `design-system-builder`)
> выгружает `.sdds/` и печёт готовый архив документации из подготовленного нами дерева —
> это другой бинарник.

## AI-агентная инфра

В репозитории развёрнута локальная инфраструктура для работы с AI-агентом (Claude Code).
Работает **в интерактивном режиме в рамках подписки** — без метерного API, без GitHub
Actions, без issue-трекера.

**Что где лежит:**
- Карта для агента: корневой [CLAUDE.md](CLAUDE.md) + по одному `CLAUDE.md` в значимых
  пакетах (читаются вместо `grep`).
- Контракт пакетов/знаний: [project.yml](project.yml).
- Граф-навигация по коду (MCP Serena): [.mcp.json](.mcp.json).
- Память команды: [.claude/memory/](.claude/memory/) (индекс `MEMORY.md`, правила биллинга,
  ключевые решения).
- Процесс: [docs/LOCAL_WORKFLOW.md](docs/LOCAL_WORKFLOW.md),
  [docs/TASK_GUIDE.md](docs/TASK_GUIDE.md), локальный [docs/BACKLOG.md](docs/BACKLOG.md).
- Spec-driven workflow для фич: **OpenSpec** (`/opsx:*`, спеки в `openspec/`).

**Правила биллинга (важно):** держать `ANTHROPIC_API_KEY` **unset**; не использовать
`claude -p`/headless (метерно); проверка результата — локально + просмотр владельцем. Детали —
[.claude/memory/local-mode-billing.md](.claude/memory/local-mode-billing.md).

**Ручная доустановка инструментов** (OpenSpec, superpowers, claude-mem, проверка Serena) —
см. [docs/LOCAL_WORKFLOW.md](docs/LOCAL_WORKFLOW.md) и подсказки при первом запуске сессии.
