# Design: разделение генерации на iOS и сверка с Android/DS Builder

Документ состоит из двух частей: разбор изменений флоу генерации в соседних репозиториях
(сентябрь 2026) и список того, что из них применимо к iOS.

## Часть 1. Что изменилось в DS Builder и plasma-android

### plasma-android PR #920 — пер-платформенные таски генерации

Главное изменение флоу. Плагин `dsBuilder` регистрирует отдельную таску на каждую
сконфигурированную платформу:

| Capability | Compose | View |
|---|---|---|
| theme | `generateComposeTheme` | `generateViewTheme` |
| components | `generateComposeComponents` | `generateViewComponents` |
| documentation | `aggregateComposeDocumentation` | `aggregateViewDocumentation` |

Правила, которые задали в спеке `ds-builder-gradle-dsl`:

- таска регистрируется **только** для платформы, которую модуль действительно сконфигурировал;
  запрос ненастроенной платформы даёт «task not found», а не молчаливую генерацию не того;
- общие `generateTheme`/`generateComponents`/`documentationAggregate` остаются под теми же
  именами, с тем же типом и прежним поведением — именно они висят в `preBuild`,
  пер-платформенные таски в `preBuild` не добавляются;
- `.sdds` резолвится общим свойством `sddsDirectory` (текущий проект → родительский → явное
  значение), с понятной ошибкой и списком проверенных путей;
- info-файлы именуются по платформе: `config-info-compose.json` / `theme-info-compose.json`,
  `config-info-view-system.json` / `theme-info-view-system.json`;
- результат генерации автоформатируется (`spotlessApply`).

Вторая спека того же PR, `components-builder-dsbuilder-source`: локальная `.sdds/components`
становится источником компонентов, когда явный `source(...)` не задан. Для локального источника
плагин **не** регистрирует `fetchComponents`/`unpackComponentFiles` — конфиги читаются напрямую,
`meta.json` обязателен, отсутствие директории или меты даёт явную ошибку с путём.

### design-system-builder PR #74 — Android-делегат в CLI

Следствие #920 на стороне CLI: `AndroidGradleDelegate` объявляет платформы `compose` +
`android-view` и **все три** capability (`THEME`, `COMPONENTS`, `DOCS_AGGREGATE`), а запуск —
это `gradlew -p <workspace> <таска>` в проекте пользователя. Карта `(capability, platform) → таска`
один в один повторяет таблицу выше. `--output` у Android нет: путь вывода задаётся в
`build.gradle.kts` модуля, и делегат прямо сообщает об этом.

### design-system-builder: остальные изменения сентября

- **#85 «Components CLI»** — js-CLI и фикстуры `.sdds` с тенантами; закрепляет `.sdds/components`
  как формат обмена (`meta.json` + конфиг на вариацию).
- **#80 «Насыщение компонентами и улучшение архитектуры»** — у appearances и properties появилась
  колонка `platform`; у компонента может быть **несколько appearance** со своими вариациями
  и дефолтами; прод-сиды переведены на «папку на компонент» без идентификаторов, единый формат
  для сида, выгрузки и импорта.
- **#84** — новые дизайн-системы создаются без компонентов; при отсутствии компонентов раздел
  редактирования недоступен и в пакет они не попадают.
- **#82** — зафиксирован жизненный цикл публикации документации.
- **#87** — флоу публикации пакета с отслеживанием версии в npm.
- **#71 / #68 / #69** — контракт платформенных делегатов, iOS-делегат и `toolchain install`
  (уже сделано с нашей стороны).

### plasma-android: смежное

- **#930** — гайды для потребителей MCP и CLI в docs-template.
- **#911** — миграция Segment/ComboBox/Autocomplete на `StatefulValue`; на iOS аналогичная
  миграция 15 appearance уже прошла (`583b88c61`), `ios-api-meta.json` перегенерирован.

## Часть 2. Что из этого применимо к iOS

| # | Изменение у соседей | Что соответствует на iOS | Статус |
|---|---|---|---|
| 1 | Раздельные таски theme/components | Подкоманда `components generate --sdds` у `dsbuilder-ios`; `theme generate` перестаёт генерировать вариации | **Делаем в этой задаче** |
| 2 | Делегат объявляет `COMPONENTS` | `IosCliDelegate.capabilities` += `COMPONENTS`, argv `components generate` | **Делаем в этой задаче** |
| 3 | Старые общие таски сохраняют поведение | `themes` и текущий проход «тема + компоненты» остаются рабочими | **Делаем в этой задаче** |
| 4 | `.sdds/components` как источник компонентов | `ComponentConfigSource` читает `meta.json` + конфиги из `.sdds/components`, theme-converter — fallback | **Делаем в этой задаче** |
| 5 | `spotlessApply` после генерации | Прогон `swiftformat`/`swiftlint --fix` по сгенерированному дереву | **Делаем в этой задаче** |
| 6 | Пер-платформенные таски для documentation | На iOS платформа одна (`swiftui`), `docs aggregate --sdds` уже платформенная | Не требуется |
| 7 | Compose/View как две платформы | UIKit-вариации генерируются вместе со SwiftUI, отдельной платформы нет | Не требуется |
| 8 | Резолюция `.sdds` вверх по дереву | У iOS путь приходит от CLI (`--sdds`), поиск вверх делает `dsbuilder` | Уже есть |
| 9 | Именование info-файлов по платформе | У iOS `config-info-ios.json` + `config-info-tokens-ios.json` против Android `config-info-<platform>.json` + `theme-info-<platform>.json` — расходится конвенция имени «theme-info» | Отдельная задача, если нужен паритет имён |
| 10 | Несколько appearance у компонента, `platform` у properties (#80) | iOS-генератор исходит из одного `*Appearance` на компонент (DS делит basic/icon/link button — маппинг ручной) | Отдельная задача, оценить после перехода на `.sdds/components` |
| 11 | ДС без компонентов (#84) | `components generate` на пустом наборе должен завершаться успешно и внятно, а не падать | Учесть в приёмке п.1 |
| 12 | Гайды для потребителей CLI (#930) | README по iOS-флоу в dsbuilder (PR #73) + раздел про `components generate` после этой задачи | Дописать по завершении |

## Ключевой риск

Пункты 1 и 4 связаны: если разделить команды, но оставить источником theme-converter,
`components generate` будет генерировать набор вариаций темы из theme-converter, а не компоненты
дизайн-системы из DS Builder — то есть команда появится, а смысл останется прежним. Поэтому в
приёмке задачи оба пункта проверяются вместе: `dsbuilder components fetch` → `.sdds/components`
→ `dsbuilder components generate --platform swiftui` даёт ровно те вариации, что лежат в `.sdds`.

## Проверка

Сквозной прогон на реальных бинарях, как для делегата:

1. `dsbuilder theme fetch` и `dsbuilder components fetch` наполняют `.sdds`;
2. `dsbuilder theme generate --platform swiftui` — только токены, вариаций нет;
3. `dsbuilder components generate --platform swiftui` — вариации из `.sdds/components`;
4. `dsbuilder docs generate --platform swiftui` — бандл собирается на результатах шагов 2–3;
5. старый вход (`dsbuilder-ios themes` / проход «тема + компоненты») даёт прежний результат.
