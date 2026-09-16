# Design: iOS Documentation Aggregator

## Context

Целевой пайплайн DS Builder: платформенный агрегатор пишет обогащённое дерево документации в
`.sdds/temp/docs/`; CLI `dsbuilder docs generate` читает его, мержит
`structure-core.json`+`structure-user.json` в `docs.json`, строит `manifest.json`, пакует
tar.gz; `docs publish` загружает в Documentation Service.

Эталон — текущая Android-реализация (plasma-android `origin/develop`, PR #865,
`sdds-core/plugin_theme_builder/.../documentation/`):

- `components-info.json` и `theme-info.json` пишет **theme-builder** при генерации темы
  (`GenerateComponentsTask` → `.sdds/config-info-compose.json`, `GenerateThemeTask` →
  `.sdds/theme-info-compose.json`), агрегатор их копирует в `meta/`.
- Сэмплы: аннотация `@DocSample(id="", needScreenshot=true)`; `ExtractCodeSnippetsTask`
  (PSI/kotlin-compiler-embeddable) извлекает тела `codeSnippet`/`composableCodeSnippet`-лямбд
  (substring исходника, деиндент, `placeholder(x,"text")`→`"text"`), пишет `samples.json`
  (`{id, kind, fqName, file, snippetPath, snippetStartOffset, snippetEndOffset}`, офсеты в
  исходный файл) + сниппеты; агрегатор мержит Core+local (дедуп по id, local wins) и
  переписывает `snippetPath` → `assets/examples/{kotlin|xml}/…`.
- Скриншоты: Roborazzi-тесты, файл `id.replace(".","_")+".png"`, только компоненты из
  `ProvidedStyleKeys` (из config-info); агрегатор копирует в `assets/screenshots/`.
- Маркеры markdown: `@sample:` — инлайн; `<!-- @style-api -->` — таблица из components-info;
  `<!-- @screenshot: fqName -->` — passthrough (резолвится потребителем, не агрегатором).
- Core-шаблоны: md + `structure.json` (JAR `META-INF/sdds-docs/`); user-слой `override-docs/`
  per theme (`merge: append|replace`; append требует `+`-префикс, prepend отклоняется).

Golden-контракт iOS (backend `design-system-builder`, `InfoArtifactDtos.kt` + фикстуры
`contracts/ios-components.json`, `ios-theme.json`): платформа **`swiftui`**; форматы
`sdds-swiftui-components-info-v1` и `sdds-ios-theme-info-v1`; вариации несут **`reference`**
(`"FormItem.M"`), не `composeReference`; `styleApi.returnTypeName` вида
`AppearanceVariation<FormItemAppearance>`, `params[].typeName` вида `FormItemStyles.Size`;
токены темы — `themeReference` вида `SampleTheme.AdaptiveTypographyToken.headerH2Medium`,
без поля `platform`. Обязательные поля: `key` (non-blank), `coreName`, `styleName`,
`variations` (список), у токена `type`/`name`/`value`; `reference`/`themeReference` должны
быть согласованы между слоями одного `key`.

В plasma-ios уже есть: `ios-api-meta.json` (SwiftSyntax-сканер `Tools/SDDSApiInfoGenerator`),
DS-мета `components/<theme>/meta.json` (variations/props), 58 сэмплов с `// @DocSample` +
`swiftCodeSnippet{}`/`placeholder()` в `SDDSComponentsFixtures`, theme-слой сэмплов
`Themes/<Theme>/docs/Samples`, snapshot-тесты (`SDDSDemoAppTests/SnapshotTests`, per-theme,
Light/Dark), 52 md с `// @sample:`-маркерами в `docusaurus/swiftui-template/docs/`.

## Goals / Non-Goals

**Goals:**

- Бандл-дерево `.sdds/temp/docs/`, которое `dsbuilder docs generate --platform swiftui`
  принимает без правок CLI; структурный паритет с Android-эталоном
  (`docs-bundle.tar.gz`).
- Info-артефакты, валидные по golden-контракту backend (адаптеры `sdds-swiftui-*`/`sdds-ios-*`).
- Переиспользование существующих механизмов: `// @DocSample`-конвенция, snapshot-тесты,
  theme-builder-генерация, docusaurus-контент как стартовый корпус.

**Non-Goals:**

- Реализация `dsbuilder` (merge structure, docs.json/manifest, tar.gz, publish) — внешний CLI.
- Изменение/замена `docusaurus/*` пайплайна (живёт параллельно, как на Android).
- Swift-макрос `@DocSample` (блокирован `swift-tools-version:5.3` у Fixtures) — follow-up.
- UIKit-платформа (`sdds-uikit-components-info-v1`) — после SwiftUI.

## Decisions

1. **Info-артефакты генерирует `SDDSThemeBuilder`** (не отдельный тул поверх
   `ios-api-meta.json`). Так на Android (theme-builder = источник config-info/theme-info), и
   только theme-builder знает одновременно DS-мету (variations/props), имена
   Appearance/SizeConfiguration (из api-меты) и dot-notation вариаций (`FormItem.M` →
   `variations[].reference`). Альтернатива — reshape `ios-api-meta.json` отдельным тулом —
   отвергнута: у api-меты нет вариаций и DS-значений props.
