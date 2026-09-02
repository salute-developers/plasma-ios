# CLAUDE.md — DesignSystemBuilder

`dsbuilder` — единый macOS CLI дизайн-системы SDDS под iOS. Две задачи в одном бинаре:

- **`themes`** (подкоманда по умолчанию) — берёт схему темы и палитру, декодирует JSON и по
  Stencil-шаблонам генерирует токены (цвета, типографику, тени, формы, отступы, градиенты)
  и вариации компонентов в `Themes/<Name>Theme`.
- **`docs extract` / `docs aggregate`** — собирают дерево документационного бандла:
  сканируют `// @DocSample`, рендерят маркеры и раскладывают контент в `.sdds/temp/docs`
  (см. [../docs/DOCS_BUNDLE.md](../docs/DOCS_BUNDLE.md)).

> Не путать с внешним `dsbuilder` из `salute-developers/design-system-builder` (Kotlin/Native):
> тот выгружает `.sdds/` и печёт готовый бандл из подготовленного нами дерева. Имена совпадают —
> в скриптах зовём оба по явным путям.

## Структура

- `DesignSystemBuilderCLI/` — точка входа (`main.swift`) и подкоманды
  (`GenerateThemes.swift`, `DocsCommands.swift`).
- `DesignSystemBuilderCore/` — логика генерации тем (`App.swift`), Stencil-шаблоны.
- `DocsAggregatorCore/` — сканер сэмплов, рендер маркеров и раскладка докбандла.
- `SDDSThemeCore/` — рантайм-типы токенов (портируемое ядро) — см.
  [SDDSThemeCore/CLAUDE.md](SDDSThemeCore/CLAUDE.md).
- `SDDSThemeUtilities/` — вспомогательные утилиты.
- `DesignSystemBuilderCoreTests/`, `DocsAggregatorCoreTests/`, `SDDSThemeCoreTests/`,
  `SDDSThemeTests/` — тесты.
- `LocalSchemes/`, `Playground/` — локальные схемы и песочница для отладки.
- `DesignSystemBuilder.xcodeproj`, `build_cli.sh` — сборка.

Тип: SwiftPM-пакет `DesignSystemBuilder` (`Package.swift`), продукт — executable `dsbuilder`.
Зависимости: `swift-argument-parser`, `Stencil`, `PathKit`, `swift-syntax`.
`DesignSystemBuilder.xcodeproj` остался только под то, чего SwiftPM не умеет:
`SDDSThemeCore.xcframework`, `SDDSTheme` и `SDDSDemo`.

## Сборка и запуск CLI

Из каталога `DesignSystemBuilder/`:
```sh
./build_cli.sh                 # Release (по умолчанию)
./build_cli.sh --debug         # Debug
./build_cli.sh --run           # собрать и запустить с default-конфигом
./build_cli.sh --run cfg.json  # запустить с внешним JSON-конфигом
./build_cli.sh --run docs extract --repo-root ..
./build_cli.sh --help
```
Результат: `DesignSystemBuilder/build/dsbuilder/dsbuilder` — самодостаточный бинарник,
фреймворка рядом больше нет. `build/` в `.gitignore`.

Напрямую через SwiftPM: `swift build --package-path DesignSystemBuilder -c release --product dsbuilder`.

Кастомный выходной каталог — опция `-o/--output`.

## Standalone-бандл и исходники с релиза

`--standalone [--components]` собирает плоскую папку `.swift` (`StandaloneBundle.swift`).
Вендоримые исходники и пакет темы берутся от `sourcesRootURL` (`App.swift`), приоритет:

1. `--sources-version <tag>` — архив `SDDSSources-<tag>.zip` с GitHub Release; скачивает и
   распаковывает `SourcesRelease/SourcesReleaseFetcher.swift` в `generationRootURL`, то есть
   рядом со сгенерированными токенами (`<output>/SDDSSources-<tag>`). Требует `--standalone`,
   несовместим с `--sources-root`. `--sources-url` / `--sources-repository` — переопределения.
2. `--sources-root <dir>` — распакованная копия исходников.
3. корень репозитория.

Архив собирает [../scripts/package_sources.sh](../scripts/package_sources.sh), публикует
`.github/workflows/publish-release.yml`. **Список путей в скрипте обязан совпадать с тем,
что читает `App.sourcesRootURL`** — иначе бандл соберётся молча неполным (на этот случай
есть guard'ы `StandaloneBundle.runGuards` и проверка layout-маркера в фетчере).

## Что откуда берётся

- Состав компонентов темы и имена файлов конфигов — из индекса DS
  `components/<theme>/meta.json` (theme-converter). Генерятся только вариации, которые
  в теме есть; чего iOS не умеет — печатается в лог.
- Значения enum-свойств — из меты (`valueEnum`): case'ы, их id в конфиге и дефолт
  задаются аннотациями на самом enum'е, отдельного реестра в генераторе нет.
- Имена `*Appearance`/`*SizeConfiguration` — из `.sdds/ios-api-meta.json` (см.
  [../Tools/SDDSApiInfoGenerator/CLAUDE.md](../Tools/SDDSApiInfoGenerator/CLAUDE.md)),
  руками в генераторе не дублируются.
- Связка «компонент → тип стиля» объявлена в самой библиотеке —
  `@ApiInfo(components: [...])` на `*Appearance`, как на Android — и приезжает в мету.
  Вывести её из данных нельзя: группировка по типам iOS не совпадает с группировкой DS
  (у DS `basic-button`/`icon-button` — разные компоненты, на iOS это один
  `ButtonAppearance`; и наоборот, один DS `tab-bar` — это `TabBar` и `TabBarIsland`).

## Источник темы

`.sdds/ios-api-meta.json` — продукт сборки, не коммитится: генерится
`scripts/generate_api_meta.sh`, который вызывают `build_cli.sh` и `run_tests.rb`.

Приоритет: локальная `.sdds/`-директория DS Builder → удалённый/локальный zip-снапшот.
`.sdds/` наполняется `scripts/fetch_sdds.sh` (DS Builder CLI). Токены/палитра в `.sdds/`
под `.gitignore`; `config.json` — трекается. Если `.sdds/` пуст — откат на zip
(`localSchemePath`).

## Тесты

```sh
swift test --package-path .    # DesignSystemBuilderCoreTests + DocsAggregatorCoreTests
ruby ../scripts/run_tests.rb   # то же самое из корня репозитория
```

## Грабли

- Генерация тем перезаписывает `Themes/<Name>Theme/` — правь шаблоны/токены, не результат.
- Полный конвейер «токены → пакеты тем → Xcode-проекты» — `scripts/generate_themes/` +
  `scripts/create_project/` (см. [../scripts/CLAUDE.md](../scripts/CLAUDE.md)).
- Меняешь публичное appearance-API в `SDDSComponents`? Регенерируй темы и убедись, что
  шаблоны/типы совпадают.
- Коммит-скоуп: `sdds-icore/theme-builder`.
