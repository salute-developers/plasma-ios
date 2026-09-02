# Tasks: ios-docs-aggregator

## 1. Phase 1 — info-артефакты в DesignSystemBuilder

- [x] 1.1 Codable-модели components-info/theme-info по golden-контракту backend —
      УЖЕ существовали (`ConfigInfo`, `TokensMetaFile` — порт android#815); добавлен
      `ConfigInfoValidator` (непустые key/coreName/styleName/reference)
- [x] 1.2 Генератор components-info: расширен охват `config-info-ios.json` со всех
      компонентов с `bindings` в конфиге (было: только FormItem); StylesCollection-кодоген
      остался под `supportsBinding`; safe `appearanceIfKnown` вместо terminate
- [x] 1.3 Генератор theme-info: УЖЕ существовал (`config-info-tokens-ios.json`,
      1932 токена на PlasmaHomeDS, схема совместима) — без правок
- [x] 1.4 Тесты `InfoArtifactContractTests` (6 зелёных): golden-фикстуры дословно в
      `Fixtures/InfoArtifacts/`, round-trip наших энкодеров через backend-зеркало DTO,
      негативный кейс пустого `key`, валидатор
- [x] 1.5 Прогон на реальных темах (в scratchpad, `-o`): PlasmaHomeDS — 46 компонентов
      (Android-эталон 47), PlasmaB2C — 91, SDDSServ — 109; 0 пустых reference;
      dot-notation вида `Badge.L.Default.Default`; токены — 1932 записи, схема совместима.

## 2. Phase 2 — экстрактор сэмплов (в составе dsbuilder)

- [x] 2.1 Каркас SwiftPM-пакета: core-библиотека `SDDSDocsAggregatorCore` + executable +
      testTarget (лучше прецедента SDDSApiInfoGenerator — тесты есть сразу)
- [x] 2.2 Парсер маркера `// @DocSample` (bare + `id=` + `needScreenshot=false`) над
      struct:View/func через leadingTrivia
- [x] 2.3 Извлечение сниппетов: body/тело функции, unwrap `swiftCodeSnippet{}` по AST,
      SyntaxRewriter для `placeholder(x,"текст")`, деиндент; офсеты фрагмента в исходнике
- [x] 2.4 Запись `samples.json` + `swift/<путь>/<id>.swift`; merge core+theme слоёв
      (дедуп по id, theme wins); абсолютные/относительные пути в CLI
- [x] 2.5 `--report`: предупреждения (маркер без извлекаемого тела, нечитаемый файл),
      ненулевой выход при их наличии
- [x] 2.6 Тесты: 11 юнитов (маркер/unwrap/placeholder/деиндент/офсеты/скобки-в-строках);
      прогон на реальных сэмплах — 56/56 маркеров извлечены (в репо 56, не 58),
      placeholder и swiftCodeSnippet сворачиваются корректно
- [x] 2.7 Шаг `swift test --package-path Tools/SDDSDocsAggregator` в `scripts/run_tests.rb`
      (`run_spm_tests`)

## 3. Phase 3 — агрегатор бандла

- [x] 3.1 Core-корпус: 60 md из `docusaurus/swiftui-template/docs/` →
      `docs-template/swiftui-template/docs/**` + `structure.json` (Быстрый старт / Тема (5) /
      Компоненты (54)); починены 2 битых `@sample`-маркера (Carousel, FormItem указывали на
      файл исходников), размечены 6 неаннотированных сэмплов (Image/Icon/Text) — старый
      awk-пайплайн молча ронял эти 8 блоков
- [x] 3.2 Чтение/валидация Core-структуры (missing page → ошибка, orphan → warning), рендер
      в `content/core/`, запись `structure-core.json`
- [x] 3.3 User-слой: рендер в `content/user/`, `structure-user.json`, merge-правила
      (`append`+`+`-префикс, `replace`, reject `prepend`)
- [x] 3.4 Рендер маркеров: инлайн `@sample:` (fail loud, резолв по basename — совместим со
      старыми и новыми путями), `<!-- @style-api -->` → таблица из components-info,
      passthrough `<!-- @screenshot: -->`
- [x] 3.5 Сборка layout: meta (components-info/theme-info/samples), `platform-context.json`
      (`platform: "swiftui"`), `assets/{examples/swift,screenshots}`
- [x] 3.6 Тесты: 10 юнитов агрегатора (layout, 4 маркерных сценария, merge-правила,
      ошибки) — всего в пакете 21 зелёный
- [x] 3.7 `scripts/generate_docs_bundle.sh` (api-meta → проверка info-артефактов → extract →
      aggregate) + `Tools/SDDSDocsAggregator/CLAUDE.md`
- [x] 3.8 Верификация: полный прогон PlasmaHomeDS (62 сэмпла, 60 страниц); структурный дифф
      с Android-эталоном сходится — расхождения ровно docs.json/manifest.json (создаёт
      dsbuilder) vs structure-*.json (вход dsbuilder); схема samples.json идентична.
      e2e с самим dsbuilder CLI — при появлении бинаря (задокументировано в скрипте)

## 4. Phase 4 — скриншоты сэмплов

- [x] 4.1a Реестр сэмплов: `extract --emit-registry` генерит
      `SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Generated/DocSamplesRegistry.swift`
      (аналог Android docs-ksp registry; 62 записи; 2 юнита) — сэмплы internal, реестр в том
      же модуле даёт публичный `DocSamples.all`
- [x] 4.2a Тест-заготовка `SDDSDemoAppTests/DocScreenshots/DocSampleScreenshotTests.swift`:
      рендер по реестру, naming `fqName_underscored.png`, каталог из env
      `DOCS_SCREENSHOTS_DIR` (без переменной — XCTSkip), фильтр по components-info
      (аналог ProvidedStyleKeys)
- [x] 4.1b Интеграция: local-SPM `../SDDSComponentsFixtures` добавлен в
      SDDSDemoApp.xcodeproj; продукт линкуется в **app-таргет** (не в тест-таргет — тесты
      берут символы через bundle loader, линковка в тест-бандл ломала транзитивный
      SDDSIcons); `DocSampleScreenshotTests` в membership SDDSDemoAppTests. Схема прогона —
      `SDDSDemoAppTests` (per-theme схемы имеют pre-existing конфликт «Multiple commands
      produce GeneratedStories+Autogen.swift» — два app-таргета с одной скрипт-фазой;
      не наш баг, воспроизводится без наших правок). Попутно починен bit rot
      `FormItemSamples.swift` (API SDDSFormItem уехал: невыводимые generics, `Tooltip.m`
      вместо удалённого `.default`) — фикстуры давно не компилились
- [x] 4.3 Прогон: `TEST_RUNNER_DOCS_SCREENSHOTS_DIR=... xcodebuild test -scheme
      SDDSDemoAppTests -only-testing:SDDSDemoAppTests/DocSampleScreenshotTests` — 54 PNG
      (из 62 view-сэмплов; 8 отфильтрованы по components-info), рендер проверен визуально
      (safe area отключена, контент целиком); `aggregate --screenshots` кладёт их в
      `assets/screenshots/` — полный бандл: 182 файла

## 5. Финализация

- [x] 5.1 Документация: строка в корневом `CLAUDE.md` (карта пакетов), скоуп
      `sdds-ios/docs-aggregator` в `CONTRIBUTING.md`, `Tools/SDDSDocsAggregator/CLAUDE.md`
- [x] 5.2 `ruby scripts/run_tests.rb` (theme-builder тесты + swift test тула) — прогон
      выполнен; `lint.sh` — 0 findings по новым файлам
- [ ] 5.3 Письмо владельцам спеки: синтаксис маркеров, `kind`/`fqName` для iOS,
      Light/Dark-скриншоты, конвенция `artifact.id` platform-context — черновик за
      владельцем репо

## 6. Контентный паритет корпуса (Level 3)

- [x] 6.1 Дефект Phase 1: `styleApi` заявлялся всем 109 компонентам, а Swift-тип
      `<Component>Styles` генерится только для `supportsBinding` (FormItem) — примеры в
      документации ссылались бы на несуществующие типы. Теперь `styleApi` опционален и
      заполняется только там, где тип реально сгенерирован
- [x] 6.2 Рендер `@style-api`: таблица параметров (Swift-кейсы `.default`, а не `codeName`
      `Default`) + пример `<Styles>.style(...).appearance` и dot-notation; вместо падения
      на неизвестном компоненте — warning-блок (по данным components-info отличить «нет
      стилей» от «нет в DS» нельзя, поэтому сообщение одно и по существу)
- [x] 6.3 Корпус обогащён маркерами: 51 `@screenshot` (только для сэмплов с реальным PNG —
      висячих ссылок нет; 6 пропущено) и 54 `@style-api` на страницах компонентов
- [x] 6.4 Регенерированы info-артефакты всех тем (было консистентно только у
      SDDSserv): PlasmaHomeDS 46, PlasmaB2C 89, SDDSserv 105
- [x] 6.5 Проверка: полный прогон PlasmaHomeDS — 182 файла, 54 скриншота, 1 страница с
      таблицей стилей, 53 с warning (честное отражение того, что `<Component>Styles`
      генерится только для FormItem)

## 7. Хранение скриншотов (паритет с Android)

- [x] 7.1 Дырка: `generate_docs_bundle.sh` не передавал `--screenshots`, поэтому
      документированный прогон «одной командой» молча давал бандл с пустым
      `assets/screenshots/` при 51 маркере `@screenshot` в контенте
- [x] 7.2 Как на Android (там 675 png в `tokens/*/docs/override-docs/static/`): картинки
      хранятся в репозитории per-theme — `Themes/SDDSservTheme/docs/screenshots/` (54 png,
      2.2 МБ). Тема SDDSserv, потому что пакет фикстур линкует `SDDSServTheme`
- [x] 7.3 Скрипт подхватывает каталог темы автоматически и предупреждает, если его нет;
      агрегатор считает маркеры и png и предупреждает при маркерах без картинок (2 юнита)
- [x] 7.4 Побочный баг, найденный новым тестом: orphan-детектор сравнивал пути строкой и
      из-за симлинка (`/var` → `/private/var`) считал страницу из структуры сиротой —
      теперь пути приводятся к канонической форме
- [x] 7.5 Проверка: `generate_docs_bundle.sh --theme SDDSserv` → 54 скриншота в бандле;
      `--theme PlasmaHomeDS` → предупреждения обоих уровней; 27 тестов зелёные

## 8. Параметризация сэмплов темой (per-theme скриншоты)

- [x] 8.1 Механизм найден: `EnvironmentValueProvider.shared` — общий провайдер дефолтных
      appearance, каждая тема заполняет его своим `setDefaultValues()`; публичная точка
      входа — `Theme.initialize(onComplete:)` (она же грузит шрифты темы). Исходники тем
      не трогали: `setDefaultValues` остался internal
- [x] 8.2 Сэмплы расцеплены с темой: `appearance:` убран там, где у компонента есть дефолт
      в окружении (27 корней из `EnvironmentValueProvider+DefaultValues.swift`).
      Оставлены тема-зависимыми: смысловые (Image 1:1 / 16:9, Select single / multiple) и
      те, где параметр обязателен (CheckBoxGroup, RadioBoxGroup, Segment)
- [x] 8.3 Скриншот-тест перебирает 4 темы демо-таргета, ждёт `Theme.initialize` и пишет в
      `Themes/<Тема>Theme/docs/screenshots`; развязка одноимённых `Theme`/`setDefaultValues`
      — через 4 файла-обёртки с единственным импортом темы
- [ ] 8.4 Ограничение: `setDefaultValues()` покрывает 27 компонентов из 55 — у остальных
      (Accordion, Loader, Modal, Toast, Tooltip, TabBar…) дефолта в окружении нет, поэтому
      их сэмплы остаются тема-зависимыми и выглядят одинаково во всех темах. Полный паритет
      требует расширить рукописный `EnvironmentValueProvider+DefaultValues.swift` каждой темы

## 9. Сквозная проверка с реальным dsbuilder CLI

- [x] 9.1 CLI собран из ветки PR #60 `chore/unify-repositories` (в `dev` docs-функциональности
      нет): `frontend-kt/install-local-cli.sh`, Kotlin/Native, 5м53с. Установка в
      `~/.local/bin` упирается в права — бинарь запускается напрямую из
      `cli/build/bin/macosArm64/releaseExecutable/dsbuilder.kexe`
