# SDDSApiInfoGenerator

SwiftSyntax-тул: генератор **`ios-api-meta.json`** — слепка публичного API стилей компонентов,
снятого со структур `*Appearance` в `SDDSComponents`. Мета — единый источник правды, из
которого кормятся кодогенератор тем и рантайм-конфигуратор демо (iOS-аналог Android
`uikit-api-meta.json`).

## Что делает

1. Парсит все `.swift` в `SDDSComponents/Sources` (SwiftSyntax), строит таблицу типов.
2. Для каждого помеченного `public struct *Appearance` **рекурсивно** раскрывает свойства в
   `params`, уходя в под-структуры и протоколы как в группы.
3. Классифицирует тип каждого свойства в категорию (`color` / `typography` / `dimension` /
   `shape` / `shadow` / `icon` / `component_style` / `value` / …).
4. Сериализует массив компонентов в JSON, зеркалящий контракт Android.

Разметка задаётся макросами пакета [`SDDSApiInfo`](../../SDDSApiInfo/README.md).

## Сверка config-id ↔ Appearance

Имя свойства в конфиге (поле `<Component>Props`, snake_case в JSON) часто **не совпадает** с
именем property в `Appearance` (`titleStyle` ↔ `titleTypography`, `formItemType` ↔ `formType`).
Генератор ищет свойство по config-id, поэтому мета ключуется по config-id.

**Правило владельца: имена свойств в `Props` и `Appearance` переименовывать нельзя.** Мост
строится вне Swift:

1. Тул читает неизменённые `*Props` (`--props`) → авторитетный словарь config-id и категорий.
2. Авто-реконсайл: exact → alias (`*Style` ↔ `*Typography` / `*Appearance`) → база + категория.
3. Остаток (семантика: `label` ↔ `title`, `description` ↔ `subtitle`) — явными маркерами
   `@ApiName` прямо на свойстве `Appearance`; свойство при этом НЕ переименовывается.
4. Структурные случаи (`indicatorOffsetX/Y` → единый `CGPoint`, padding-split → `EdgeInsets`)
   и значения, которых в конфиге нет, — `@ApiValue` на свойстве.
5. `--report` печатает в stderr `matched / gaps / drift` по компонентам.

`drift` — свойства `Appearance` без config-id (сигнал дрифта). `gaps` — config-id без цели
в `Appearance`.

## Запуск

Мета — **продукт сборки**, в git не коммитится: её генерят `build_cli.sh` и
`scripts/run_tests.rb` перед работой, а релизный пакет CLI кладёт её рядом с бинарём.

```sh
scripts/generate_api_meta.sh               # → DesignSystemBuilder/.sdds/ios-api-meta.json
```

```sh
scripts/generate_api_meta.sh --only FormItem,Counter   # подмножество в stdout, для ревью
```

Напрямую:

```sh
swift build --package-path Tools/SDDSApiInfoGenerator -c release
Tools/SDDSApiInfoGenerator/.build/release/SDDSApiInfoGenerator \
  --sources SDDSComponents/Sources \
  --props DesignSystemBuilder/DesignSystemBuilderCore/Model/Props \
  --output DesignSystemBuilder/.sdds/ios-api-meta.json --report
```

## Схема выхода

```
[ { componentName, qualifiedName, styleQualifiedName, sizeQualifiedName?, resolvedTypes[],
    stateEnum?,
    params: [ { type, id, methodName, paramName, paramQualifiedType, paramSimpleType,
                valueQualifiedType, group } ] } ]
```

- `methodName` / `paramName` — имя stored-property и init-аргумента.
- `group` — dotted-путь вложенной под-структуры (`root` для верхнего уровня).
- `valueEnum` — case'ы enum-свойства с их id в конфиге и дефолтом.
- `markupValue` / `markupZero` — значение из разметки.
- `sizeQualifiedName` — тип свойства `size` у `*Appearance`; генератор тем берёт имя размерной
  конфигурации отсюда, а не из своей таблицы.

## Файлы

| Файл | Что делает |
|---|---|
| `Meta.swift` | Codable-схема выхода |
| `TypeCategory.swift` | классификатор Swift-тип → категория |
| `SymbolTable.swift` | сбор деклараций типов и маркеров (SwiftSyntax) |
| `Scanner.swift` | рекурсивное раскрытие `*Appearance` в `params` |
| `main.swift` | CLI: обход файлов, вывод JSON |

## Грабли

- Тул автономен от CLI `DesignSystemBuilder` (тот собирается своим путём и не тянет
  SPM-swift-syntax).
- `.build/` в `.gitignore`; `Package.resolved` трекается — воспроизводимость версии swift-syntax.
- Коммит-скоуп: `sdds-icore/theme-builder`.
