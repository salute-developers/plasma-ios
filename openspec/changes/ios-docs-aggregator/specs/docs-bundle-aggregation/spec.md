# docs-bundle-aggregation

Сборка дерева документационного бандла `.sdds/temp/docs/` — функциональный аналог Android
`DocumentationAggregateTask`; выход потребляется `dsbuilder docs generate --platform swiftui`
без модификаций CLI.

## ADDED Requirements

### Requirement: Layout выходного дерева
Команда агрегации SHALL записывать в выходной каталог (по умолчанию
`SDDSThemeBuilder/.sdds/temp/docs/`): `content/core/**.md`, `content/user/**.md`,
`structure-core.json`, `structure-user.json`, `meta/components-info.json`,
`meta/theme-info.json`, `meta/samples.json`, `meta/platform-context.json`,
`assets/examples/swift/**`, `assets/screenshots/**`. `components-info`/`theme-info` SHALL
копироваться из выходов theme-builder (`.sdds/config-info-swiftui.json`,
`.sdds/theme-info.json`); отсутствие обязательного входа — ошибка с указанием файла.

#### Scenario: Полный layout
- **WHEN** агрегация выполняется при подготовленных входах
- **THEN** в выходном каталоге присутствуют все перечисленные файлы/каталоги, и layout
  структурно совпадает с эталонным Android-бандлом (те же имена и расположение meta-файлов)

### Requirement: Core-контент и структура
Агрегатор SHALL читать Core-документацию из `docs-template/swiftui-template/docs/`
(markdown + `structure.json` с навигацией), валидировать, что каждый `path` из структуры
существует (и предупреждать об orphan-файлах), рендерить страницы в `content/core/<path>` и
записывать `structure-core.json`.

#### Scenario: Страница из структуры попадает в content/core
- **WHEN** `structure.json` содержит страницу `components/BasicButtonUsage.md`
- **THEN** отрендеренный файл существует по пути `content/core/components/BasicButtonUsage.md`
  и упомянут в `structure-core.json`

#### Scenario: Битая ссылка структуры — ошибка
- **WHEN** `structure.json` ссылается на несуществующий md-файл
- **THEN** агрегация завершается ошибкой с путём отсутствующего файла

### Requirement: User-слой с правилами merge
Агрегатор SHALL читать user-слой из `Themes/<Theme>/docs/override-docs/` (markdown +
`structure.json`), рендерить в `content/user/<path>` и записывать `structure-user.json`;
правило `merge: append` SHALL требовать `+`-префикс имени файла, `merge: replace` —
допускаться, `merge: prepend` — отклоняться с ошибкой (паритет с Android).

#### Scenario: Append требует префикс
- **WHEN** user-страница объявлена с `merge: append`, но файл не имеет `+`-префикса
- **THEN** агрегация завершается ошибкой с объяснением конвенции

### Requirement: Рендер маркеров
Агрегатор SHALL обрабатывать маркеры в markdown: `// @sample: <путь>` внутри
swift-кодового fence (и `<!-- @sample: -->` вне fence) SHALL заменяться содержимым
соответствующего файла из `assets/examples/`; `<!-- @style-api -->` SHALL заменяться
таблицей параметров стиля и примером вызова, построенными из `components-info.json` по имени
компонента (имя файла минус `Usage.md`); `<!-- @screenshot: <fqName> -->` SHALL оставаться
в тексте без изменений (passthrough). Нерезолвящийся `@sample`-маркер SHALL приводить к
ошибке (не к молчаливому пропуску).

#### Scenario: Инлайн сэмпла
- **WHEN** страница содержит fence с `// @sample: .../BasicButton_Simple.swift`
- **THEN** в `content/core/**` fence содержит код сниппета, маркер удалён

#### Scenario: Style-api таблица
- **WHEN** страница `BasicButtonUsage.md` содержит `<!-- @style-api -->`
- **THEN** маркер заменён таблицей параметров стиля BasicButton из components-info

#### Scenario: Screenshot passthrough
- **WHEN** страница содержит `<!-- @screenshot: <fqName> -->`
- **THEN** маркер присутствует в выходном файле без изменений

#### Scenario: Нерезолвящийся сэмпл — ошибка
- **WHEN** `@sample:`-маркер ссылается на несуществующий сниппет
- **THEN** агрегация завершается ошибкой с путём страницы и маркером

### Requirement: platform-context.json
Агрегатор SHALL записывать `meta/platform-context.json` с как минимум
`{artifact: {id, version}, platform: "swiftui"}` (значения — из конфигурации темы/параметров
запуска); поле `platform` MUST равняться `"swiftui"`, иначе `dsbuilder docs generate
--platform swiftui` отклонит дерево.

#### Scenario: Контекст платформы валиден
- **WHEN** агрегация завершилась
- **THEN** `meta/platform-context.json` существует, `platform == "swiftui"`, `artifact.id` и
  `artifact.version` непустые
