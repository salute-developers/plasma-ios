# docs-sample-extraction

Обнаружение `// @DocSample`-сэмплов и извлечение код-сниппетов (SwiftSyntax) в реестр
`samples.json` + файлы сниппетов — функциональный аналог Android `ExtractCodeSnippetsTask`.

## ADDED Requirements

### Requirement: Обнаружение сэмплов по маркеру @DocSample
Экстрактор (`Tools/SDDSDocsAggregator extract`) SHALL сканировать `.swift`-файлы указанных
каталогов (core: `SDDSComponentsFixtures/.../Samples`, theme:
`Themes/<Theme>/docs/Samples`) и находить декларации (struct: View / func), которым
предшествует комментарий `// @DocSample`, включая опциональные аргументы
`id=<строка>` и `needScreenshot=false`; при отсутствии `id` идентификатор SHALL равняться
имени декларации. Все 58 существующих сэмплов MUST распознаваться без правок.

#### Scenario: Существующий сэмпл распознан
- **WHEN** экстрактор запускается на `SDDSComponentsFixtures/.../Samples/Button/ButtonSamples.swift`
- **THEN** реестр содержит записи `BasicButton_Simple`, `BasicButton_Snippet`,
  `BasicButton_WithPlaceholder`

#### Scenario: needScreenshot=false учитывается
- **WHEN** сэмпл помечен `// @DocSample needScreenshot=false`
- **THEN** его запись в реестре несёт признак, исключающий его из набора скриншотов

### Requirement: Извлечение текста сниппета
Экстрактор SHALL извлекать тело сэмпла: содержимое `body` (для View) или тела функции; при
наличии обёртки `swiftCodeSnippet { ... }` — только содержимое её замыкания (unwrap по AST,
устойчиво к фигурным скобкам в строковых литералах); вызовы `placeholder(<expr>, "<текст>")`
SHALL заменяться на строку второго аргумента; извлечённый текст SHALL быть деиндентирован
до минимального общего отступа.

#### Scenario: Unwrap swiftCodeSnippet
- **WHEN** сэмпл оборачивает содержимое в `swiftCodeSnippet { ... }`
- **THEN** извлечённый сниппет содержит только внутренний код без самой обёртки

#### Scenario: Свёртка placeholder
- **WHEN** сэмпл содержит `placeholder("Label", "Основной текст")`
- **THEN** в сниппете на этом месте стоит `"Основной текст"`

### Requirement: Реестр samples.json по схеме Android
Экстрактор SHALL записывать `samples.json` — массив записей
`{id, kind, fqName, file, snippetPath, snippetStartOffset, snippetEndOffset}`, где
`snippetStartOffset`/`snippetEndOffset` — символьные офсеты извлечённого фрагмента в
исходном `.swift`-файле, `file` — путь к исходнику относительно корня репо, `fqName` —
`<модуль>.<подпуть>.<имя>`, `kind` — `view`/`regular`/`mixed`; файлы сниппетов SHALL
записываться в `<выход>/swift/<путь fqName>/<id>.swift`.

#### Scenario: Запись реестра
- **WHEN** извлечение завершилось
- **THEN** `samples.json` валиден, каждый `snippetPath` указывает на существующий файл, и
  substring исходника по офсетам соответствует извлечённому фрагменту (до деиндента)

### Requirement: Слияние core- и theme-слоёв сэмплов
При агрегации записи theme-слоя SHALL иметь приоритет над core-записями с тем же `id`
(дедупликация, local wins — как merge Android-агрегатора).

#### Scenario: Theme-сэмпл переопределяет core
- **WHEN** сэмпл с одинаковым `id` есть в core и в `Themes/<Theme>/docs/Samples`
- **THEN** в итоговом реестре остаётся запись theme-слоя

### Requirement: Диагностика
Экстрактор SHALL поддерживать `--report`: файл в каталоге сэмплов без распознанного маркера
или с маркером без извлекаемого тела SHALL печатать предупреждение; нерезолвящийся маркер —
ненулевой код возврата в строгом режиме.

#### Scenario: Сломанный маркер виден
- **WHEN** в каталоге сэмплов лежит файл с `// @DocSample` над декларацией без тела
- **THEN** `--report` печатает предупреждение с путём и строкой
