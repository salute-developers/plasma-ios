# CLAUDE.md — scripts

Сборочные, релизные и генерационные скрипты (Ruby + Bash, немного Python/JS). Запускаются
из корня репозитория. Общие хелперы — `common.rb`.

## Сборка

- `build_xcframeworks.rb` — сборка XCFrameworks (всё или `-m Mod1,Mod2`). Артефакты в `/build`.
- `build_all_static_dependencies.sh` — собрать статические зависимости (нужно перед сборкой
  отдельного проекта без workspace).
- `build_artifacts.rb`, `build_inputmask.rb`, `build_integrationcore_xcframeworks.rb`,
  `build_themes.rb` — сборка отдельных частей.

## Тесты

- `run_tests.rb` — `swift test` для пакета `DesignSystemBuilder` плюс Xcode-схемы из
  массива `modules` внутри скрипта (`xcodebuild ... test`).

## Генерация тем и проектов

- `generate_themes/generate_themes.rb` — для каждой темы из JSON-конфига запускает CLI
  `dsbuilder`, затем `create_project.rb`. Требует Ruby-гем `xcodeproj`, собранный
  `SDDSThemeCore.xcframework` и бинарник `dsbuilder`.
- `create_project/create_project.rb` — создаёт per-theme Xcode-проект и подключает
  `SDDSThemeCore.xcframework`.
- `generate_docs_bundle.sh` — собирает дерево документационного бандла: `dsbuilder docs
  extract` + `dsbuilder docs aggregate` (см. [../docs/DOCS_BUNDLE.md](../docs/DOCS_BUNDLE.md)).
- `fetch_sdds.sh` — наполняет `DesignSystemBuilder/.sdds/` данными DS через внешний
  Kotlin/Native `dsbuilder` (не путать с нашим бинарником того же имени).
  Идентификаторы/ключ — из окружения (`DSBUILDER_API_KEY`, `DSBUILDER_PROJECT_ID`,
  `DSBUILDER_DESIGN_SYSTEM_ID`); токены/палитра в `.gitignore`.

## Релиз / версии

- `bump-versions.sh`, `bump_version.rb`, `update_versions_archived.rb` — версии модулей.
- `changed-modules.sh` — какие модули изменились.
- `parse-changelog*.{js,rb,sh}` — обработка changelog.
- `release_sync/`, `dispatch-publish.sh`, `build-release-announcement.sh` — релизные шаги.
- `package_sources.sh <version>` — архив исходников `SDDSSources-<version>.zip` для релиза
  (`build/`). Его забирает `dsbuilder` в режиме `--standalone --sources-version <tag>`,
  поэтому внутри сохранено дерево путей репозитория. Список путей держи синхронным с
  `App.sourcesRootURL` в [../DesignSystemBuilder/CLAUDE.md](../DesignSystemBuilder/CLAUDE.md).

## Грабли

- Скрипты рассчитаны на запуск из корня репозитория (пути относительные).
- Ruby-зависимости — через Bundler (`Gemfile`: fastlane, rubyzip) + отдельно `gem install
  xcodeproj json` для генерации проектов.
- `.sdds/`-данные эфемерны и в git не коммитятся (кроме `config.json`).
- Коммит-скоуп изменений в сборке: `sdds-ios/build-system`.
