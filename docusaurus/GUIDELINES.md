# Руководство по примерам кода для документации (iOS / SwiftUI)

## Где писать примеры

- **Общие примеры компонентов:** в модуле `SDDSComponentsFixtures`, каталог  
  `SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Samples/`.  
  Внутри создавайте подкаталоги по компонентам (например, `Button/`, `Chip/`) и файлы `*Samples.swift`.
- **Примеры, специфичные для темы:** в репозитории темы:  
  `Themes/<ThemeName>/docs/Samples/`  
  с той же структурой подкаталогов (например, `NavigationBar/NavigationBarSamples.swift`).  
  При сборке документации темы экстрактор подхватывает и core, и примеры темы; одноимённые файлы темы перезаписывают core.
- **Кастомная документация темы:** каталог `Themes/<ThemeName>/override-docs/` (файлы `+*Usage.md` мержатся в базовые страницы при генерации). Аналог override-docs на Android.

## Модули документации для тем

Для каждой темы предусмотрены:

1. **Core-примеры** — только в пакете `SDDSComponentsFixtures`.
2. **Примеры темы** — `Themes/<ThemeName>/docs/Samples/` (при сборке доков темы они извлекаются вместе с core).
3. **Override-docs** — `Themes/<ThemeName>/override-docs/` (кастомные страницы и фрагменты).

Чтобы примеры и Fixtures реально компилировались при сборке темы, модуль/приложение темы (или отдельный target документации) должен зависеть от `SDDSComponentsFixtures`. Тогда при сборке темы собирается и этот пакет. Модуль с докой в будущем может публиковаться как зависимость с примерами.

## Как помечать примеры для извлечения

Перед объявлением `struct` или `func` добавьте комментарий `// @DocSample`. Поддерживаются два варианта.

**Вариант 1 — тело `var body`:**

```swift
// @DocSample
struct BasicButton_Simple: View {
    var body: some View {
        BasicButton(title: "Label", subtitle: "", action: {})
    }
}
```

**Вариант 2 — обёртка `swiftCodeSnippet { ... }` (аналог `composableCodeSnippet` на Android):**

```swift
// @DocSample
struct BasicButton_Snippet: View {
    var body: some View {
        swiftCodeSnippet {
            BasicButton(title: "Label", subtitle: "", action: {})
        }
    }
}
```

Экстрактор извлекает либо тело `var body: some View { ... }`, либо (если тело начинается с `swiftCodeSnippet {`) только содержимое closure. Имя типа/функции после `// @DocSample` задаёт имя файла сниппета (например, `BasicButton_Snippet.swift`).

## Синтаксис `// @sample:` в Markdown

В `.md` файлах документации (в т.ч. в шаблоне `swiftui-template` и в override-docs) используйте ссылку на сниппет — внутри блока кода укажите одну строку:

    ```swift
    // @sample: SDDSComponentsFixtures/Samples/Button/BasicButton_Simple.swift
    ```

При генерации документации строка `// @sample: <path>` заменяется на содержимое файла из каталога сниппетов (`build/docs` по умолчанию). Путь задаётся относительно этого каталога.

Для примеров темы путь может быть, например:

```markdown
// @sample: PlasmaHomeDSTheme/docs/Samples/NavigationBar/NavigationBar_WithOverlay.swift
```

## Placeholder для абстрактных значений

В примерах, где нужно показать в документации условное значение (токен, ключ и т.п.), используйте функцию `placeholder` из `SDDSComponentsFixtures`:

```swift
placeholder(actualValue, "Текст для документации")
```

В сгенерированном сниппете экстрактор заменит такой вызов на строку `"Текст для документации"`, чтобы в доке был читаемый пример без привязки к конкретной реализации.

## Правила

1. **Не копируйте код примеров вручную в .md.** Всегда используйте `// @sample: path` и пишите пример в Swift-файле в Fixtures или в `Themes/.../docs/Samples/`. Так пример остаётся компилируемым и единым источником правды.
2. Один файл `*Samples.swift` может содержать несколько примеров; каждый помечается своим `// @DocSample` перед объявлением.
3. Формат извлечения рассчитан на один блок `var body: some View { ... }` без излишней вложенности; для сложных случаев разбейте на несколько примеров.

## Куда кладутся извлечённые сниппеты

- **Сейчас:** скрипт `extract-snippets.sh` пишет файлы в каталог `SNIPPETS_DIR` (по умолчанию `docusaurus/build/docs`). В .md используется подстановка `// @sample: <путь>` относительно этого каталога. Исходники примеров остаются в репозитории (Fixtures и `Themes/.../docs/Samples/`).
- **В будущем:** при публикации пакета Fixtures как зависимости возможны варианты: поставлять пре-извлечённые сниппеты в составе пакета или указывать путь/архив со сниппетами в модуле документации (пока можно указывать путь в репо). На Android сниппеты кладут в сам модуль Fixture; на iOS пока — в `build/docs`, при необходимости можно будет подтягивать архив или путь из модуля с докой.

## Сборка и генерация

1. Сниппеты извлекаются скриптом `docusaurus/scripts/extract-snippets.sh` (запускается из `docusaurus-generate` и из `generate-docs.sh`).
2. Переменные: `SNIPPETS_DIR` (каталог вывода, по умолчанию `docusaurus/build/docs`), `THEME_NAME` (при сборке доков темы — имя папки темы, например `PlasmaHomeDSTheme`).
3. Подстановка `// @sample:` выполняется при вызове `transform_template` (и в `replace_swift_snippets`) в процессе генерации Docusaurus.
