# Proposal: iOS Documentation Aggregator

## Why

SDDS переходит на централизованную публикацию документации через DS Builder (`dsbuilder docs
generate/publish` → Documentation Service). Android уже поставляет документационный бандл
(plasma-android PR #865, агрегатор в `plugin_theme_builder`); backend содержит golden-контракты
для iOS (`ios-components.json`/`ios-theme.json`, форматы `sdds-swiftui-components-info-v1` /
`sdds-ios-theme-info-v1`), и SwiftUI входит в MVP CodeBinding сервиса — но у plasma-ios
поставщика бандла нет. Нужен iOS-агрегатор с паритетом к текущей Android-реализации, чтобы
документация iOS-компонентов публиковалась тем же пайплайном.

## What Changes

- `DesignSystemBuilder` генерирует два info-артефакта при генерации темы:
  `.sdds/config-info-swiftui.json` (components-info: key/coreName/styleName/props/styleApi/
  variations с `reference` в dot-notation, например `FormItem.M`) и `.sdds/theme-info.json`
  (токены темы с `themeReference` и значениями).
- Новый SwiftPM-тул `Tools/SDDSDocsAggregator` (SwiftSyntax, вне xcodebuild-графа — по
  образцу `Tools/SDDSApiInfoGenerator`):
  - экстрактор сэмплов: `// @DocSample`-маркеры в `SDDSComponentsFixtures` и
    `Themes/<Theme>/docs/Samples` → `samples.json` + извлечённые `.swift`-сниппеты
    (unwrap `swiftCodeSnippet{}`, свёртка `placeholder()`, офсеты в исходник);
  - команда агрегации: сборка `.sdds/temp/docs/` (content core/user, `structure-core.json` +
    `structure-user.json`, `meta/*`, `platform-context.json`, `assets/{examples,screenshots}`),
    рендер маркеров `@sample:` (инлайн) и `<!-- @style-api -->` (таблица параметров стиля),
    passthrough `<!-- @screenshot: -->`.
- Новый корпус Core-документации `docs-template/swiftui-template/docs/**` + `structure.json`
  (стартовое наполнение — конвертация 52 md из `docusaurus/swiftui-template/docs/`).
- Скриншоты сэмплов через существующую snapshot-инфраструктуру `SDDSDemoAppTests` c именами
  `fqName_underscored.png` и фильтром по компонентам из config-info.
- Обвязка: `scripts/generate_docs_bundle.sh`, шаг `swift test` нового тула в
  `scripts/run_tests.rb`.
- НЕ меняется: `docusaurus/*` (живёт параллельно, как legacy-путь на Android), `SDDSApiInfo/*`,
  dsbuilder CLI (переиспользуется как есть: `dsbuilder docs generate --platform swiftui`).

## Capabilities

### New Capabilities

- `docs-info-artifacts`: генерация `config-info-swiftui.json` и `theme-info.json` в
  `DesignSystemBuilder` по golden-контракту backend (`InfoArtifactDtos`, фикстуры
  `ios-components.json`/`ios-theme.json`).
- `docs-sample-extraction`: обнаружение `// @DocSample`-сэмплов и извлечение сниппетов
  (SwiftSyntax) в `samples.json` + `assets/examples/swift/**` — функциональный аналог
  Android `ExtractCodeSnippetsTask`.
- `docs-bundle-aggregation`: сборка `.sdds/temp/docs/` (слои Core/user, структуры, meta,
  platform-context, рендер маркеров) — функциональный аналог Android
  `DocumentationAggregateTask`, потребляемый `dsbuilder docs generate --platform swiftui`.
- `docs-sample-screenshots`: снятие скриншотов `@DocSample`-сэмплов существующей
  snapshot-инфраструктурой и доставка их в `assets/screenshots/`.

### Modified Capabilities

_нет (существующих спеков в `openspec/specs/` нет)._

## Impact

- `DesignSystemBuilder/DesignSystemBuilderCore` — новые генераторы info-артефактов, интеграция в
  `GenerateComponentCommand`/`GenerateTokensCommand`.
- Новый пакет `Tools/SDDSDocsAggregator` (SwiftPM, swift-syntax) + его тесты.
- Новые каталоги: `docs-template/swiftui-template/docs/**`, `Themes/<Theme>/docs/override-docs/`.
- `SDDSDemoApp/SDDSDemoAppTests` — новый сьют скриншотов сэмплов.
- `scripts/` — новый `generate_docs_bundle.sh`, правка `run_tests.rb`; `CONTRIBUTING.md`
  (скоуп коммитов), корневой `CLAUDE.md` (карта).
- Внешние зависимости: контракт backend `design-system-builder` (DTO/форматы), CLI `dsbuilder`
  из того же репо для e2e-проверки. Открытые вопросы владельцам спеки: синтаксис маркеров
  (де-факто Android-конвенция, нигде не специфицирован) и значения `kind` в `samples.json`
  для iOS.