- [x] 9.2 НАЙДЕНО ЖИВЫМ ПРОГОНОМ: CLI требует `schemaVersion` в `structure-core.json` и
      `structure-user.json` (`Structure.schemaVersion`, значение `"1.0"`), иначе
      `docs generate` падает на чтении структур. Мы его не писали — добавлено, есть
      регрессионный тест
- [x] 9.3 `dsbuilder docs generate --platform swiftui` на нашем дереве: **Bundle created**,
      архив 544 КБ. Манифест собрался с ожидаемыми форматами
      `sdds-swiftui-components-info-v1` и `sdds-ios-theme-info-v1`, платформа `swiftui`,
      шесть артефактов (RESOLVED_DOCS, CONTENT_ROOT, COMPONENTS_INFO, THEME_INFO,
      SCREENSHOTS, CODE_EXAMPLES); `docs.json` — 3 узла верхнего уровня с contentRefs
- [ ] 9.4 `designSystem.id` в манифесте вышел `"unknown"` — CLI берёт его из
      `.sdds/config.json`, которого нет рядом с деревом. Уточнить, критично ли это для
      приёма бандла сервисом
- [ ] 9.5 `docs publish` не проверен: нужен `DSBUILDER_API_KEY` и подтверждение, под каким
      projectId публикуется документация

