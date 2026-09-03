# CLAUDE.md — DesignSystemBuilder

`dsbuilder` — macOS CLI дизайн-системы: подкоманда `themes` генерирует `Themes/<Name>Theme`,
подкоманда `docs` собирает документационный бандл.

**Структура пакета, сборка бинаря, все аргументы CLI, конфиг, standalone-режим и два
генератора стилей — [README.md](README.md). Читай его вместо `grep`.**

> Не путать с внешним `dsbuilder` из `salute-developers/design-system-builder` (Kotlin/Native):
> тот выгружает `.sdds/` и печёт готовый бандл из подготовленного нами дерева. Имена совпадают —
> в скриптах зовём оба по явным путям.

## Что откуда берётся

- Состав компонентов темы и имена файлов конфигов — из индекса DS
  `components/<theme>/meta.json` (theme-converter). Генерятся только вариации, которые в теме
  есть; чего iOS не умеет — печатается в лог.
- Значения enum-свойств — из меты (`valueEnum`): case'ы, их id в конфиге и дефолт задаются
  аннотациями на самом enum'е, отдельного реестра в генераторе нет.
- Имена `*Appearance` / `*SizeConfiguration` — из `.sdds/ios-api-meta.json` (см.
  [../Tools/SDDSApiInfoGenerator/README.md](../Tools/SDDSApiInfoGenerator/README.md)), руками
  в генераторе не дублируются.
- Связка «компонент → тип стиля» объявлена в самой библиотеке — `@ApiInfo(components: [...])`
  на `*Appearance` — и приезжает в мету. Вывести её из данных нельзя: группировка по типам iOS
  не совпадает с группировкой DS (у DS `basic-button`/`icon-button` — разные компоненты, на iOS
  это один `ButtonAppearance`; и наоборот, один DS `tab-bar` — это `TabBar` и `TabBarIsland`).

## Источник темы

Приоритет: локальная `.sdds/`-директория DS Builder → удалённый/локальный zip-снапшот.
`.sdds/` наполняется `scripts/fetch_sdds.sh`. Токены и палитра в `.gitignore`, `config.json`
трекается. Если `.sdds/` пуст — откат на zip (`localSchemePath`).

`.sdds/ios-api-meta.json` — продукт сборки, не коммитится: генерится
`scripts/generate_api_meta.sh`, который вызывают `build_cli.sh` и `run_tests.rb`.

## Грабли

- Генерация тем **перезаписывает** `Themes/<Name>Theme/` — правь шаблоны и токены, не результат.
- **Список путей в `package_sources.sh` обязан совпадать с тем, что читает
  `App.sourcesRootURL`** — иначе standalone-бандл соберётся молча неполным (на этот случай есть
  guard'ы `StandaloneBundle.runGuards` и проверка layout-маркера в фетчере).
- Меняешь публичное appearance-API в `SDDSComponents`? Регенерируй темы и убедись, что шаблоны
  и типы совпадают.
- Полный конвейер «токены → пакеты тем → Xcode-проекты» — `scripts/generate_themes/` +
  `scripts/create_project/` (см. [../scripts/README.md](../scripts/README.md)).
- Тесты: `swift test --package-path .` или `ruby ../scripts/run_tests.rb` из корня.
- Коммит-скоуп: `sdds-icore/theme-builder`.
