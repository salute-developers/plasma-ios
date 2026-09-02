# DesignSystemBuilder

`dsbuilder` — единый CLI дизайн-системы SDDS под iOS. Один бинарник, две подкоманды:

| Подкоманда | Что делает |
| --- | --- |
| `themes` (по умолчанию) | Берёт схему темы и палитру (из локальной `.sdds`-директории DS Builder либо из удалённого/локального zip-архива), декодирует JSON и по Stencil-шаблонам генерирует токены (цвета, типографику, тени, формы, отступы, градиенты) и вариации компонентов в `Themes/<Name>Theme`. Источник темы выбирается по приоритету — см. [«Источник темы»](#источник-темы-sdds-ds-builder-или-remotezip). |
| `docs extract` / `docs aggregate` | Собирают дерево документационного бандла: сканируют `// @DocSample`, рендерят маркеры и раскладывают контент в `.sdds/temp/docs`. См. [../docs/DOCS_BUNDLE.md](../docs/DOCS_BUNDLE.md). |

Старый вызов без подкоманды (`dsbuilder cfg.json -o ./Themes`) продолжает работать —
`themes` подставляется автоматически.

> ⚠️ Имя `dsbuilder` носит и внешний Kotlin/Native CLI из
> [`salute-developers/design-system-builder`](https://github.com/salute-developers/design-system-builder),
> который выгружает `.sdds/` и печёт готовый бандл документации из подготовленного нами
> дерева. Это разные бинарники — в скриптах зовите их по явным путям.

- **Тип:** SwiftPM-пакет `DesignSystemBuilder` ([`Package.swift`](Package.swift)),
  продукт — executable `dsbuilder`. `DesignSystemBuilder.xcodeproj` остался только под
  `SDDSThemeCore.xcframework`, `SDDSTheme` и `SDDSDemo`.
- **Точка входа:** [`DesignSystemBuilderCLI/main.swift`](DesignSystemBuilderCLI/main.swift);
  генерация тем — [`DesignSystemBuilderCore/App.swift`](DesignSystemBuilderCore/App.swift),
  документационный бандл — [`DocsAggregatorCore/`](DocsAggregatorCore).
- **Зависимости:** `swift-argument-parser`, `Stencil`, `PathKit`, `swift-syntax`.

---

## Сборка бинарника

Из каталога `DesignSystemBuilder/`:

```sh
./build_cli.sh
```

Скрипт собирает продукт `dsbuilder` в конфигурации Release и кладёт
самодостаточный бинарник в:

```
DesignSystemBuilder/build/dsbuilder/dsbuilder
```

Фреймворка рядом больше нет — файл можно копировать куда угодно.
(`build/` в `.gitignore`, поэтому артефакт не коммитится.)

### Опции скрипта

```sh
./build_cli.sh            # Release (по умолчанию)
./build_cli.sh --debug    # Debug-сборка
./build_cli.sh --run      # собрать и сразу запустить с default-конфигом
./build_cli.sh --run cfg.json   # собрать и запустить с внешним JSON-конфигом
./build_cli.sh --run docs extract --repo-root ..   # подкоманды докбандла
./build_cli.sh --help     # справка
```

### Ручная сборка (без скрипта)

```sh
swift build --package-path . -c release --product dsbuilder

# бинарник:
"$(swift build --package-path . -c release --product dsbuilder --show-bin-path)/dsbuilder"
```

### Требования

- macOS + Xcode / toolchain Swift 5.9+ (проверено на Xcode 26.x).
- Доступ в сеть на этапе **запуска** (а не сборки) — бинарник скачивает
  scheme-архивы и палитру. Исключение: темы с `localSchemePath` берут схему из
  локального snapshot-ZIP (например, `PlasmaHomeDS`).

---

## Запуск

```sh
# 1. С конфигом по умолчанию (3 темы: SDDSServ, PlasmaB2C, PlasmaHomeDS)
./build/dsbuilder/dsbuilder

# 2. С внешним JSON-конфигом (обычный путь или URL — оба варианта работают)
./build/dsbuilder/dsbuilder /path/to/config.json
./build/dsbuilder/dsbuilder file:///abs/path/to/config.json

# 3. С перенаправлением вывода в свою директорию
./build/dsbuilder/dsbuilder /path/to/config.json --output /path/to/out
./build/dsbuilder/dsbuilder -o /path/to/out
```

Аргументы CLI:

| Аргумент | Описание |
| --- | --- |
| `[config]` (позиционный, необязательный) | Путь или URL к JSON-конфигу. Принимается как обычный путь в ФС (абсолютный или относительный от текущей директории), так и URL со схемой (`file://`, `http(s)://`). Если не передан или файл не читается — используется встроенный default-конфиг из [`Config.swift`](DesignSystemBuilderCore/Config.swift). |
| `-o, --output <dir>` | Директория для сгенерированных тем. Если задана — каждая тема пишется в `<dir>/<ThemeName>Theme`. Если не задана — поведение прежнее (`<repo>/Themes`). |
| `--standalone` | Собрать **автономный** бандл темы (`<ThemeName>ThemeSources`) — плоскую папку `.swift`, компилируемую одним модулем без линковки наших библиотек. См. [«Автономные исходники»](#автономные-исходники-standalone). |
| `--components` | Аддитивно к `--standalone`: включить в бандл слой компонентов (иначе — только токены). |
| `--standalone-output <dir>` | Куда класть автономный бандл. По умолчанию — `./SDDSStandalone` относительно текущей рабочей директории запуска. |
| `--external-dependencies` | Вендорить исходники внешних зависимостей (`InputMask`) в бандл. По умолчанию они **не** копируются — `import InputMask` сохранён, клиент линкует модуль сам. |
| `--core-sources <dir>` | Путь к исходникам `SDDSThemeCore` для встраивания в бандл. По умолчанию — от `--sources-root`. |
| `--sources-root <dir>` | Корень вендоримых исходников (библиотеки + пакет темы). По умолчанию — корень репозитория. Позволяет запускать CLI **вне** plasma-ios, указав распакованную копию исходников (напр. артефакт релиза). |
| `--sources-version <tag>` | Версия исходников: архив забирается с GitHub Release по тегу и распаковывается туда же, куда генерируются токены. Заменяет `--sources-root` (вместе они запрещены) и требует `--standalone`. См. [«Исходники с релиза»](#исходники-с-релиза---sources-version). |
| `--sources-url <url>` | Явный адрес архива исходников (в т.ч. `file://`) вместо ассета релиза. |
| `--sources-repository <owner/repo>` | GitHub-репозиторий, с релизов которого берётся архив. По умолчанию `salute-developers/plasma-ios`. |
| `--typed-generator` | Генерировать стили компонентов **старым** (типизированным) путём вместо универсального. То же самое делает переменная окружения `SDDS_TYPED_GENERATOR=1`. См. [«Два генератора стилей»](#два-генератора-стилей). |

---

## Документационный бандл (`docs`)

Подкоманды готовят дерево, которое затем скармливается **внешнему** `dsbuilder`
(Kotlin/Native) командой `docs generate --platform swiftui`. Подробности конвейера —
[../docs/DOCS_BUNDLE.md](../docs/DOCS_BUNDLE.md); обёртка над обоими шагами —
`scripts/generate_docs_bundle.sh`.

```sh
# 1. Извлечь сэмплы `// @DocSample` в samples.json + сниппеты
./build/dsbuilder/dsbuilder docs extract --repo-root .. --report \
  --emit-registry SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Generated/DocSamplesRegistry.swift

# 2. Собрать дерево бандла для темы
./build/dsbuilder/dsbuilder docs aggregate --repo-root .. --theme PlasmaHomeDS \
  --screenshots ../Themes/PlasmaHomeDSTheme/docs/screenshots --report
```

| Флаг | Подкоманда | Описание |
| --- | --- | --- |
| `--repo-root <dir>` | обе | Корень репозитория. |
| `--core-samples <dir>`, `--theme-samples <dir>` | `extract` | Дополнительные каталоги со сэмплами. |
| `--emit-registry <file>` | `extract` | Куда сгенерировать `DocSamplesRegistry.swift` для скриншот-тестов. |
| `--theme <Name>` | `aggregate` | Тема, для которой собирается бандл. |
| `--samples <file>` | `aggregate` | Путь к `samples.json` от шага `extract`. |
| `--screenshots <dir>` | `aggregate` | Каталог PNG-скриншотов сэмплов. |
| `--artifact-version <v>` | `aggregate` | Версия артефакта в метаданных бандла. |
| `--output <dir>` | `aggregate` | Куда положить дерево (по умолчанию `.sdds/temp/docs`). |
| `--report` | обе | Печатать отчёт о проделанной работе. |

## Два генератора стилей

Стили компонентов (`<Component>Size/Typography/+BaseVariations/+Variations.swift`)
собираются одним из двух путей. Токены, шрифты и `Theme.swift` от выбора не зависят.

| | Универсальный (по умолчанию) | Типизированный (`--typed-generator`) |
| --- | --- | --- |
| Откуда состав свойств | `.sdds/ios-api-meta.json` — слепок `*Appearance` из `SDDSComponents` | хендмейд `*Props`/`*Appearance`/`*Size` на компонент в `DesignSystemBuilderCore/Model/Components` |
| Новый компонент | появляется после регенерации меты | нужно писать три структуры руками |
| Статус | основной | остаётся как эталон для теста паритета и как аварийный откат |

```sh
# универсальный (по умолчанию)
./build_cli.sh --run

# типизированный
./build_cli.sh --run --typed-generator
SDDS_TYPED_GENERATOR=1 ./build_cli.sh --run
```

Мета обновляется отдельно, из исходников компонентов:

```sh
./scripts/generate_api_meta.sh     # → DesignSystemBuilder/.sdds/ios-api-meta.json
```

Компонент идёт универсальным путём, если он есть в мете; иначе автоматически
используется типизированный. Сейчас так генерируются 118 из 120 компонентов —
исключения `CollapsingNavigationBar*` (типизированная модель устарела).

### Куда пишется результат

**Сгенерированные темы** (`<ThemeName>Theme`):

- по умолчанию (без `--output`) — в `Themes/<ThemeName>Theme` относительно корня
  репозитория;
- с `--output <dir>` — в `<dir>/<ThemeName>Theme` (относительные пути резолвятся
  от текущей рабочей директории запуска).

> ⚠️ **Про дефолтный путь.** Без `--output` путь генерации не зависит от текущей
> директории запуска: он вычисляется от `#file` — абсолютного пути `main.swift`,
> **зашитого в бинарник на этапе компиляции** (см. `App.swift`,
> `designSystemBuilderURL`). То есть бинарник пишет результат **в то дерево исходников,
> из которого был собран**. Если перенести/переименовать репозиторий —
> **пересоберите** бинарник либо используйте `--output`.

**Прочее** (на путь которого `--output` не влияет — это внутренние артефакты):

| Что | Куда |
| --- | --- |
| Временные скачанные/распакованные схемы и палитра | `$TMPDIR/DesignSystemBuilder/Output/<ThemeName>/` |
| Тенанты темы | `…/Output/<ThemeName>/tenants/<Tenant>/` |

> Этот scratch лежит в системном temp, а не в дереве репозитория: бинарь должен
> одинаково работать и на машине клиента. `--output` его не переносит — туда
> уходит только финальный сгенерированный код.

---

## Автономные исходники (standalone)

Режим `--standalone` собирает тему как **плоскую папку `.swift`**
(`<ThemeName>ThemeSources`), которую можно подключить к чужому проекту **без
линковки наших библиотек** (`SDDSThemeCore`, `SDDSComponents`, `SDDSIcons`) и
обфусцировать своими средствами. Вся папка компилируется как **один модуль**.

Два уровня:

- **Только токены** (`--standalone`): сгенерированные токены + вендоренный
  `SDDSThemeCore` + сгенерированный `Theme.swift`. Лёгкий вариант, без ресурсов и
  без внешних зависимостей.
- **Токены + компоненты** (`--standalone --components`): дополнительно —
  вендоренные `SDDSComponents` / `SDDSIcons` (исходник `Asset` + каталоги
  `Assets.xcassets`), вариации компонентов темы и регистрация дефолтных appearance.
  Сторонняя `InputMask` (маскирование ввода в текстовых полях) по умолчанию
  **остаётся внешней зависимостью** — см. [«InputMask»](#inputmask-внешняя-зависимость).

```sh
cd DesignSystemBuilder
./build_cli.sh

# Только токены выбранной темы → ./SDDSStandalone/<ThemeName>ThemeSources
./build/dsbuilder/dsbuilder file:///path/to/config.json --standalone

# Токены + компоненты
./build/dsbuilder/dsbuilder file:///path/to/config.json --standalone --components

# В свою директорию
./build/dsbuilder/dsbuilder file:///path/to/config.json --standalone --components \
  --standalone-output /path/to/out
# → /path/to/out/<ThemeName>ThemeSources

# Токены + компоненты, InputMask вендорится в бандл (полностью автономно)
./build/dsbuilder/dsbuilder file:///path/to/config.json --standalone --components \
  --external-dependencies
```

**Куда пишется бандл:** `--standalone-output <dir>`; по умолчанию —
`./SDDSStandalone` относительно **текущей рабочей директории запуска** (не пути
сборки: бинарь должен одинаково работать и у клиента). Внутри — папка
`<ThemeName>ThemeSources` на каждую тему из конфига.

**Куда пишется промежуточное:** токены, `FontsManifest` и — при
`--sources-version` — распакованные исходники кладутся в общий корень генерации:
`-o <dir>`, если он задан, иначе `$TMPDIR/DesignSystemBuilder/standalone-work`.
В обоих случаях закоммиченные `Themes/*` **не перезаписываются**.

> Из-за этого в примере ниже с одним лишь `--standalone-output` бандл окажется в
> `./out`, а распакованные исходники — во временном каталоге. Если хотите видеть
> их рядом с бандлом, добавьте `-o ./out`.

**Подключение у клиента:** положить папку (вместе с `.xcassets` для уровня с
компонентами) в свой target и вызвать `Theme.initialize(tenant:)`; токены доступны
напрямую (`Colors.<token>` и т.д.), для уровня с компонентами — `View.subtheme(_:)`.
Для уровня с компонентами (без `--external-dependencies`) клиент дополнительно
подключает `InputMask` как зависимость (см. ниже).

> Каждый `.swift` бандла начинается с шапки `// Code generated … DO NOT EDIT`:
> файлы перегенерируются при обновлении, ручные правки перетрутся.

### Откуда берутся исходники (запуск вне репозитория)

Вендоримые исходники (ядро, компоненты, иконки, `InputMask`) и **пакет темы**
(`Themes/<Name>Theme` — вариации компонентов + `DefaultValues`) берутся от
`--sources-root` (по умолчанию — корень репозитория). Чтобы запускать CLI **вне**
plasma-ios, укажите `--sources-root <dir>` на распакованную копию исходников
(напр. артефакт релиза с тем же деревом путей); `--core-sources` при необходимости
переопределяет только корень `SDDSThemeCore`.

### Исходники с релиза (`--sources-version`)

Копию исходников не обязательно добывать руками: каждый релиз публикует архив
`SDDSSources-<tag>.zip`, и CLI умеет забирать его сам. Клиенту достаточно бинаря
и номера версии — доступ к репозиторию не нужен.

#### Сценарий целиком (у клиента нет чекаута репозитория)

Оба артефакта лежат ассетами одного релиза, тег общий:

```sh
TAG=release-18-08-2026
```

**1. Скачать и распаковать CLI.** В архиве самодостаточный бинарь `dsbuilder`
и `ios-api-meta.json` — фреймворка рядом больше нет, файл можно копировать куда угодно.

```sh
gh release download "$TAG" --repo salute-developers/plasma-ios \
  --pattern "dsbuilder-cli-$TAG.zip"
unzip -q "dsbuilder-cli-$TAG.zip" && cd dsbuilder-cli
```

**2. Подготовить конфиг.** Минимальный рабочий конфиг для запуска вне репозитория —
только `paletteURL` и темы с `url`. См. [«Конфигурация»](#конфигурация); поля
`localSchemePath` и `sddsConfigPath` вне репозитория **не работают** — подробности
там же.

```json
{
  "paletteURL": "https://raw.githubusercontent.com/salute-developers/plasma/dev/packages/plasma-colors/palette/general.json",
  "themes": [
    {
      "name": "SDDSServ",
      "url": "https://github.com/salute-developers/theme-converter/raw/refs/heads/main/themes/sdds_serv/latest.zip"
    }
  ]
}
```

**3. Собрать бандл нужной версии.**

```sh
./dsbuilder ./config.json --standalone --components \
  --sources-version "$TAG" \
  --standalone-output ./out
# → ./out/SDDSServThemeSources — плоская папка .swift + .xcassets
```

Обновиться на другую версию — тот же запуск с другим тегом.

#### Что происходит внутри

Архив скачивается с GitHub Release, распаковывается в
`<output>/SDDSSources-<tag>` — **туда же, куда CLI генерирует токены и стили
компонентов** — и этот распакованный корень используется как `--sources-root`.
Скачанный zip удаляется, дерево остаётся: повторный запуск с той же версией
ничего не качает и работает офлайн. Обновление на другую версию — просто другой
тег (появится соседняя папка `SDDSSources-<новый-tag>`).

| Опция | Зачем |
| --- | --- |
| `--sources-url <url>` | Взять архив по конкретному адресу (в т.ч. `file://` — локальная проверка или закрытый контур) вместо ассета релиза. |
| `--sources-repository <owner/repo>` | Тянуть релизы из форка/зеркала. |

Ограничения: `--sources-version` работает только со `--standalone` и несовместим
с `--sources-root` (оба задают один и тот же корень) — CLI падает с понятной
ошибкой до начала генерации. Если по указанной версии архива нет либо в нём нет
ожидаемого дерева (`SDDSComponents/Sources/SDDSComponents`), CLI тоже
останавливается: молча собранный полупустой бандл хуже явной ошибки.

Архив собирает [`scripts/package_sources.sh`](../scripts/package_sources.sh)
(шаги в `.github/workflows/publish-release.yml`); внутри — дерево путей
репозитория и `sources-manifest.json` с версией и коммитом. Список путей в
скрипте обязан совпадать с тем, что читает `App.sourcesRootURL`.

### InputMask (внешняя зависимость)

`InputMask` (RedMadRobot, MIT, ноль зависимостей) нужен компонентам маскированного
ввода в текстовых полях. Это единственная **сторонняя** зависимость слоя компонентов,
поэтому по умолчанию она **не вендорится** в бандл: `import InputMask` в исходниках
сохраняется, а клиент подключает `InputMask` сам (SPM/CocoaPods). Так клиент не тащит
и не обфусцирует чужой код.

Флаг `--external-dependencies` **встраивает** исходники `InputMask` в бандл — тогда
папка полностью самодостаточна (никаких внешних зависимостей), ценой копии стороннего
кода внутри.

**Ограничения:**

- Уровень с компонентами (`--components`) доступен для тем, у которых есть
  закоммиченный пакет `Themes/<Name>Theme` (вариации компонентов взаимозависимы —
  нужен полный пакет). Уровень токенов — для любой темы.
- Слияние модулей в один разводит совпадения имён (namespace вариаций vs типы
  `SDDSComponents`/SwiftUI) **автоматически**; на неразрешённый конфликт или
  «утёкшую» зависимость сборка бандла **падает сразу** (guard полноты), а не у
  клиента.

**Проверить компиляцию бандла.** С `--external-dependencies` (или уровень только
токенов) — папка самодостаточна, компилируется как есть:

```sh
SDK=$(xcrun --sdk iphonesimulator --show-sdk-path)
cd SDDSStandalone/<ThemeName>ThemeSources
xcrun swiftc -sdk "$SDK" -target arm64-apple-ios16.0-simulator -typecheck *.swift
```

Уровень с компонентами по умолчанию (InputMask внешний): собираем `InputMask`
отдельным модулем и type-check'аем бандл против него — как это будет у клиента,
подключившего зависимость:

```sh
SDK=$(xcrun --sdk iphonesimulator --show-sdk-path)
TGT=arm64-apple-ios16.0-simulator
# 1. InputMask → .swiftmodule (исходники в репо, в бандл не попадают)
xcrun swiftc -sdk "$SDK" -target "$TGT" -emit-module -module-name InputMask \
  -emit-module-path /tmp/im/InputMask.swiftmodule \
  Vendor/InputMask/Source/InputMask/InputMask/Classes/*.swift
# 2. type-check бандла, подсунув модуль через -I
cd SDDSStandalone/<ThemeName>ThemeSources
xcrun swiftc -sdk "$SDK" -target "$TGT" -typecheck -I /tmp/im *.swift
```

---

## Конфигурация

Формат JSON соответствует `DesignSystemBuilderConfiguration`
([`Config.swift`](DesignSystemBuilderCore/Config.swift)):

```json
{
  "paletteURL": "https://raw.githubusercontent.com/salute-developers/plasma/dev/packages/plasma-colors/palette/general.json",
  "themes": [
    {
      "name": "PlasmaB2C",
      "url": "https://github.com/salute-developers/theme-converter/raw/refs/heads/main/themes/plasma_b2c/latest.zip"
    },
    {
      "name": "SDDSServ",
      "url": "https://github.com/salute-developers/theme-converter/raw/refs/heads/main/themes/sdds_serv/latest.zip",
      "tenants": [
        { "name": "Gold", "url": "https://github.com/salute-developers/theme-converter/raw/refs/heads/main/themes/sbermarket_business/latest.zip" }
      ]
    },
    {
      "name": "PlasmaHomeDS",
      "url": "https://github.com/salute-developers/theme-converter/raw/refs/heads/main/themes/plasma_homeds/latest.zip",
      "fontFamilyOverride": "systemSFPro",
      "sddsConfigPath": "Themes/PlasmaHomeDSTheme/.sdds/config.json",
      "localSchemePath": "DesignSystemBuilder/LocalSchemes/plasma_homeds/latest.zip"
    }
  ]
}
```

> ⚠️ **Этот пример рассчитан на запуск внутри репозитория.** Последняя тема
> (`PlasmaHomeDS`) использует `sddsConfigPath` и `localSchemePath` — оба поля
> резолвятся от корня plasma-ios, а корень вычисляется от `#file`, то есть от
> пути, **зашитого в бинарь при компиляции**. На чужой машине такого пути нет:
> схема не найдётся, и CLI остановится с `No scheme directory`.
>
> Для запуска вне репозитория (в том числе с `--sources-version`) уберите оба
> поля и оставьте у темы `url` — схема будет скачана с upstream. Готовый
> минимальный конфиг — в разделе
> [«Исходники с релиза»](#сценарий-целиком-у-клиента-нет-чекаута-репозитория).

### Поля темы (`themes[]`)

| Поле | Обяз. | Описание |
| --- | --- | --- |
| `name` | да | Имя темы. Определяет каталог вывода `Themes/<name>Theme`. |
| `url` | да | URL на ZIP-архив scheme темы (upstream `theme-converter`). |
| `tenants` | нет | Доп. суб-темы: `[{ "name", "url" }]`. Генерируются поверх базовой. |
| `fontFamilyOverride` | нет | `none` (по умолчанию) или `systemSFPro` — подменяет `fontName` в typography-токенах на системный SF Pro и выпускает пустой `FontsManifest` (без runtime-загрузки шрифтов). Применяется по compliance-причинам. |
| `sddsConfigPath` | нет | Путь (от корня репо) к `.sdds/config.json` от DS Builder CLI. Если задан и `.sdds` валиден — тема собирается **из локальной `.sdds`-директории** напрямую, без скачивания/распаковки zip. Иначе — fallback на `localSchemePath`/`url`. Только для запуска внутри репозитория. См. раздел [«Источник темы»](#источник-темы-sdds-ds-builder-или-remotezip). |
| `localSchemePath` | нет | Путь (от корня репо) к локальному snapshot-ZIP. Если задан — схема читается локально через `file://`, без обращений к upstream. Служит fallback'ом, когда `.sdds` недоступен. Только для запуска внутри репозитория. |

> Оба пути резолвятся от корня репозитория, вычисленного от compile-time `#file`,
> поэтому вне plasma-ios они не разрешаются. `--sources-root` и `--sources-version`
> на них **не влияют**: те задают корень вендоримых исходников, а не источник схемы.

Верхнеуровневые поля: `paletteURL` (URL палитры цветов) и `themes` (массив тем).

> ⚠️ Во внешнем JSON-конфиге **оба** верхнеуровневых поля (`paletteURL` и
> `themes`) обязательны — `DesignSystemBuilderConfiguration` декодируется
> синтезированным `Codable` без подстановки дефолтов. Если конфиг не
> распарсился (нет поля, битый JSON, нечитаемый путь), CLI печатает ошибку и
> **молча откатывается на встроенный default-конфиг** (4 темы). Признак отката
> в логе — строка `❌ Using default configuration...`. Внутри `themes[]`
> опциональные поля (`tenants`, `fontFamilyOverride`, `sddsConfigPath`,
> `localSchemePath`) можно опускать.

---

## Источник темы: `.sdds` (DS Builder) или remote/zip

Для каждой темы источник схемы выбирается по приоритету (порт android #815,
семантика `explicit ?: sdds`):

1. **`.sdds`-директория** — если у темы задан `sddsConfigPath` и `.sdds` валиден
   (есть `config.json`, файлы схемы и палитра). Тема собирается **напрямую из
   локальных файлов**, без скачивания и распаковки zip. В логе:
   `📦 Using local .sdds source for <Theme>`.
2. **`localSchemePath`** — локальный snapshot-ZIP (`file://`), если `.sdds` нет
   или он неполон.
3. **`url`** — удалённый zip из `theme-converter`.

Если `.sdds` задан, но недоступен/неполон — происходит безопасный откат на
шаг 2/3, в логе: `⚠️ .sdds недоступен для <Theme> — fallback на remote/zip`.

Сейчас на `.sdds` сконфигурирована тема **PlasmaHomeDS**
(`sddsConfigPath: "Themes/PlasmaHomeDSTheme/.sdds/config.json"`).

### Что лежит в `.sdds`

`.sdds` — **per-theme**: одна папка на тему, рядом с её пакетом
(`Themes/<Name>Theme/.sdds/`). Держит и вход DS Builder (`config.json` +
токены), и метаданные генерации (`config-info-*.json`).

```
Themes/PlasmaHomeDSTheme/.sdds/
├── config.json                       # вход DS Builder — отслеживается в git
├── config-info-ios.json              # мета компонентов/биндингов — генерируется, трекается
├── config-info-tokens-ios.json       # мета токенов — генерируется, трекается
└── tenants/
    ├── palette.json                  # gitignored
    └── <tenant>/
        ├── meta.json                 # gitignored
        └── ios/ios_*.json            # gitignored (CLI читает только ios/)
```

> 📄 **`config-info-*.json` — это ещё и вход документационного бандла.** Из них
> собираются `meta/components-info.json` и `meta/theme-info.json`, по которым
> Documentation Service строит связку «компонент или токен ↔ как это написать в коде»,
> а агрегатор рендерит таблицы стилей в markdown. Весь процесс — в
> [docs/DOCS_BUNDLE.md](../docs/DOCS_BUNDLE.md). Не путайте документационный бандл с
> автономными исходниками темы (`--standalone`), которые этот README называет бандлом.

`config.json` (манифест DS Builder-проекта: `projectId`, `designSystemId`,
`credential.name` = имя env-переменной с ключом, список `tenants`) и
`config-info-*.json` (метаданные сгенерированного кода) — **трекаются**. Сами
токены и палитра — **под `.gitignore`** (`**/.sdds/**/`), их нужно выгружать
локально перед сборкой. Метаданные пишутся в `.sdds` рядом с генерируемой темой:
без `--output` — в `Themes/<Name>Theme/.sdds/`, с `--output <dir>` — в
`<dir>/<Name>Theme/.sdds/`.

### Как наполнить `.sdds` (DS Builder CLI)

```sh
# 1. dsbuilder CLI должен быть в PATH, либо укажите путь к бинарю:
export DSBUILDER_BIN=/path/to/dsbuilder

# 2. API key — в .env в корне репо (файл в .gitignore) или в окружении:
echo 'DSBUILDER_API_KEY=<ключ>' >> .env

# 3. выгрузить токены/палитру в .sdds:
scripts/fetch_sdds.sh        # под капотом: dsbuilder theme fetch

# 4. собрать тему (PlasmaHomeDS пойдёт из .sdds):
cd DesignSystemBuilder && ./build/dsbuilder/dsbuilder --output /tmp/out
```

- `scripts/fetch_sdds.sh` сам подхватывает `.env`, при отсутствии `config.json`
  делает `dsbuilder init` (нужны `DSBUILDER_PROJECT_ID` и
  `DSBUILDER_DESIGN_SYSTEM_ID`), затем `dsbuilder theme fetch`.
- Имя env-переменной с ключом задаётся в `.sdds/config.json` (`credential.name`).
- Проверить доступ к проекту: `dsbuilder status` из каталога `DesignSystemBuilder/`.
- В CI наполнение делает workflow [`.github/workflows/fetch-sdds.yml`](../.github/workflows/fetch-sdds.yml)
  (ключ — из секрета, идентификаторы — из repo variables).

Если `.sdds` не наполнен, PlasmaHomeDS соберётся из `localSchemePath`-снапшота —
сборка не падает, просто используется fallback-источник.

---

## Где это используется

`scripts/generate_themes/generate_themes.rb` запускает уже собранный `dsbuilder`
для каждой темы, а затем `create_project.rb` для упаковки темы в отдельный
Xcode-проект/фреймворк. `scripts/generate_docs_bundle.sh` вызывает тот же бинарник
для шагов `docs extract`/`docs aggregate`. Этот README покрывает шаг **сборки и
запуска самого бинарника**, который эти скрипты ожидают в `executable_path`.