## 10. Откат расширения дефолтов темы (регрессия снапшотов)

- [x] 10.1 CI упал на 4 снапшот-тестах Tabs (все с `ShowAll`). Причина: эти кейсы
      используют `clipMode: .showMore` — выпадающий список, чьё оформление берётся из
      окружения. Добавленные дефолты `ListAppearance` / `ListItemAppearance` /
      `DropdownMenuAppearance` заменили «пустой» fallback настоящим оформлением, и
      эталонные снапшоты перестали совпадать
- [x] 10.2 Аудит показал, что автоподбор холдера был произвольным: `TabsAppearance` получил
      `IconTabs` вместо `TabsDefault`, `ListAppearance` — `DropdownMenuListNormal` вместо
      `ListNormal`. Выбор «что считать дефолтом темы» — продуктовое решение, а не эвристика
- [x] 10.3 Коммит 8fab3943 откачен целиком: темы, сэмплы и скриншоты вернулись в состояние
      36c59dee. Дефолты снова 27/14/26 ключей
- [x] 10.4 Дефолты доложены в per-theme обёртках скриншот-теста
      (`DocThemeCase+<Тема>.swift`), рантайм тем не тронут: SDDSserv +12 ключей,
      PlasmaHomeDS +13, PlasmaB2C +10. Вариация берётся та же, что в сэмпле
      (зафиксированный командой канонический вариант), и резолвится против конкретной
      темы: тема может называть холдер иначе (`List` против `ListNormal`) или не иметь
      такой вариации (`Spinner.l` есть в SDDSserv, нет в PlasmaHomeDS)
