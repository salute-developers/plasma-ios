# SDDSComponentsFixtures

Swift Package с **компилируемыми** примерами компонентов для документации (аналог `uikit-compose-fixtures` на Android).

## Назначение

- Единый источник примеров кода для доков: примеры живут здесь и компилируются, в .md подставляются через `// @sample:`.
- При сборке документации темы можно добавлять свои примеры в `Themes/<ThemeName>/docs/Samples/`; при сборке дока темы компилируется и этот пакет (через зависимость от него в модуле/приложении темы или в отдельном target документации).

## Структура

```
SDDSComponentsFixtures/
├── Package.swift
├── README.md
└── Sources/SDDSComponentsFixtures/
    ├── Placeholder.swift           # placeholder(_, "текст для доков")
    ├── SwiftCodeSnippet.swift      # swiftCodeSnippet { ... } для извлечения
    └── Samples/
        ├── Button/
        │   └── ButtonSamples.swift
        ├── Chip/
        │   └── ChipSamples.swift
        └── ...
```

## Модули документации для тем

Для каждой темы (по аналогии с Android):

- **Core-примеры** — только в этом пакете (`Samples/...`).
- **Примеры темы** — в репозитории темы: `Themes/<ThemeName>/docs/Samples/` (та же структура подкаталогов). При генерации доков темы экстрактор кладёт их в тот же каталог сниппетов; одноимённые файлы перезаписывают core.
- **Кастомная документация темы** — `Themes/<ThemeName>/override-docs/` (например, `+NavigationBarUsage.md` мержится в базовую страницу). Подробнее в [docusaurus/GUIDELINES.md](../docusaurus/GUIDELINES.md).

Чтобы примеры и Fixtures реально компилировались при сборке темы, тема (или её app/модуль с докой) должна зависеть от `SDDSComponentsFixtures`; тогда при сборке темы собирается и этот пакет.

## Куда кладутся извлечённые сниппеты

- **Сейчас:** при генерации доков скрипт `docusaurus/scripts/extract-snippets.sh` пишет сниппеты в каталог `SNIPPETS_DIR` (по умолчанию `docusaurus/build/docs`). В .md используется подстановка `// @sample: <путь>` относительно этого каталога.
- **В будущем:** пакет планируется публиковать как зависимость; варианты:
  - поставлять пре-извлечённые сниппеты в составе пакета (например, ресурс или отдельная цель),
  - либо указывать путь/архив со сниппетами в модуле документации (пока можно указывать путь в репозитории).

## Сборка

Пакет рассчитан на **iOS** (зависит от SDDSComponents → UIKit/SwiftUI). В терминале собирать под iOS, например через Xcode или:

```bash
# из корня репо, с указанием iOS Simulator
xcodebuild -workspace SDDS.xcworkspace -scheme <схема с Fixtures> \
  -destination 'platform=iOS Simulator,name=iPhone 16' build
```

См. также [docusaurus/GUIDELINES.md](../docusaurus/GUIDELINES.md) по маркерам `// @DocSample`, `swiftCodeSnippet`, `placeholder` и подстановке `// @sample:` в Markdown.
