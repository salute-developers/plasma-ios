# Tasks: ios-docs-aggregator

## 1. Phase 1 — info-артефакты в SDDSThemeBuilder

- [ ] 1.1 Codable-модели components-info/theme-info по golden-контракту backend
      (`InfoArtifactDtos`: required/optional поля, `variations[].reference`) в
      `SDDSThemeBuilderCore`
- [ ] 1.2 Генератор `config-info-swiftui.json`: variations/props из DS-меты
      (`components/<theme>/meta.json`), styleApi из `ios-api-meta.json` + dot-notation
      вариаций; интеграция в `GenerateComponentCommand`
- [ ] 1.3 Генератор `theme-info.json`: сбор токенов (type/name/displayName/description/
      reference/themeReference/value) при генерации токенов; интеграция в
      `GenerateTokensCommand`
- [ ] 1.4 Тесты: структурная валидация выходов против golden-фикстур
      (`ios-components.json`/`ios-theme.json`), негативный кейс с пустым `key`,
      согласованность reference между слоями
- [ ] 1.5 Прогон на реальной теме (PlasmaHomeDS): визуальная сверка нескольких компонентов
      и токенов с Android-эталоном из `docs-bundle.tar.gz`

## 2. Phase 2 — экстрактор сэмплов (Tools/SDDSDocsAggregator)

- [ ] 2.1 Каркас SwiftPM-пакета `Tools/SDDSDocsAggregator` (swift-tools 5.9, swift-syntax,
      подкоманды `extract`/`aggregate`, `Package.resolved` в git)
- [ ] 2.2 Парсер маркера `// @DocSample` (bare + `id=` + `needScreenshot=false`) над
      struct:View/func через leadingTrivia
- [ ] 2.3 Извлечение сниппетов: body/тело функции, unwrap `swiftCodeSnippet{}` по AST,
      SyntaxRewriter для `placeholder(x,"текст")`, деиндент; офсеты фрагмента в исходнике
- [ ] 2.4 Запись `samples.json` (схема Android: id/kind/fqName/file/snippetPath/offsets) и
      файлов `swift/<путь>/<id>.swift`; merge core+theme слоёв (дедуп по id, theme wins)
- [ ] 2.5 `--report`/строгий режим: предупреждения о нераспознанных маркерах, ненулевой
      выход на нерезолве
- [ ] 2.6 Тесты экстрактора: все 58 существующих сэмплов распознаются; кейсы unwrap/
      placeholder/деиндент/офсеты/скобки в строковых литералах; фикстуры инлайном
- [ ] 2.7 Шаг `swift test --package-path Tools/SDDSDocsAggregator` в `scripts/run_tests.rb`

## 3. Phase 3 — агрегатор бандла

- [ ] 3.1 Core-корпус: конвертация 52 md из `docusaurus/swiftui-template/docs/` в
      `docs-template/swiftui-template/docs/**` + начальный `structure.json` (структура по
      образцу Android compose-template)
- [ ] 3.2 Чтение/валидация Core-структуры (существование path, orphan-warning), рендер в
      `content/core/`, запись `structure-core.json`
- [ ] 3.3 User-слой `Themes/<Theme>/docs/override-docs/`: рендер в `content/user/`,
      `structure-user.json`, правила merge (`append`+`+`-префикс, `replace`, reject `prepend`)
- [ ] 3.4 Рендер маркеров: инлайн `@sample:` (fail loud), `<!-- @style-api -->` → таблица из
      config-info-swiftui, passthrough `<!-- @screenshot: -->`
- [ ] 3.5 Сборка layout: копирование meta (components-info/theme-info/samples), запись
      `platform-context.json` (`platform: "swiftui"`), `assets/{examples,screenshots}`
- [ ] 3.6 Тесты агрегатора: layout, маркеры (4 сценария спеки), merge-правила, ошибки на
      битых входах
- [ ] 3.7 Скрипт `scripts/generate_docs_bundle.sh`: api-meta → theme-builder info → extract →
      aggregate; README/CLAUDE.md тула
- [ ] 3.8 Верификация: структурный дифф `.sdds/temp/docs/` с Android-эталоном
      (скрипт сравнения layout/схем); e2e `dsbuilder docs generate --platform swiftui`
      при наличии CLI (опциональный шаг скрипта)

## 4. Phase 4 — скриншоты сэмплов

- [ ] 4.1 Генерация/реестр тест-кейсов по `samples.json` (needScreenshot, фильтр по
      components-info) в `SDDSDemoAppTests`
- [ ] 4.2 Naming `fqName_underscored.png`, выгрузка в каталог для агрегатора; подключение
      каталога в шаге 3.5
- [ ] 4.3 Прогон сьюта на PlasmaHomeDS, сверка набора PNG с ожидаемым списком сэмплов

## 5. Финализация

- [ ] 5.1 Документация: строка в корневом `CLAUDE.md`, скоуп в `CONTRIBUTING.md`
      (`sdds-icore/docs-aggregator`), заметка в память команды `.claude/memory/`
- [ ] 5.2 Полный прогон `ruby scripts/run_tests.rb` + `./lint.sh`
- [ ] 5.3 Письмо владельцам спеки: синтаксис маркеров, `kind`/`fqName` для iOS,
      Light/Dark-скриншоты, конвенция `artifact.id` platform-context
