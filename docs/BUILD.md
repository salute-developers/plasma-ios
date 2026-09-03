# Сборка и разработка

Подробности по сборке репозитория, отдельных модулей, песочницы и CLI дизайн-системы.
Короткий обзор — в [README.ru.md](../README.ru.md).

## Требования

- macOS + Xcode (актуальная версия), установленные iOS Simulator runtime.
- Ruby + Bundler, для скриптов генерации проектов дополнительно `xcodeproj` и `json`.
- Swift 5.9+ toolchain для CLI `dsbuilder`.

```sh
git clone https://github.com/salute-developers/plasma-ios.git
cd plasma-ios
git submodule update --init --recursive   # Vendor/InputMask
bundle install                            # fastlane, rubyzip
gem install xcodeproj json
```

## Сборка XCFrameworks

Все модули (артефакты появятся в `build/`, папка в `.gitignore`):

```sh
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace
```

Весь набор зависимостей разом — `SDDSThemeCore` → `SDDSComponents` + `SDDSIcons` → `InputMask`
→ все темы. Нужен, если собираете отдельные Xcode-проекты без workspace:

```sh
./scripts/build_all_static_dependencies.sh
```

## Сборка отдельных модулей

Все команды — из корня репозитория.

**Список схем через запятую** (`SDDSComponents` по умолчанию собирается статически):

```sh
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace -m SDDSComponents,SDDSIcons
```

**Только иконки** (через скрипт самого пакета артефакт ляжет в `SDDSIcons/build`):

```sh
ruby ./scripts/build_xcframeworks.rb -d . -p SDDSIcons/SDDSIcons.xcodeproj -m SDDSIcons
```

**Только ядро токенов** (живёт в отдельном проекте):

```sh
ruby ./scripts/build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore
```

**Отдельная тема** (без аргументов собираются все; артефакты — в `Themes/build/`):

```sh
ruby ./scripts/build_themes.rb SDDSservTheme
```

**Отдельный Xcode-проект** — только после того, как зависимости уже собраны:

```sh
cd SDDSComponents && xcodebuild -project SDDSComponents.xcodeproj -scheme SDDSComponents \
  -destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6' build
```

Список доступных симуляторов: `xcodebuild -destination 'platform=iOS Simulator' -showdestinations`.

> **Грабля.** Настройки сборки задаём в таргетах, а не в командной строке `xcodebuild`.
> `SDDSComponents` зависит от макро-пакета `SDDSApiInfo`, а глобальные настройки применяются ко
> всему графу, включая macro-плагин: `MACH_O_TYPE`, `BUILD_LIBRARY_FOR_DISTRIBUTION`,
> `SKIP_INSTALL` и `-sdk` его ломают. Платформу задаём только через `-destination`.

## Песочница под конкретную тему

`SDDSDemoApp` работает в двух режимах: общая песочница со всеми темами и DS-изолированные
схемы (одна схема = одна тема).

| Схема | Что показывает |
|---|---|
| `SDDSDemoApp` | все темы, переключение внутри приложения |
| `SDDSDemoAppSDDSServ` | только `SDDSServTheme` |
| `SDDSDemoAppPlasmaB2C` | только `PlasmaB2CTheme` |
| `SDDSDemoAppPlasmaHomeDS` | только `PlasmaHomeDSTheme` |

**Через Xcode:** открыть `SDDS.xcworkspace` → выбрать схему → выбрать симулятор → `Cmd+R`.

**Через CLI** (из папки `SDDSDemoApp`):

```sh
xcodebuild -scheme SDDSDemoApp -destination 'generic/platform=iOS Simulator' build
```

```sh
xcodebuild -scheme SDDSDemoAppPlasmaHomeDS -destination 'generic/platform=iOS Simulator' build
```

Тема выбирается переменной окружения `SANDBOX_DS_PROFILE` (`sddsserv` / `plasmab2c` /
`plasmahomeds`; пусто — все темы) и compile-флагами `SANDBOX_DS_*` в DS-изолированных
target'ах. Разбор профиля — `SDDSDemoApp/SDDSDemoApp/Common/Sandbox/SandboxDesignSystemProfile.swift`,
регистрация провайдеров — `SandboxBootstrap.swift`.

Экраны компонентов (stories) генерируются скриптом, он же висит в Build Phases:

```sh
python3 scripts/generate_sandbox_stories.py
```

Пошаговый чеклист «как добавить новую тему в песочницу» — в [SDDSDemoApp/README.md](../SDDSDemoApp/README.md).

## Демо под симулятор как ассет релиза

`scripts/release/build_release.sh` собирает все четыре схемы демо под симулятор и кладёт их в
ассеты релиза (`--skip-demo` — пропустить). Сборка идёт без подписи, поэтому приложение ставится
только на симулятор:

```sh
xcodebuild -workspace SDDS.xcworkspace -scheme SDDSDemoApp -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath build/demo CODE_SIGNING_ALLOWED=NO build
```

Инструкция для пользователя (`simctl install` / `launch`, снятие карантина) —
[.github/templates/simulator-app-instructions.md](../.github/templates/simulator-app-instructions.md);
она же дописывается в release notes при публикации.

Каждый ассет весит около 50 МБ (Debug, без strip), четыре схемы — примерно 200 МБ на релиз.
Если это много, соберите только общую схему `SDDSDemoApp`: тема в ней переключается на лету,
а DS-изолированные схемы нужны для проверки изоляции, а не для демонстрации.

