# Themes

Сгенерированные пакеты тем SDDS. Каждая папка — отдельный SwiftPM-пакет + Xcode-проект,
собранный CLI [`dsbuilder`](../DesignSystemBuilder/README.md) из токенов и палитры DS Builder.

Содержимое **коммитится** в git (в отличие от эфемерной `DesignSystemBuilder/.sdds/`).

## Темы

| Каталог | Имя модуля | Схема песочницы |
|---|---|---|
| `SDDSservTheme/` | `SDDSServTheme` | `SDDSDemoAppSDDSServ` |
| `PlasmaB2CTheme/` | `PlasmaB2CTheme` | `SDDSDemoAppPlasmaB2C` |
| `PlasmaHomeDSTheme/` | `PlasmaHomeDSTheme` | `SDDSDemoAppPlasmaHomeDS` |

Имя каталога и имя модуля совпадают не всегда — импортируется именно имя модуля.

## Что внутри темы

| Путь | Что это | От чего зависит |
|---|---|---|
| `Tokens/` | цвета, типографика, тени, формы, отступы, градиенты | только `SDDSThemeCore` |
| `Fonts/` | манифест и файлы шрифтов | только `SDDSThemeCore` |
| `Theme.swift` | `Theme.initialize()`, тенанты, сабтемы | только `SDDSThemeCore` |
| `<Component>/` | appearance-вариации компонента | `SDDSComponents` + `SDDSIcons` |
| `EnvironmentValueProvider+DefaultValues.swift` | дефолтный appearance каждого компонента | `SDDSComponents` |
| `docs/`, `override-docs/` | скриншоты и кастомные страницы документации темы | — |

Двухуровневость важна: слой токенов самодостаточен и бандлится отдельно, слой компонентов
тянет весь граф библиотеки.

## Использование

```swift
import SDDSComponents
import SDDSServTheme

SDDSServTheme.Theme.initialize()  // синхронно: шрифты вшиты в тему
```

Вариации читаются как «размер → стиль»: `SDDSServTheme.BasicButton.l.accent.appearance`.
Полный список стилей конкретного компонента — в
`<Theme>/<Component>/<Component>+Variations.swift`.

## Регенерация

Одну тему — через CLI `dsbuilder`:

```sh
cd DesignSystemBuilder && ./build_cli.sh && ./build/dsbuilder/dsbuilder
```

Все темы + Xcode-проекты — через конвейер скриптов:

```sh
ruby scripts/generate_themes/generate_themes.rb
```

## Сборка

Все темы или одна (артефакты — в `Themes/build/`):

```sh
ruby scripts/build_themes.rb
```

```sh
ruby scripts/build_themes.rb SDDSservTheme
```

## Грабли

- **Файлы сгенерированы — руками не править.** Меняйте токены-источник или Stencil-шаблоны и
  регенерируйте, иначе правки затрутся следующим прогоном.
- Изменение публичного appearance-API компонентов ломает эти пакеты — регенерируйте темы после
  таких изменений.
- Коммит-скоуп: `sdds-ilibs/${libName}`.

## Ссылки

- [DesignSystemBuilder/README.md](../DesignSystemBuilder/README.md) — CLI и конфиг генерации.
- [scripts/generate_themes/README.md](../scripts/generate_themes/README.md) — конвейер «все темы».
- [SDDSDemoApp/README.md](../SDDSDemoApp/README.md) — как подключить новую тему в песочницу.
