# scripts

Сборочные, релизные и генерационные скрипты (Ruby + Bash, немного Python). Запускаются
**из корня репозитория** — пути внутри относительные. Общие хелперы — `common.rb`.

Зависимости: Bundler (`Gemfile`: fastlane, rubyzip) плюс отдельно `gem install xcodeproj json`
для скриптов генерации проектов.

## Сборка

| Скрипт | Что делает |
|---|---|
| `build_xcframeworks.rb` | XCFrameworks: всё или `-m Mod1,Mod2`. Артефакты — в `build/` |
| `build_all_static_dependencies.sh` | весь набор зависимостей: SDDSThemeCore → SDDSComponents + SDDSIcons → InputMask → все темы |
| `build_themes.rb [Theme…]` | XCFrameworks тем; артефакты — в `Themes/build/` |
| `build_inputmask.rb` | сборка вендорного InputMask |
| `build_integrationcore_xcframeworks.rb` | сборка пакетов песочницы |
| `sync_xcode_projects.rb` | синхронизация Xcode-проектов |

## Тесты и проверки

| Скрипт | Что делает |
|---|---|
| `run_tests.rb` | `swift test` для `DesignSystemBuilder` + Xcode-схемы из массива `modules` внутри скрипта |
| `capture_component_fixtures.sh` | съём скриншотов сэмплов компонентов |
| `ios_sims.sh` | работа со списком симуляторов |

## Генерация

| Скрипт | Что делает |
|---|---|
| `generate_api_meta.sh` | `ios-api-meta.json` из `SDDSComponents` (см. [SDDSApiInfoGenerator](../Tools/SDDSApiInfoGenerator/README.md)) |
| `generate_themes/generate_themes.rb` | для каждой темы из JSON-конфига запускает CLI `dsbuilder`, затем `create_project.rb` ([README](generate_themes/README.md)) |
| `create_project/create_project.rb` | per-theme Xcode-проект + подключение `SDDSThemeCore.xcframework` ([README](create_project/README.md)) |
| `generate_docs_bundle.sh` | дерево документационного бандла: `dsbuilder docs extract` + `docs aggregate` |
| `generate_sandbox_stories.py` | регистрации stories для песочницы; подключён в Build Phases |
| `fetch_sdds.sh` | наполняет `DesignSystemBuilder/.sdds/` через внешний Kotlin/Native `dsbuilder` |

`fetch_sdds.sh` берёт идентификаторы и ключ из окружения: `DSBUILDER_API_KEY`,
`DSBUILDER_PROJECT_ID`, `DSBUILDER_DESIGN_SYSTEM_ID`. Токены и палитра — в `.gitignore`.

## Релиз и версии

| Скрипт | Что делает |
|---|---|
| `release/build_release.sh <tag>` | все ассеты релиза в `release-artifacts/`; `--skip-cli` — без dsbuilder |
| `release/update_release_manifest.rb <tag> [--check]` | перегенерирует `release-manifest.json` из опубликованного релиза; `--check` падает, если файл устарел |
| `package_sources.sh <version>` | архив исходников `SDDSSources-<version>.zip` для режима `--standalone --sources-version` |
| `bump-versions.sh`, `bump_version.rb`, `update_versions_archived.rb` | версии модулей |
| `changed-modules.sh` | какие модули изменились |
| `parse-changelog.sh`, `build-release-announcement.sh` | changelog и анонс |
| `release_sync/` | обновление клиентских зависимостей ([README](release_sync/README.md)) |

`release-manifest.json` собирается из самого релиза: версии берутся из `MARKETING_VERSION`
таргетов на релизном теге, имена ассетов и ссылки — из опубликованных ассетов. Библиотека,
которой в текущем релизе нет (иконки), остаётся указывать на последний релиз, где она была.

Публикация релиза — один прогон `.github/workflows/publish-release.yml` (workflow_dispatch на
`main`): `release/build_release.sh` → тег → draft-релиз → upload ассетов → снятие draft. Вход
`dry_run` собирает ассеты без тега и релиза, поэтому воркфлоу можно проверять с любой ветки.

## Грабли

- Скрипты рассчитаны на запуск из корня репозитория.
- Список путей в `package_sources.sh` держите синхронным с `App.sourcesRootURL` в
  `DesignSystemBuilder` — иначе standalone-режим не соберётся у клиента.
- `.sdds/`-данные эфемерны и в git не коммитятся, кроме `config.json`.
- Коммит-скоуп изменений в сборке: `sdds-ios/build-system`.