2. **Экстрактор сэмплов и агрегатор — один SwiftPM-бинарь `Tools/SDDSDocsAggregator`**
   (SwiftSyntax). SwiftSyntax нельзя тянуть в xcodebuild-граф `SDDSThemeBuilder` (ломает
   macro-плагины — известное правило репо); прецедент изоляции — `SDDSApiInfoGenerator`.
   Две подкоманды (`extract`, `aggregate`) вместо двух пакетов — общий код моделей/фс.
3. **Маркер `// @DocSample`-коммент, не макрос.** Паритет функциональный: Android-аннотация
   имеет `id`/`needScreenshot` — поддерживаем их как `// @DocSample id=... needScreenshot=false`.
   Реальный макрос требует tools-version 5.9+ у `SDDSComponentsFixtures` — отдельная миграция.
4. **Схема `samples.json` — как у Android** (`id/kind/fqName/file/snippetPath/offsets`, офсеты
   в исходный .swift). Файл сервисом пока не читается (толерируется), поэтому байт-совместимость
   не нужна, но одинаковая форма упрощает будущую спецификацию. `kind`: `view`/`regular`/
   `mixed`; `fqName` = `<module>.<subpath>.<имя>` (у Swift нет пакетов — фиксируем конвенцию).
5. **Сниппеты в `assets/examples/swift/**`** (Android: `kotlin|xml`). Подкаталог по языку —
   та же конвенция.
6. **Core-контент в репо** (`docs-template/swiftui-template/docs/**` + `structure.json`), без
   JAR-механики: у SwiftPM нет аналога resolvable configuration; доставка Core-шаблонов
   артефактом (`sdds-ios-core-docs-*.zip`) — упрощение, допустимое до появления такого
   артефакта у DS Builder. Агрегатор принимает путь к Core-докам параметром, чтобы позже
   переключить источник.
7. **`platform-context.json` пишет агрегатор** (`{artifact:{id,version}, platform:"swiftui"}` +
   расширения по образцу Android-бандла). В plasma-android его никто не пишет, но CLI требует
   файл и валидирует `platform`; лишние ключи CLI игнорирует.
8. **Скриншоты — существующая snapshot-инфраструктура** (`SDDSDemoAppTests`), новый сьют по
   реестру сэмплов: рендер `@DocSample`-вью с `needScreenshot != false`, фильтр по компонентам
   из config-info (аналог `ProvidedStyleKeys`), имя `fqName.replace(".","_")+".png"`.
   Альтернатива (отдельный headless-рендерер) отвергнута: дублирует готовую инфраструктуру.
9. **Рендер маркеров идентичен Android**: `@sample:` инлайнится (fail loud при нерезолве),
   `<!-- @style-api -->` → таблица параметров + примеры вызова из config-info-swiftui,
   `<!-- @screenshot: -->` — passthrough. Правила merge user-слоя: `append` (файл с `+`),
   `replace`; `prepend` — ошибка.

## Risks / Trade-offs

- [Схема style-api-таблицы (`@style-api`-рендер) в Android завязана на Kotlin-идиомы
  (builder-цепочки)] → взять iOS-идиому из golden-фикстуры (`AppearanceVariation<...>`,
  dot-notation) и зафиксировать шаблон в тестах; расхождение в текстовом рендере допустимо —
  сервис парсит meta, а не таблицу.
- [Маркерный синтаксис нигде не специфицирован (де-факто Android)] → копируем букву
  Android-конвенции; поднять вопрос владельцам спеки (уже отмечено в proposal).
- [`// @DocSample`-коммент не проверяется компилятором (в отличие от аннотации)] →
  `--report`-режим экстрактора: сэмпл-файл без валидного маркера/структуры — предупреждение;
  follow-up на макрос при апгрейде tools-version.
- [Core-контент из docusaurus может отставать от Android-шаблонов] → конвертация — стартовое
  наполнение; источник правды дальше — ручное сопровождение `docs-template/`, вопрос
  Core-артефакта DS Builder остаётся открытым.
- [E2E зависит от бинаря `dsbuilder` (внешний репо)] → e2e-шаг делаем опциональным
  (скрипт проверяет наличие CLI), структурный дифф с эталонным бандлом — обязательный.
- [Скриншоты: Android снимает через Robolectric один вариант; наша инфра умеет Light/Dark] →
  для паритета снимаем один вариант (Light); Dark — расширение после ответа сервиса.

## Migration Plan

Фичефлагов не требуется: все артефакты — новые файлы под `.sdds/` (gitignored) и новые
каталоги; существующие пайплайны (docusaurus, генерация тем) не затрагиваются. Откат = не
запускать новые команды. Порядок внедрения = фазы 1→4 (см. tasks), каждая фаза
самостоятельно ценна и мержится отдельно.

## Open Questions

- Значения `kind` в `samples.json` для iOS (`view`?) и вид `fqName` без пакетов — согласовать
  с владельцами Documentation Service (файл пока не читается — не блокирует).
- Ожидания сервиса по вариантам скриншотов (Light/Dark, scale) — не блокирует фазы 1–3.
- Доставка Core-доков артефактом `sdds-ios-core-docs-*.zip` (когда появится у DS Builder) —
  сейчас Core живёт в репо.
- `artifact.id/version` для `platform-context.json` iOS (аналог `sdds-sbcom-compose`) —
  уточнить конвенцию имён; временно — из конфигурации темы.