- [x] 10.5 Ключ ставится, только если его `defaultValue` действительно читает
      `EnvironmentValueProvider`. У 21 типа (`Accordion`, `DropdownMenu`, `List`,
      `Select`, `TabBar`, `NavigationBar*`, `Editable`, `Wheel`, …) `defaultValue`
      возвращает пустой appearance и наш `set` игнорируется — для них дефолт в тесте
      бесполезен, а сэмпл без явного `appearance` отрисовался бы без оформления
- [x] 10.6 От явного `appearance` отвязано 12 сэмплов в 12 файлах — теперь они снимаются
      под каждой темой. Не отвязаны: ключи не из провайдера (см. 10.5), случаи, где
      вариация и есть смысл примера (`Image` 1:1/16:9, `Select` single/multiple), и где
      `appearance` обязателен в инициализаторе — в том числе у data-структур
      (`RadioboxData`, `SDDSSegmentItemData`), хотя у их контейнеров он необязателен
- [x] 10.7 Полный прогон `SDDSDemoAppTests` совпал с HEAD побайтово по набору падений:
      те же 36 предсуществующих (Card, NavigationBar, Editable, TextSkeleton), новых нет.
      `TabsSnapshotTest` зелёный
- [ ] 10.8 Открытым остаётся продуктовое решение: какие вариации считать дефолтом темы.
      Пока оно не принято, дефолты живут в тесте, и код примера показывает вызов без
      `appearance`, хотя тема такого дефолта не отдаёт
