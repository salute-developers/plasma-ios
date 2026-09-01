# CLAUDE.md — SDDSApiInfoGenerator

SwiftSyntax-тул: генератор **`ios-api-meta.json`** — iOS-аналог Android
`uikit-api-meta.json` («агрегатор API стилей»). Снимает «слепок» публичного API стилей
компонентов из `*Appearance`-структур `SDDSComponents` — единый источник правды, из
которого потом кормятся кодоген тем и рантайм-конфигуратор демо.

## Что делает

1. Парсит все `.swift` в `SDDSComponents/Sources` (SwiftSyntax), строит таблицу типов
   (struct/class/protocol/enum + их свойства).
2. Для каждого `public struct *Appearance` (или помеченного `// sdds:component=`)
   **рекурсивно** раскрывает свойства в `params`, уходя в под-структуры/протоколы как в
   группы (iOS-аналог лямбда-групп Android `colors {}`/`dimensions {}`).
3. Классифицирует тип каждого свойства в категорию (`color`/`typography`/`dimension`/
   `shape`/`shadow`/`icon`/`component_style`/`value`/…).
4. Сериализует массив компонентов в JSON, зеркалящий контракт Android.

## Аннотации (макросы `SDDSApiInfo`)

Разметка — настоящие Swift-атрибуты: пакет [SDDSApiInfo](../../SDDSApiInfo) объявляет
маркерные макросы (`@attached(peer)`, раскрываются в пустоту), сканер читает их из
`AttributeListSyntax`. Опечатка в имени атрибута — ошибка компиляции, а не молчаливо
не сработавший маркер.

| Android | iOS |
|---|---|
| `@ApiInfo` (маркер билдера, **opt-in**) | `@ApiInfo` на `*Appearance` (или `@ApiComponent("<Name>")`) |
| `@ApiInfo(components = [...])` | `@ApiInfo(components: ["<Component>", …])` — какие компоненты генерятся из этого типа (`BadgeClear`/`IconBadge` → `BadgeAppearance`) |
| `@ApiName(name)` (id ≠ имя функции) | `@ApiName("<id>")` на property |
| `@ApiStateSet` (enum состояний) | `@ApiStateEnum("<EnumName>")` на struct |
| skip-методы | `@ApiIgnore` на property/struct |
| — | `@ApiType(.iconSize)` — форс категории |
| — | `@ApiName("<id>", state: .checked)` — значение из состояния конфига |
| — | `@ApiCopy("<property>")` — значение повторяет соседнее свойство |
| `@ApiName` на значении enum | `@ApiName("<id>")` на case — id значения в конфиге |
| `sdds:api_default` | `@ApiDefault` на case — значение, не совпавшее ни с одним id, проецируется сюда |
| `sdds:api_value` | `@ApiValue("<выражение>")` — значение из разметки: литерал либо `point(x, y)` / `size(w, h)` / `insets(t, l, b, tr)` / `alpha(key)`; `_` на месте ключа значит «ключа нет», `0` — ноль |
| — | `@ApiFromVariation` — значение берётся из id вариации, конфиг его не несёт |
| — | `@ApiRawNumber` — число печатается как есть (`0.4`), без обёртки `CGFloat(...)` |
| — | `@ApiAlwaysEmit` — свойство эмитится всегда, даже когда значения в конфиге нет |
| — | `@ApiStateOnly` — значение только из состояния `@ApiName(state:)`, без отката на базовое значение ключа (состояние есть не у всех компонентов, делящих один протокол размеров) |

**Opt-in как Android:** компонент — ТОЛЬКО struct с `@ApiInfo` (или `@ApiComponent`);
авто-детект по суффиксу отключён (без маркера struct невидим для меты, как неаннотированный
builder для KSP). Имя компонента по умолчанию = имя struct без `Appearance`.
`id` свойства = имя property; большинство `@ApiName` не требуют (как и на Android).

**Каналы поставки.** Макрос — compiler plugin, поэтому он тянет в граф сборки swift-syntax
и host-исполняемый файл. Отсюда два следствия, оба закрыты:
- xcframework: настройки сборки (`MACH_O_TYPE`, `BUILD_LIBRARY_FOR_DISTRIBUTION`, `SKIP_INSTALL`)
  и `-sdk` **нельзя** передавать в командной строке `xcodebuild` — они применяются ко всем
  таргетам графа и ломают плагин. Живут в настройках таргета (см. `scripts/build_xcframeworks.rb`).
- standalone flat-folder: маркеры и `import SDDSApiInfo` вырезаются в `StandaloneBundle.swift`,
  guard падает, если маркер просочился.

## Сверка config-id ↔ Appearance (ключевое)

