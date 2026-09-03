# SDDSApiInfo

Пакет маркерных макросов для разметки API стилей компонентов. Макросы `@attached(peer)`,
раскрываются в пустоту — их единственная задача быть прочитанными сканером
[`SDDSApiInfoGenerator`](../Tools/SDDSApiInfoGenerator/README.md), который снимает слепок
публичного API `*Appearance` в `ios-api-meta.json`.

Разметка сделана настоящими Swift-атрибутами, а не комментариями: опечатка в имени атрибута —
ошибка компиляции, а не молчаливо не сработавший маркер.

## Маркеры

| Маркер | Где ставится | Что означает |
|---|---|---|
| `@ApiInfo(components:)` | `*Appearance` | компонент виден мете (**opt-in**); опционально — список компонентов, генерируемых из этого типа |
| `@ApiComponent("<Name>")` | `*Appearance` | явное имя компонента |
| `@ApiName("<id>", state:)` | property, enum case | id свойства или значения в конфиге, если он не равен имени |
| `@ApiStateEnum("<Enum>")` | struct | enum состояний компонента |
| `@ApiType(.iconSize)` | property | форс категории значения |
| `@ApiCopy("<property>")` | property | значение повторяет соседнее свойство |
| `@ApiValue("<expr>", zero:)` | property | значение из разметки: литерал либо `point(x, y)` / `size(w, h)` / `insets(…)` / `alpha(key)` |
| `@ApiDefault` | enum case | сюда проецируется значение, не совпавшее ни с одним id |
| `@ApiFromVariation` | property | значение берётся из id вариации, конфиг его не несёт |
| `@ApiRawNumber` | property | число печатается как есть, без обёртки `CGFloat(...)` |
| `@ApiStateOnly` | property | значение только из состояния, без отката на базовое |
| `@ApiAlwaysEmit` | property | свойство эмитится всегда, даже если значения в конфиге нет |
| `@ApiIgnore` | property, struct | пропустить |

Компонент попадает в мету **только** при наличии `@ApiInfo` или `@ApiComponent` —
авто-детекта по суффиксу нет. Имя компонента по умолчанию — имя struct без `Appearance`,
id свойства по умолчанию — имя property.

## Каналы поставки

Макрос — compiler plugin, он тянет в граф сборки swift-syntax и host-исполняемый файл.
Отсюда два следствия, оба уже закрыты в сборке:

- **XCFramework.** Настройки `MACH_O_TYPE`, `BUILD_LIBRARY_FOR_DISTRIBUTION`, `SKIP_INSTALL`
  и `-sdk` нельзя передавать в командной строке `xcodebuild` — они применяются ко всем таргетам
  графа и ломают плагин. Живут в настройках таргета; импорт `SDDSApiInfo` вырезается из
  `.swiftinterface` (`strip_build_only_imports` в [`scripts/build_xcframeworks.rb`](../scripts/build_xcframeworks.rb)).
- **Standalone-бандл.** Маркеры и `import SDDSApiInfo` вырезаются при генерации плоской папки;
  guard падает, если маркер просочился.

## Ссылки

- [Tools/SDDSApiInfoGenerator/README.md](../Tools/SDDSApiInfoGenerator/README.md) — сканер и схема меты.
- [SDDSComponents/README.md](../SDDSComponents/README.md) — где стоят маркеры.
