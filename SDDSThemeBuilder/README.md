# SDDSThemeBuilder

CLI-утилита для генерации Swift-кода тем дизайн-системы (SDDS) под iOS.
Берёт схему темы и палитру (из локальной `.sdds`-директории DS Builder либо из
удалённого/локального zip-архива), декодирует JSON и по Stencil-шаблонам
генерирует токены (цвета, типографику, тени, формы, отступы, градиенты) и
вариации компонентов в каталог `Themes/<Name>Theme`. Источник темы выбирается
по приоритету — см. [«Источник темы»](#источник-темы-sdds-ds-builder-или-remotezip).

- **Тип:** macOS command-line tool (target `SDDSThemeBuilder` внутри
  `SDDSThemeBuilder.xcodeproj`). Отдельного SwiftPM-манифеста у CLI нет —
  сборка идёт через `xcodebuild`.
- **Точка входа:** [`SDDSThemeBuilder/main.swift`](SDDSThemeBuilder/main.swift),
  логика — [`SDDSThemeBuilderCore/App.swift`](SDDSThemeBuilderCore/App.swift).
- **Зависимости:** `swift-argument-parser`, `Stencil`, `PathKit` (резолвятся
  Xcode через SwiftPM автоматически).

---

## Сборка бинарника

Из каталога `SDDSThemeBuilder/`:

```sh
./build_cli.sh
```

Скрипт собирает схему `SDDSThemeBuilder` в конфигурации Release и кладёт
самодостаточный каталог (бинарник + его фреймворк) в:

```
SDDSThemeBuilder/build/themebuilder/SDDSThemeBuilder
```

Бинарник динамически линкует `SDDSThemeBuilderCore.framework` (rpath
`@loader_path/.`), поэтому фреймворк лежит рядом с исполняемым файлом —
запускать нужно именно из этого каталога, не выдёргивая один бинарник.
(`build/` в `.gitignore`, поэтому артефакт не коммитится.)

### Опции скрипта

```sh
./build_cli.sh            # Release (по умолчанию)
./build_cli.sh --debug    # Debug-сборка
./build_cli.sh --run      # собрать и сразу запустить с default-конфигом
./build_cli.sh --run cfg.json   # собрать и запустить с внешним JSON-конфигом
./build_cli.sh --help     # справка
```

### Ручная сборка (без скрипта)

```sh
xcodebuild \
  -project SDDSThemeBuilder.xcodeproj \
  -scheme SDDSThemeBuilder \
  -configuration Release \
  -derivedDataPath build/themebuilder-dd \
  build

# бинарник (запускать прямо отсюда — рядом лежит SDDSThemeBuilderCore.framework):
build/themebuilder-dd/Build/Products/Release/SDDSThemeBuilder
```

### Требования

- macOS + Xcode (проверено на Xcode 26.x).
- Доступ в сеть на этапе **запуска** (а не сборки) — бинарник скачивает
  scheme-архивы и палитру. Исключение: темы с `localSchemePath` берут схему из
  локального snapshot-ZIP (например, `PlasmaHomeDS`).

---

## Запуск

```sh
# 1. С конфигом по умолчанию (4 темы: SDDSServ, PlasmaB2C, PlasmaHomeDS, StylesSalute)
./build/themebuilder/SDDSThemeBuilder

# 2. С внешним JSON-конфигом (обычный путь или URL — оба варианта работают)
./build/themebuilder/SDDSThemeBuilder /path/to/config.json
./build/themebuilder/SDDSThemeBuilder file:///abs/path/to/config.json

# 3. С перенаправлением вывода в свою директорию
./build/themebuilder/SDDSThemeBuilder /path/to/config.json --output /path/to/out
./build/themebuilder/SDDSThemeBuilder -o /path/to/out
```

Аргументы CLI:

| Аргумент | Описание |
| --- | --- |
| `[config]` (позиционный, необязательный) | Путь или URL к JSON-конфигу. Принимается как обычный путь в ФС (абсолютный или относительный от текущей директории), так и URL со схемой (`file://`, `http(s)://`). Если не передан или файл не читается — используется встроенный default-конфиг из [`Config.swift`](SDDSThemeBuilderCore/Config.swift). |
| `-o, --output <dir>` | Директория для сгенерированных тем. Если задана — каждая тема пишется в `<dir>/<ThemeName>Theme`. Если не задана — поведение прежнее (`<repo>/Themes`). |
| `--standalone` | Собрать **автономный** бандл темы (`<ThemeName>ThemeSources`) — плоскую папку `.swift`, компилируемую одним модулем без линковки наших библиотек. См. [«Автономные исходники»](#автономные-исходники-standalone). |
| `--components` | Аддитивно к `--standalone`: включить в бандл слой компонентов (иначе — только токены). |
| `--standalone-output <dir>` | Куда класть автономный бандл. По умолчанию — `SDDSThemeBuilder/build/standalone`. |
| `--external-dependencies` | Вендорить исходники внешних зависимостей (`InputMask`) в бандл. По умолчанию они **не** копируются — `import InputMask` сохранён, клиент линкует модуль сам. |
| `--core-sources <dir>` | Путь к исходникам `SDDSThemeCore` для встраивания в бандл. По умолчанию — от `--sources-root`. |
| `--sources-root <dir>` | Корень вендоримых исходников (библиотеки + пакет темы). По умолчанию — корень репозитория. Позволяет запускать CLI **вне** plasma-ios, указав распакованную копию исходников (напр. артефакт релиза). |

### Куда пишется результат

**Сгенерированные темы** (`<ThemeName>Theme`):

- по умолчанию (без `--output`) — в `Themes/<ThemeName>Theme` относительно корня
  репозитория;
- с `--output <dir>` — в `<dir>/<ThemeName>Theme` (относительные пути резолвятся
  от текущей рабочей директории запуска).

> ⚠️ **Про дефолтный путь.** Без `--output` путь генерации не зависит от текущей
> директории запуска: он вычисляется от `#file` — абсолютного пути `main.swift`,
> **зашитого в бинарник на этапе компиляции** (см. `App.swift`,
> `themeBuilderURL`). То есть бинарник пишет результат **в то дерево исходников,
> из которого был собран**. Если перенести/переименовать репозиторий —
> **пересоберите** бинарник либо используйте `--output`.

**Прочее** (на путь которого `--output` не влияет — это внутренние артефакты):

| Что | Куда |
| --- | --- |
| Временные скачанные/распакованные схемы и палитра | `SDDSThemeBuilder/Output/<ThemeName>/` |
| Тенанты темы | `…/Output/<ThemeName>/tenants/<Tenant>/` |

> Каталог `SDDSThemeBuilder/Output/` — это рабочий scratch (он в `.gitignore`,
> `generate_themes.rb` чистит его после каждой темы), поэтому `--output` его не
> переносит — туда уходит только финальный сгенерированный код.

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
cd SDDSThemeBuilder
./build_cli.sh

# Только токены выбранной темы → build/standalone/<ThemeName>ThemeSources
./build/themebuilder/SDDSThemeBuilder file:///path/to/config.json --standalone

# Токены + компоненты
./build/themebuilder/SDDSThemeBuilder file:///path/to/config.json --standalone --components

# В свою директорию
./build/themebuilder/SDDSThemeBuilder file:///path/to/config.json --standalone --components \
  --standalone-output /path/to/out
# → /path/to/out/<ThemeName>ThemeSources

# Токены + компоненты, InputMask вендорится в бандл (полностью автономно)
./build/themebuilder/SDDSThemeBuilder file:///path/to/config.json --standalone --components \
  --external-dependencies
```

**Куда пишется:** `--standalone-output <dir>` (по умолчанию
`SDDSThemeBuilder/build/standalone`), внутри — папка `<ThemeName>ThemeSources` на
каждую тему из конфига. `build/` в `.gitignore`. Промежуточная генерация токенов
в standalone-режиме без `-o` идёт в `build/standalone-work` и **не перезаписывает**
закоммиченные `Themes/*`.

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

> Планируется: публикация версионированного артефакта исходников на релизе и
> `--sources-version` для загрузки нужной версии — тогда завязка на репозиторий
> исчезает полностью, а клиент сможет обновлять исходники на конкретную версию.

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
cd build/standalone/<ThemeName>ThemeSources
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
cd build/standalone/<ThemeName>ThemeSources
xcrun swiftc -sdk "$SDK" -target "$TGT" -typecheck -I /tmp/im *.swift
```

---

## Конфигурация

Формат JSON соответствует `ThemeBuilderConfiguration`
([`Config.swift`](SDDSThemeBuilderCore/Config.swift)):

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
      "localSchemePath": "SDDSThemeBuilder/LocalSchemes/plasma_homeds/latest.zip"
    }
  ]
}
```

### Поля темы (`themes[]`)

| Поле | Обяз. | Описание |
| --- | --- | --- |
| `name` | да | Имя темы. Определяет каталог вывода `Themes/<name>Theme`. |
| `url` | да | URL на ZIP-архив scheme темы (upstream `theme-converter`). |
| `tenants` | нет | Доп. суб-темы: `[{ "name", "url" }]`. Генерируются поверх базовой. |
| `fontFamilyOverride` | нет | `none` (по умолчанию) или `systemSFPro` — подменяет `fontName` в typography-токенах на системный SF Pro и выпускает пустой `FontsManifest` (без runtime-загрузки шрифтов). Применяется по compliance-причинам. |
| `sddsConfigPath` | нет | Путь (от корня репо) к `.sdds/config.json` от DS Builder CLI. Если задан и `.sdds` валиден — тема собирается **из локальной `.sdds`-директории** напрямую, без скачивания/распаковки zip. Иначе — fallback на `localSchemePath`/`url`. См. раздел [«Источник темы»](#источник-темы-sdds-ds-builder-или-remotezip). |
| `localSchemePath` | нет | Путь (от корня репо) к локальному snapshot-ZIP. Если задан — схема читается локально через `file://`, без обращений к upstream. Служит fallback'ом, когда `.sdds` недоступен. |

Верхнеуровневые поля: `paletteURL` (URL палитры цветов) и `themes` (массив тем).

> ⚠️ Во внешнем JSON-конфиге **оба** верхнеуровневых поля (`paletteURL` и
> `themes`) обязательны — `ThemeBuilderConfiguration` декодируется
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
cd SDDSThemeBuilder && ./build/themebuilder/SDDSThemeBuilder --output /tmp/out
```

- `scripts/fetch_sdds.sh` сам подхватывает `.env`, при отсутствии `config.json`
  делает `dsbuilder init` (нужны `DSBUILDER_PROJECT_ID` и
  `DSBUILDER_DESIGN_SYSTEM_ID`), затем `dsbuilder theme fetch`.
- Имя env-переменной с ключом задаётся в `.sdds/config.json` (`credential.name`).
- Проверить доступ к проекту: `dsbuilder status` из каталога `SDDSThemeBuilder/`.
- В CI наполнение делает workflow [`.github/workflows/fetch-sdds.yml`](../.github/workflows/fetch-sdds.yml)
  (ключ — из секрета, идентификаторы — из repo variables).

Если `.sdds` не наполнен, PlasmaHomeDS соберётся из `localSchemePath`-снапшота —
сборка не падает, просто используется fallback-источник.

---

## Где это используется

`scripts/generate_themes/generate_themes.rb` запускает уже собранный бинарник
SDDSThemeBuilder для каждой темы, а затем `create_project.rb` для упаковки темы
в отдельный Xcode-проект/фреймворк. Этот README покрывает шаг **сборки и
запуска самого бинарника**, который тот скрипт ожидает в `executable_path`.