Имя свойства в конфиге (= поле `<Component>Props` в `DesignSystemBuilderCore/Model/Props/*.swift`,
snake_case в JSON) часто **не совпадает** с именем property в `Appearance` (`titleStyle`↔`titleTypography`,
`formItemType`↔`formType`). Генератор ищет свойство в мете по config-id, поэтому мета **ключуется по
config-id**. Правило владельца: **имена свойств в `Props`/`Appearance` (Swift) переименовывать НЕЛЬЗЯ**;
всё остальное — как удобно. Поэтому мост строится вне Swift:

1. Тул читает неизменённые `*Props` (`--props`) → авторитетный словарь config-id + категории.
2. Авто-реконсайл: exact → alias (`*Style`↔`*Typography`/`*Appearance`) → база+категория. Покрывает ~76%.
3. Остаток (семантика: `label`↔`title`, `description`↔`subtitle`, и т.п.) — **аннотации-комменты
   `// sdds:apiName=<configId>` прямо на свойстве Appearance** (как Android `@ApiName`; свойство НЕ
   переименовывается). Таблиц/sidecar НЕТ — маппинг живёт в библиотеке. Reconcile-fast-path берёт
   `param.id` из маркера (только когда `id != methodName`).
4. Структурные (`indicatorOffsetX/Y`→единый `CGPoint`, padding-split→`EdgeInsets`) и значения, которых
   в конфиге нет, — `@ApiValue` на свойстве (аналог `sdds:api_value`). Таблиц в генераторе нет.
5. `--report` печатает в stderr `matched/gaps/drift` по компонентам (worklist оставшихся маркеров).
6. `--emit-marker-plan --overrides <map.json>` — по временной таблице `{Component:{configId:property}}`
   выдаёт JSON `{component,configId,property,file,line}` (координаты из SwiftSyntax) для авто-вставки
   маркеров. `--overrides` оставлен только как вход этого режима; в основном прогоне НЕ используется.

`drift` = свойства Appearance без config-id (сигнал дрифта). `gaps` = config-id без цели в Appearance.

## Запуск

Мета — **продукт сборки**, в git не коммитится (как `uikit-api-meta.json` на Android,
который генерится задачей и едет внутрь AAR). Её генерят `build_cli.sh` и
`scripts/run_tests.rb` перед работой, а релизный пакет CLI кладёт её рядом с бинарём.

```sh
# Полная перегенерация (скан + сверка с Props + override'ы + отчёт):
scripts/generate_api_meta.sh               # → DesignSystemBuilder/.sdds/ios-api-meta.json

# Подмножество в stdout + диагностика сверки (для ревью):
scripts/generate_api_meta.sh --only FormItem,Counter

# Напрямую:
swift build --package-path Tools/SDDSApiInfoGenerator -c release
Tools/SDDSApiInfoGenerator/.build/release/SDDSApiInfoGenerator \
  --sources SDDSComponents/Sources \
  --props DesignSystemBuilder/DesignSystemBuilderCore/Model/Props \
  --overrides DesignSystemBuilder/.sdds/ios-api-meta.overrides.json \
  --output DesignSystemBuilder/.sdds/ios-api-meta.json --report
```

## Схема выхода

`[ { componentName, qualifiedName, styleQualifiedName, sizeQualifiedName?, resolvedTypes[], stateEnum?,
     params: [ { type, id, methodName, paramName, paramQualifiedType, paramSimpleType,
                 valueQualifiedType, group } ] } ]`

`valueEnum` — case'ы enum-свойства с их id в конфиге и дефолтом; `markupValue`/`markupZero` —
значение из разметки. `sizeQualifiedName` — тип свойства `size` у `*Appearance`: генератор тем берёт имя
размерной конфигурации отсюда, а не из своей таблицы.

На iOS: `methodName`/`paramName` = имя stored-property/init-аргумента, `group` = dotted-путь
вложенной под-структуры (`root` для верхнего уровня), `valueQualifiedType` = тип значения.

## Файлы

- `Meta.swift` — Codable-схема выхода.
- `TypeCategory.swift` — классификатор Swift-тип → категория (терминальные типы + эвристики).
- `SymbolTable.swift` — сбор деклараций типов и marker-комментов (SwiftSyntax).
- `Scanner.swift` — рекурсивное раскрытие `*Appearance` в `params`.
- `main.swift` — CLI (обход файлов, вывод JSON).

## Грабли

- Тул автономен от CLI `DesignSystemBuilder` (тот на xcodebuild и не тянет SPM-swift-syntax).
- `.build/` в `.gitignore`; `Package.resolved` — трекается (воспроизводимость версии swift-syntax).
- Скоуп коммита: `sdds-icore/theme-builder` (или заведите `sdds-ios/api-info`).
