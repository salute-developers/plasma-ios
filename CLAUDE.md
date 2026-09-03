# CLAUDE.md — plasma-ios (SDDS iOS)

Инструкции для AI-агента по этому репозиторию. Читай ЭТОТ файл вместо `grep` по всему
дереву: тут карта, команды и грабли. В каждом значимом пакете лежит свой `CLAUDE.md`
с деталями — открывай его перед работой внутри пакета.

## Что за проект

`plasma-ios` — адаптация дизайн-системы **SDDS** (Salute Design System) под iOS:
- библиотека компонентов на **SwiftUI + UIKit** (`SDDSComponents`);
- рантайм-ядро токенов темы (`DesignSystemBuilder/SDDSThemeCore`);
- CLI дизайн-системы `dsbuilder`: генерация тем из токенов DS Builder и сборка
  документационного бандла (`DesignSystemBuilder`);
- сгенерированные пакеты тем (`Themes/*`) и демо-песочница (`SDDSDemoApp`).

Платформа: iOS 14+, `swift-tools-version:5.3`. Пакеты — локальные SwiftPM (path-based),
объединены в `SDDS.xcworkspace`.

## Карта пакетов

| Путь | Что это | Детальный гайд |
|---|---|---|
| `SDDSComponents/` | Библиотека компонентов (SwiftUI+UIKit), ~387 файлов | [CLAUDE.md](SDDSComponents/CLAUDE.md) |
| `SDDSApiInfo/` | Маркерные макросы разметки API стилей (`@ApiName`, …) | — |
| `Tools/SDDSApiInfoGenerator/` | Сканер `*Appearance` → `ios-api-meta.json` | [CLAUDE.md](Tools/SDDSApiInfoGenerator/CLAUDE.md) |
| `DesignSystemBuilder/` | macOS CLI `dsbuilder` (темы + докбандл) и `SDDSThemeCore` | [CLAUDE.md](DesignSystemBuilder/CLAUDE.md) |
| `DesignSystemBuilder/SDDSThemeCore/` | Рантайм-типы токенов (портируемое ядро) | [CLAUDE.md](DesignSystemBuilder/SDDSThemeCore/CLAUDE.md) |
| `SDDSDemoApp/` | Демо/песочница компонентов, схемы per-DS | [CLAUDE.md](SDDSDemoApp/CLAUDE.md) |
| `SDDSIcons/` | Asset-бандл иконок (swiftgen) | [CLAUDE.md](SDDSIcons/CLAUDE.md) |
| `Themes/` | Сгенерированные пакеты тем (коммитятся) | [CLAUDE.md](Themes/CLAUDE.md) |
| `IntegrationCore/` | SandboxCore / SandboxDemoTheme / SandboxSwiftUI | [CLAUDE.md](IntegrationCore/CLAUDE.md) |
| `IntegrationTests/` | Интеграционный тест релизных xcframework'ов (приложение на тему + CI) | [CLAUDE.md](IntegrationTests/CLAUDE.md) |
| `scripts/` | Ruby/Bash: сборка, релиз, генерация | [CLAUDE.md](scripts/CLAUDE.md) |
| `SDDSComponentsFixtures/` | Тестовые фикстуры для компонентов | — |
| `Vendor/InputMask/` | Git submodule (RedMadRobot input-mask-ios) | — |

## Команды

Сборка XCFrameworks (всё или список модулей):
```sh
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace -m SDDSSwiftUI,SDDSIcons
```
Артефакты — в `/build` (в `.gitignore`).

Отдельный проект (сначала один раз собрать зависимости):
```sh
./scripts/build_all_static_dependencies.sh
cd SDDSComponents && xcodebuild -project SDDSComponents.xcodeproj -scheme SDDSComponents \
  -destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6' build
```
Список доступных симуляторов: `xcodebuild -destination 'platform=iOS Simulator' -showdestinations`.

Тесты:
```sh
ruby scripts/run_tests.rb        # swift test для DesignSystemBuilder + xcodebuild-схемы из скрипта
```

Линт:
```sh
./lint.sh                        # обёртка над swiftlint; конфиг .swiftlint.yml (line_length 190)
```

Демо-песочница — см. [SDDSDemoApp/CLAUDE.md](SDDSDemoApp/CLAUDE.md) (схемы `SDDSDemoApp`,
`SDDSDemoAppSDDSServ`, `SDDSDemoAppPlasmaB2C`, `SDDSDemoAppPlasmaHomeDS`).

## Конвенции

