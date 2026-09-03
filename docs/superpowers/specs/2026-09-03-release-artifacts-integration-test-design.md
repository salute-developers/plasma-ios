# Интеграционный тест релизных артефактов — design

Дата: 2026-09-03. Ветка: `feature/release-artifacts-integration-test` (от `develop`).

## Проблема

Релиз публикует xcframework'и (`SDDSThemeCore`, `InputMask`, `SDDSComponents`, темы), но ни одна
проверка не подтверждает, что внешнее приложение может их подключить и запуститься:

- `SDDSDemoApp` собирается из исходников через локальные SPM-пакеты, а не из xcframework'ов.
- Проекты тем линкуют `build/*.xcframework`, поэтому линковка `SDDSComponents` проверяется
  косвенно. Связка «приложение + тема.xcframework + статический `SDDSComponents` + динамический
  `SDDSIcons`» и запуск на симуляторе не проверяются нигде.
- Типичные поломки именно этого класса: пропавшие ресурсы статического фреймворка, сломанный
  `.swiftinterface` после вырезания `SDDSApiInfo`, дубли символов, падение в `Theme.initialize()`.

Ограничение: полная сборка артефактов занимает 53 минуты (`publish-release.yml`, run от
2026-09-02), при этом сами артефакты весят около 60 МБ суммарно.

## Цель

После каждого мержа в `develop` и на каждом PR в `main` автоматически проверять, что релизные
xcframework'и подключаются в чистое Xcode-приложение, приложение собирается, запускается на
симуляторе и использует API компонентов и темы. Проверка обязательна для `main`. Час сборки
платится только за изменившийся слой артефактов.

## Не в объёме

- `publish-release.yml` и `build.yml` не меняются. Релиз публикуется с `main`, который уже прошёл
  проверку на PR.
- Проверка на PR в `develop` (можно включить позже тем же воркфлоу, добавив `pull_request`).
- Снапшот-тесты, визуальная сверка компонентов.
- `dsbuilder-cli-*.zip` и `SDDSSources-*.zip`: не фреймворки, не подключаются в приложение.

## Решения

| Вопрос | Решение | Почему |
|---|---|---|
| Где ловить | `push` в `develop`, `pull_request` в `main`, `workflow_dispatch` | Ранний сигнал после мержа; required check на `main` покрывает `release/*` и `hotfix/*` |
| Как не собирать час | Слоёный кэш артефактов (`actions/cache`), ключ = хэш исходников слоя + ключ нижнего слоя | Пересобирается только изменившийся слой; на PR в `main` всё уже в кэше с `develop` |
| Как ускорить, когда собирать надо | Темы и тесты матрицей по темам в отдельных джобах | Три темы последовательно = 30 из 53 минут |
| Как проверять «не крешится» | Hosted XCTest внутри приложения, не XCUITest | Host-процесс = само приложение: падение на старте валит тест; быстрее и стабильнее XCUITest |
| Один таргет или по одному на тему | По одному app-таргету на тему | Клиент подключает одну тему в чистое приложение; так и проверяем |
| Проект генерировать или коммитить | Генерируется Ruby-скриптом (`xcodeproj`), результат коммитится | Как `Themes/*/*.xcodeproj`; падение удобно отлаживать локально в Xcode |
| Обязательность на `main` | Ruleset: required status check + обязательный PR (запрет прямых пушей) | Required check действует только на PR; без запрета пушей «каждый коммит» не гарантирован |

## Компоненты

### 1. `IntegrationTests/XCFrameworkIntegration/` — интеграционное приложение

Один Xcode-проект `XCFrameworkIntegration.xcodeproj`, по паре таргетов на тему:

- `Integration<Scheme>` — iOS-приложение (SwiftUI, deployment target 15.0 как у
  `SDDSComponents`).
- `Integration<Scheme>Tests` — XCTest, hosted в приложении.

`<Scheme>` — имя таргета темы из `Themes/*/*.xcodeproj` (`SDDSServTheme`, `PlasmaB2CTheme`,
`PlasmaHomeDSTheme`; регистр может отличаться от папки).

Зависимости подключаются как у внешнего клиента: через «Frameworks, Libraries, and Embedded
Content» из `IntegrationTests/XCFrameworkIntegration/Frameworks/<Name>.xcframework` (папка в
`.gitignore`, наполняется скриптом). Никаких SPM-ссылок на исходники репозитория.

| Артефакт | Тип | Как подключён |
|---|---|---|
| `SDDSThemeCore.xcframework` | статический | Do Not Embed |
| `SDDSComponents.xcframework` | статический | Do Not Embed |
| `<Scheme>.xcframework` | статический | Do Not Embed |
| `InputMask.xcframework` | динамический | Embed & Sign |
| `SDDSIcons.xcframework` | динамический | Embed & Sign |

Правило владельца: статические фреймворки подключаются только как Do Not Embed. Ресурсы
`SDDSComponents` (`Assets.xcassets`, `Bundle(for: Components.self)`) при статической линковке
попадают в бандл приложения не автоматически; как именно они доезжают до клиента, покажет
`testComponentsRender`. Результат фиксируется в README как инструкция для клиентов.