> **Грабля: Release под симулятор не линкуется.** `-configuration Release` для
> `platform=iOS Simulator` падает на `ld` с «cannot link directly with 'SwiftUICore'» и пачкой
> неразрешённых SwiftUI-специализаций, ссылающихся на типы `SDDSComponents`. Воспроизводится и
> через `-workspace`, и через `-project`, с подписью и без — то есть дело не в
> `CODE_SIGNING_ALLOWED=NO`. Debug собирается штатно, поэтому ассет релиза — Debug.
> На устройство Release собирается нормально: fastlane публикует в TestFlight именно его,
> так что боевой путь этот дефект не задевает.

## CLI дизайн-системы (`dsbuilder`)

Один бинарник с двумя подкомандами: `themes` (по умолчанию) — генерация `Themes/<Name>Theme`
из токенов DS Builder; `docs` — сборка документационного бандла.

```sh
cd DesignSystemBuilder && ./build_cli.sh      # → DesignSystemBuilder/build/dsbuilder/dsbuilder
```

```sh
./build/dsbuilder/dsbuilder                                   # генерация тем
./build/dsbuilder/dsbuilder docs extract   --repo-root ..     # сэмплы документации
./build/dsbuilder/dsbuilder docs aggregate --repo-root .. --theme SDDSserv
```

**Автономные исходники** (`--standalone`): тема собирается в плоскую папку `.swift`, которая
компилируется одним модулем без линковки наших библиотек. Исходники можно забрать прямо с
релиза по номеру версии, не имея чекаута репозитория:

```sh
./dsbuilder ./config.json --standalone --components --sources-version <tag>
```

Как получить бинарь CLI и как выглядит конфиг для запуска вне репозитория — см.
[«Исходники с релиза»](../DesignSystemBuilder/README.md#исходники-с-релиза---sources-version).

Данные темы (`.sdds/`) выгружает **внешний** Kotlin/Native CLI того же имени `dsbuilder` из
репозитория `salute-developers/design-system-builder` — обёртка `scripts/fetch_sdds.sh`. Это
другой бинарник; в скриптах и доке зовём оба по явным путям. Токены и палитра в `.gitignore`,
трекается только `config.json`; при пустой `.sdds/` наш CLI откатывается на zip-снапшот.

Подробности — [DesignSystemBuilder/README.md](../DesignSystemBuilder/README.md) и
[docs/DOCS_BUNDLE.md](DOCS_BUNDLE.md).

## Документация API (DocC)

Каталоги DocC лежат рядом с исходниками:
`SDDSComponents/Sources/SDDSComponents/Documentation.docc` и
`DesignSystemBuilder/SDDSThemeCore/Sources/SDDSThemeCore/Documentation.docc`. Статьи
(«Быстрый старт», «Темизация», «Своя тема через dsbuilder») лежат там же обычными `.md`.

Смотреть в Xcode: выбрать схему и `Product → Build Documentation` (⌃⇧⌘D) — документация
откроется во встроенном просмотрщике.

Собрать архив из командной строки:

```sh
xcodebuild docbuild -workspace SDDS.xcworkspace -scheme SDDSComponents \
  -destination 'generic/platform=iOS Simulator' -derivedDataPath build/docc
```

> Каталог `.docc` подключается к таргету явно: `SDDSComponents.xcodeproj` и
> `DesignSystemBuilder.xcodeproj` перечисляют файлы списком, поэтому просто положить папку
> рядом с исходниками недостаточно — она не попадёт в сборку и Topics не применятся.

## Тесты и линт

```sh
ruby scripts/run_tests.rb        # swift test для DesignSystemBuilder + Xcode-схемы из скрипта
```

```sh
swift test --package-path DesignSystemBuilder      # только CLI
swift test --package-path IntegrationCore/SandboxCore
```

```sh
./lint.sh                        # обёртка над swiftlint; конфиг .swiftlint.yml
swiftlint --fix                  # автопочинка косметики
```

Снапшот-тесты компонентов чувствительны к симулятору и масштабу — сверяйтесь с именем
устройства из `scripts/run_tests.rb`, не подменяйте симулятор произвольно.

## Релизы и версии

- Публикация — один прогон `publish-release.yml` (workflow_dispatch на `main`):
  `scripts/release/build_release.sh` → тег → draft-релиз → upload ассетов → снятие draft.
  Вход `dry_run` собирает ассеты без тега и релиза.
- Локально тот же набор: `scripts/release/build_release.sh <tag>` → `release-artifacts/`.
- Каждый релиз публикует `.xcframework` (`SDDSThemeCore`, `InputMask`, `SDDSComponents`, темы),
  `dsbuilder-cli-<tag>.zip` и `SDDSSources-<tag>.zip` (собирает
  [`scripts/package_sources.sh`](../scripts/package_sources.sh)).
- **Иконки идут отдельным релизом** `SDDSIcons-v*` через `release_icons.yml`.
- Версии модулей — `scripts/bump-versions.sh`, `scripts/changed-modules.sh`.

## Где что искать

| Что | Где |
|---|---|
| Точка входа CLI | `DesignSystemBuilder/DesignSystemBuilderCLI/main.swift` |
| Логика генерации тем | `DesignSystemBuilder/DesignSystemBuilderCore/App.swift` |
| Документационный бандл | `DesignSystemBuilder/DocsAggregatorCore/` |
| Stencil-шаблоны токенов и компонентов | внутри `DesignSystemBuilder` |
| Сгенерированный код тем | `Themes/<Name>Theme/` |
| Сгенерированные иконки | `SDDSIcons/Generated/` |
| Сборочные и релизные скрипты | `scripts/*.rb`, `scripts/*.sh` |
| Данные темы от DS Builder CLI | `DesignSystemBuilder/.sdds/` (эфемерна, кроме `config.json`) |
| Слепок API стилей | `DesignSystemBuilder/.sdds/ios-api-meta.json` |
| Примеры компонентов для доков | `SDDSComponentsFixtures/Sources/.../Samples/` |
| Контракт переносимости пакетов | [project.yml](project.yml) |
