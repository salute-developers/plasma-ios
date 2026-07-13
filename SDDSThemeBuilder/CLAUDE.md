# CLAUDE.md — SDDSThemeBuilder

CLI-утилита (macOS command-line tool) генерации Swift-кода тем SDDS под iOS. Берёт схему
темы и палитру, декодирует JSON и по Stencil-шаблонам генерирует токены (цвета,
типографику, тени, формы, отступы, градиенты) и вариации компонентов в `Themes/<Name>Theme`.

## Структура

- `SDDSThemeBuilder/` — точка входа CLI (`main.swift`).
- `SDDSThemeBuilderCore/` — логика генерации (`App.swift`), Stencil-шаблоны.
- `SDDSThemeCore/` — рантайм-типы токенов (портируемое ядро) — см.
  [SDDSThemeCore/CLAUDE.md](SDDSThemeCore/CLAUDE.md).
- `SDDSThemeUtilities/` — вспомогательные утилиты.
- `SDDSThemeBuilderCoreTests/`, `SDDSThemeCoreTests/`, `SDDSThemeTests/` — тесты.
- `LocalSchemes/`, `Playground/` — локальные схемы и песочница для отладки.
- `SDDSThemeBuilder.xcodeproj`, `build_cli.sh` — сборка.

Тип: target `SDDSThemeBuilder` внутри `SDDSThemeBuilder.xcodeproj` (отдельного SwiftPM
манифеста у CLI нет — сборка через `xcodebuild`). Зависимости `swift-argument-parser`,
`Stencil`, `PathKit` резолвятся Xcode через SwiftPM автоматически.

## Сборка и запуск CLI

Из каталога `SDDSThemeBuilder/`:
```sh
./build_cli.sh                 # Release (по умолчанию)
./build_cli.sh --debug         # Debug
./build_cli.sh --run           # собрать и запустить с default-конфигом
./build_cli.sh --run cfg.json  # запустить с внешним JSON-конфигом
./build_cli.sh --help
```
Результат: `SDDSThemeBuilder/build/themebuilder/SDDSThemeBuilder` (бинарник линкует
`SDDSThemeBuilderCore.framework` рядом через rpath `@loader_path/.` — запускать из этого
каталога, не выдёргивая один бинарник). `build/` в `.gitignore`.

Кастомный выходной каталог — опция `-o/--output`.

## Источник темы

Приоритет: локальная `.sdds/`-директория DS Builder → удалённый/локальный zip-снапшот.
`.sdds/` наполняется `scripts/fetch_sdds.sh` (DS Builder CLI). Токены/палитра в `.sdds/`
под `.gitignore`; `config.json` — трекается. Если `.sdds/` пуст — откат на zip
(`localSchemePath`).

## Тесты

```sh
ruby ../scripts/run_tests.rb   # прогоняет SDDSThemeBuilderCoreTests (macOS)
```

## Грабли

- Генерация тем перезаписывает `Themes/<Name>Theme/` — правь шаблоны/токены, не результат.
- Полный конвейер «токены → пакеты тем → Xcode-проекты» — `scripts/generate_themes/` +
  `scripts/create_project/` (см. [../scripts/CLAUDE.md](../scripts/CLAUDE.md)).
- Меняешь публичное appearance-API в `SDDSComponents`? Регенерируй темы и убедись, что
  шаблоны/типы совпадают.
- Коммит-скоуп: `sdds-icore/theme-builder`.