Исходники:

```
IntegrationTests/XCFrameworkIntegration/
  XCFrameworkIntegration.xcodeproj          # сгенерирован, коммитится
  Shared/App/IntegrationApp.swift           # @main App
  Shared/App/ContentView.swift              # компоненты + токены темы
  Shared/App/Info.plist
  Shared/Tests/IntegrationTests.swift       # общие тесты
  Generated/<Scheme>/ThemeEntry.swift       # import <Scheme>; enum IntegrationTheme
  Frameworks/                               # .gitignore
```

`ThemeEntry.swift` генерируется на каждую тему и коммитится — единственный файл, который
знает имя модуля темы:

```swift
import SDDSThemeCore
import <Scheme>

enum IntegrationTheme {
    static let name = "<Scheme>"
    static func initialize(onComplete: @escaping () -> Void) {
        <Scheme>.Theme.initialize(onComplete: onComplete)
    }
    static var buttonAppearance: ButtonAppearance { <Scheme>.BasicButton.l.default.appearance }
    static var primaryTextColor: ColorToken { .textDefaultPrimary }
}
```

`ContentView` рендерит `SDDSComponents.BasicButton` с аппирансом темы, `Text` с цветом из
`ColorToken` и иконку `SDDSIcons.Asset`. Это покрывает импорт и использование всех пяти
модулей.

Тесты (`IntegrationTests.swift`, один класс, ~4 теста):

1. `testThemeInitializes` — `IntegrationTheme.initialize` вызывает `onComplete` за 60 секунд.
   Регистрацию шрифтов не проверяем: `FontsService` качает их с CDN, сеть на раннере — не наш
   контракт.
2. `testColorTokenResolves` — `ColorToken` темы даёт непрозрачный цвет.
3. `testComponentsRender` — `UIHostingController(rootView: ContentView())` в окне
   `UIWindow`, `layoutIfNeeded`, размер корневого view ненулевой.
4. `testIconAssetLoads` — `Asset.<любая>.uiImage` не nil (ресурсы динамического
   `SDDSIcons` доехали).

Падение процесса приложения на старте ведёт к падению `xcodebuild test` целиком.

### 2. `scripts/integration/generate_integration_project.rb`

Генератор проекта на гем `xcodeproj` (есть в `Gemfile.lock` через fastlane). Читает список
тем из `Themes/*/*.xcodeproj` (имя таргета через `Xcodeproj::Project#targets`), для каждой
создаёт пару таргетов, пишет `Generated/<Scheme>/ThemeEntry.swift`, настраивает линковку по
таблице выше, shared-схемы `Integration<Scheme>`. Идемпотентен: повторный запуск даёт тот же
`pbxproj`. Запускается вручную при добавлении темы; CI его не вызывает.

### 3. `scripts/integration/run_integration_test.sh`

```
scripts/integration/run_integration_test.sh [--theme <Scheme>]... [--destination <dest>]
                                            [--results <dir>] <path>...
```

- `<path>` — любое число путей: `*.xcframework.zip` распаковывается, `*.xcframework`
  копируется, каталог сканируется на оба вида (без рекурсии). Так скрипт принимает и
  `release-artifacts/`, и `build/` + `DesignSystemBuilder/build/` + `Themes/build/`.
- Наполняет `IntegrationTests/XCFrameworkIntegration/Frameworks/` с нуля, проверяет, что на
  месте `SDDSThemeCore`, `InputMask`, `SDDSComponents`, `SDDSIcons` и xcframework каждой
  запрашиваемой темы; иначе exit 1 с перечнем.
- `--theme` — какие схемы гонять (по умолчанию все, для которых есть xcframework и таргет).
- `--destination` — по умолчанию первый доступный iPhone с самой новой iOS из
  `xcrun simctl list -j devices available` (на раннере и локально версии разные, поэтому
  не хардкодим).
- На каждую тему: `xcodebuild test -project … -scheme Integration<Scheme> -destination …
  -resultBundlePath <results>/<Scheme>.xcresult`, `set -o pipefail`. Итоговый статус —
  ноль только если все темы прошли; печатает таблицу тема → результат.
- Локальный сценарий: `scripts/release/build_release.sh local --skip-cli` (или
  `scripts/build_all_static_dependencies.sh`), затем скрипт с нужными путями.

### 4. `.github/workflows/integration-test.yml` — «Release artifacts integration»

```
on:
  push: { branches: [develop] }
  pull_request: { branches: [main] }
  workflow_dispatch:
concurrency: { group: ${{ github.workflow }}-${{ github.ref }}, cancel-in-progress: true }
```

Все macOS-джобы: `runs-on: macos-26`, `setup-xcode` `26.6` (как `publish-release.yml`),
checkout с `submodules: recursive`, `bundle install`.

Джобы и слои кэша:

