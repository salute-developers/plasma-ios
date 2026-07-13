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