- **Conventional Commits**, сообщения — на английском. Скоуп = target, например
  `feat(sdds-acore/icons): ...`, `fix(sdds-icore/sandbox): ...`,
  `chore(sdds-ios/build-system): ...`. Полный список скоупов — в [CONTRIBUTING.md](CONTRIBUTING.md).
- **Без трейлеров** `Co-Authored-By` в коммитах (форсится `.claude/settings.json` →
  `includeCoAuthoredBy: false`).
- Ветвление — GitFlow: `feature/` отводится из `develop`. Не мержи в `develop`/`main`
  без явного разрешения владельца.
- Ширина строки Swift — до 190 символов (`.swiftlint.yml`).

## Где что лежит

- Точка входа CLI: `DesignSystemBuilder/DesignSystemBuilderCLI/main.swift`
  (подкоманды `themes` и `docs`), логика генерации тем —
  `DesignSystemBuilder/DesignSystemBuilderCore/App.swift`, документационный бандл —
  `DesignSystemBuilder/DocsAggregatorCore/`.
- Stencil-шаблоны токенов/компонентов — внутри `DesignSystemBuilder` (см. его гайд).
- Сгенерированный код тем — `Themes/<Name>Theme/` (НЕ править руками — регенерируется).
- Иконки — генерируются swiftgen в `SDDSIcons/Generated/`.
- Сборочные/релизные скрипты — `scripts/*.rb`, `scripts/*.sh`.
- Данные темы от DS Builder CLI — `DesignSystemBuilder/.sdds/` (токены/палитра в `.gitignore`,
  `config.json` — трекается).

## Грабли

- **Настройки сборки — в таргетах, не в командной строке `xcodebuild`.** `SDDSComponents`
  зависит от макро-пакета `SDDSApiInfo`, а настройки из командной строки применяются ко всем
  таргетам графа, включая macro-плагин: `MACH_O_TYPE`, `BUILD_LIBRARY_FOR_DISTRIBUTION`,
  `SKIP_INSTALL` и `-sdk` его ломают (плагин собирается статикой/резилиентно/под iOS и не
  грузится компилятором). Платформу задаём только через `-destination`.
- **Сгенерированные файлы не редактируем руками**: `Themes/*` и `SDDSIcons/Generated/*`
  перезатрутся генератором. Меняй шаблоны/токены-источники, потом регенерируй.
- Сборка отдельного проекта требует заранее собранных XCFrameworks
  (`build_all_static_dependencies.sh` или сборка через workspace).
- `Vendor/InputMask` — submodule: после клона `git submodule update --init`.
- `.sdds/` эфемерна: токены/палитра выгружаются DS Builder CLI и в git не попадают;
  при пустой `.sdds/` dsbuilder откатывается на zip-снапшот.
- **Имя `dsbuilder` занято дважды**: наш бинарь и внешний Kotlin/Native CLI
  `salute-developers/design-system-builder` (он выгружает `.sdds/` и печёт бандл
  документации из нашего дерева). В скриптах и доке зовём их по явным путям.
- CLI собирается SwiftPM'ом (`DesignSystemBuilder/Package.swift`), а не из
  `DesignSystemBuilder.xcodeproj` — в проекте остались только `SDDSThemeCore`,
  `SDDSTheme`, `SDDSDemo` и агрегатный таргет XCFramework.

## Локальный AI-режим (важно для биллинга)

Вся агентная работа — только в **интерактивном Claude Code** (подписка), без метерного API.
Правила — в [.claude/memory/local-mode-billing.md](.claude/memory/local-mode-billing.md).
Кратко: держи `ANTHROPIC_API_KEY` **unset**; не используй `claude -p` / headless; никаких
GitHub Actions и метерных вызовов.

## Память команды

Память команды — в [.claude/memory/](.claude/memory/) (читай перед задачей, дописывай при
решении). Индекс — [.claude/memory/MEMORY.md](.claude/memory/MEMORY.md). Ключевые решения по
проекту — [.claude/memory/plasma-ios-decisions.md](.claude/memory/plasma-ios-decisions.md).

## Процесс

- Локальный цикл работы — [docs/LOCAL_WORKFLOW.md](docs/LOCAL_WORKFLOW.md).
- Как ставить задачу агенту — [docs/TASK_GUIDE.md](docs/TASK_GUIDE.md).
- Необязательный локальный бэклог — [docs/BACKLOG.md](docs/BACKLOG.md).
- Документационный бандл (как собрать и отдать в dsbuilder) — [docs/DOCS_BUNDLE.md](docs/DOCS_BUNDLE.md).
- Контракт переносимости пакетов/знаний — [project.yml](project.yml).