| Джоба | Раннер | Что делает | Кэш (path) | Ключ |
|---|---|---|---|---|
| `keys` | ubuntu-latest | считает ключи слоёв и список тем (JSON для матриц) | — | — |
| `core` | macos-26 | `build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore` | `DesignSystemBuilder/build/SDDSThemeCore.xcframework` | `core-<v>-<xcode>-hash(DesignSystemBuilder/SDDSThemeCore/**, DesignSystemBuilder/DesignSystemBuilder.xcodeproj/**, scripts/build_xcframeworks.rb, scripts/common.rb)` |
| `components` | macos-26 | `build_xcframeworks.rb -d . -w SDDS.xcworkspace` | `build/InputMask.xcframework`, `build/SDDSComponents.xcframework`, `build/SDDSIcons.xcframework` | `components-<v>-<xcode>-<core key>-hash(SDDSComponents/**, SDDSIcons/**, SDDSApiInfo/**, Vendor/**, SDDS.xcworkspace/**, Package.swift, scripts/build_inputmask.rb)` |
| `theme` (matrix по темам) | macos-26 | `build_themes.rb <Dir>` | `Themes/build/<Scheme>.xcframework.zip` | `theme-<Scheme>-<v>-<xcode>-<components key>-hash(Themes/<Dir>/**, scripts/build_themes.rb)` |
| `integration` (matrix по темам) | macos-26 | restore трёх слоёв → `run_integration_test.sh --theme <Scheme> build DesignSystemBuilder/build Themes/build` | — | — |
| `integration-test` | ubuntu-latest, `if: always()` | падает, если любая нужная джоба не `success` | — | — |

Каждая сборочная джоба: `actions/cache/restore` по точному ключу → если `cache-hit != 'true'`,
собрать → `actions/cache/save`. Нижестоящие джобы восстанавливают верхние слои по тем же
точным ключам из outputs `keys`. `<v>` — ручной `CACHE_VERSION` в `env` воркфлоу для
принудительной инвалидации. `<xcode>` — версия из `setup-xcode`. Ключи `hashFiles` считаются
на ubuntu-джобе `keys`, после checkout с submodules — так Vendor попадает в хэш.

Джоба `integration` при падении загружает `<Scheme>.xcresult` артефактом
`integration-<Scheme>-xcresult` (retention 14 дней).

Required status check для ruleset — контекст `Integration test (all themes)` (display name
джобы `integration-test`). Один контекст вместо матрицы: список тем меняется, ruleset — нет.

Ожидаемое время: холодный кэш ~55–60 мин (core 5 → components 20 → темы 10 параллельно →
тесты 8 параллельно); изменился компонент ~40 мин; изменилась только тема ~20 мин; PR в
`main` после `develop` ~12 мин (только тесты).

### 5. Ruleset на `main`

Создаётся отдельным шагом после первого зелёного прогона воркфлоу на `develop`, через
`gh api repos/salute-developers/plasma-ios/rulesets` (`target: branch`, `enforcement: active`,
`ref_name.include: [refs/heads/main]`):

- `pull_request` — изменения в `main` только через PR (прямой push запрещён);
- `required_status_checks` — `Integration test (all themes)`, `strict: false`.

Без bypass-акторов. Теги (`create_tag_release.yml`, `publish-release.yml`) под ruleset ветки
не попадают. Существующие PR-воркфлоу (`test.yml`, `verify-snapshots.yml`, `lint.yml`) в
required не добавляем — отдельное решение владельца.

### 6. Документация и память

- `IntegrationTests/CLAUDE.md` — что это, как запустить локально, как перегенерировать проект.
- Корневой `CLAUDE.md` (карта пакетов), `scripts/CLAUDE.md`, `README.md` (раздел про
  подключение xcframework'ов: какие Embed, какие нет — по факту прогона).
- `.claude/memory/plasma-ios-decisions.md` — запись о проверке и ruleset.
- `.gitignore`: `IntegrationTests/XCFrameworkIntegration/Frameworks/`, `TestResults/`.

## Проверка

1. Локально: `scripts/release/build_release.sh local --skip-cli`, затем
   `scripts/integration/run_integration_test.sh release-artifacts` — три схемы зелёные.
2. Негативная проверка: удалить `SDDSIcons.xcframework` из `Frameworks/` — скрипт падает с
   перечнем недостающих, не доходя до `xcodebuild`.
3. Воркфлоу: `workflow_dispatch` на ветке фичи — холодный прогон зелёный; повторный
   `workflow_dispatch` без изменений — все три слоя из кэша, только `integration` работает.
4. Ruleset: после мержа в `develop` и зелёного прогона — создать, убедиться в GitHub UI, что
   PR в `main` показывает required check.

## Риски

- Ресурсы статического `SDDSComponents` (спиннер) при Do Not Embed могут не доехать в бандл
  приложения. Тест это и должен выявить; решение (copy-resources фаза / отдельный bundle)
  фиксируется в README, Embed статических фреймворков не рассматривается.
- Симулятор на `macos-26` с Xcode 26.6 — авто-выбор устройства скриптом; если runtime не
  установлен, `xcodebuild test` падает с понятной ошибкой.
- `actions/cache` — 10 ГБ на репозиторий, 7 дней без обращений. Слои по 1–30 МБ, риска нет.
- `SDDSApiInfo` вырезается из `.swiftinterface` скриптом сборки; если импорт понадобится
  клиентам, интеграционная сборка это покажет на этапе компиляции.
