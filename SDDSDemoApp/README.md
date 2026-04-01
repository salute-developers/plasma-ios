# SDDSDemoApp: как поднять iOS песочницу

Этот README описывает, как запускать sandbox (`SDDSDemoApp`), как собирать его под конкретную дизайн-систему (DS), и как подключать новую тему.

## Что это за проект

`SDDSDemoApp` — это демо-приложение/песочница для компонентов.

Сейчас поддерживается режим:

- общая песочница со всеми темами (`SDDSDemoApp`),
- отдельные DS-изолированные схемы (одна схема = одна тема).

---

## Требования

- Xcode (актуальная версия, совместимая с проектом).
- Установленные iOS Simulator runtime.
- Локально доступный репозиторий `plasma-ios`.

---

## Быстрый старт (через Xcode)

1. Откройте `SDDS.xcworkspace`.
2. Выберите схему:
   - `SDDSDemoApp` (все темы),
   - `SDDSDemoAppSDDSServ`,
   - `SDDSDemoAppPlasmaB2C`,
   - `SDDSDemoAppPlasmaHomeDS`.
3. Выберите любой iOS Simulator.
4. Запустите `Run` (`Cmd+R`).

---

## Быстрый старт (через CLI)

Из папки `SDDSDemoApp`:

```bash
xcodebuild -scheme SDDSDemoApp -destination 'generic/platform=iOS Simulator' build
```

Для DS-изолированных схем:

```bash
xcodebuild -scheme SDDSDemoAppSDDSServ -destination 'generic/platform=iOS Simulator' build
xcodebuild -scheme SDDSDemoAppPlasmaB2C -destination 'generic/platform=iOS Simulator' build
xcodebuild -scheme SDDSDemoAppPlasmaHomeDS -destination 'generic/platform=iOS Simulator' build
```

---

## Как работает выбор DS

В схемах используется переменная окружения:

- `SANDBOX_DS_PROFILE`

Профили разбираются в:

- `SDDSDemoApp/SDDSDemoApp/Common/Sandbox/SandboxDesignSystemProfile.swift`

Актуальные значения:

- `sddsserv`
- `plasmab2c`
- `plasmahomeds`
- `stylessalute`
- (пусто/не задано) => `all`

> Для `stylessalute` профиль в коде уже есть, но отдельная shared-схема в проекте пока не заведена.

---

## Истории (stories) и генерация

В проекте включен MVP-генератор регистраций stories.

- Скрипт: `scripts/generate_sandbox_stories.py`
- Генерируемый файл:
  `SDDSDemoApp/SDDSDemoApp/Common/Sandbox/GeneratedStories+Autogen.swift`

Ручной запуск:

```bash
python3 scripts/generate_sandbox_stories.py
```

Также скрипт подключен в Build Phases (`Generate Sandbox Stories`) для app-схем.

---

## Что проверять после запуска

1. Открываются экраны компонентов без крэшей.
2. В DS-изолированной схеме нет "чужих" тем в выборе.
3. Компоненты без вариаций для текущей темы не показываются в списке.
4. В логах нет ошибок вида:
   - `No image named ... found in asset catalog`
   - `Undefined ... for size ...`

---

## Как добавить новую тему в sandbox (пошагово)

Ниже минимальный рабочий чеклист для подхода "1 DS = 1 схема/target".

### 1) Подключить theme package

Добавьте новый пакет темы по аналогии с существующими (`Themes/<YourTheme>`), чтобы он был доступен из `SDDSDemoApp`.

### 2) Добавить профиль DS

Обновите `SandboxDesignSystemProfile`:

- новый `case`,
- парсинг `SANDBOX_DS_PROFILE`,
- `title`,
- `supportedThemes`.

Пример (для `stylesSalute`):

```swift
enum SandboxDesignSystemProfile: Equatable {
    case all
    case sddsServ
    case plasmaB2C
    case plasmaHomeDS
    case stylesSalute

    static func from(environmentValue: String?) -> SandboxDesignSystemProfile {
        switch environmentValue?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() {
        case "stylessalute", "styles_salute", "salute":
            return .stylesSalute
        default:
            return .all
        }
    }

    var title: String {
        switch self {
        case .stylesSalute:
            return "Components - Styles Salute"
        default:
            return "Components"
        }
    }

    var supportedThemes: Set<Theme> {
        switch self {
        case .stylesSalute:
            return [.stylesSalute]
        default:
            return Set(Theme.allCases)
        }
    }
}
```

### 3) Добавить регистрацию ThemeProvider

Обновите `SandboxBootstrap`:

- добавьте `register<YourTheme>Theme(_:)`,
- подключите в `registerTheme(profile:)`,
- при необходимости добавьте `#if SANDBOX_DS_<...>` условия.

Пример (по аналогии, для `stylesSalute`):

```swift
enum SandboxBootstrap {
    static func registerTheme(profile: SandboxDesignSystemProfile) {
        let manager = ThemeManager.shared
        manager.reset()

        switch profile {
        case .all:
            registerServTheme(manager)
            registerPlasmaB2CTheme(manager)
            registerPlasmaHomeDSTheme(manager)
            registerStylesSaluteTheme(manager)
        case .stylesSalute:
            registerStylesSaluteTheme(manager)
        default:
            break
        }
    }
}

private extension SandboxBootstrap {
    static func registerStylesSaluteTheme(_ manager: ThemeManager) {
        #if !SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_B2C && !SANDBOX_DS_PLASMA_HOME_DS
        manager.register(StylesSaluteSandboxThemeProvider())
        #endif
    }
}
```

Если добавляете именно новую DS-схему/target (а не общий профиль), добавьте свой compile flag:

```swift
#if SANDBOX_DS_MY_NEW_THEME
manager.register(MyNewThemeSandboxThemeProvider())
#endif
```

### 4) Добавить DS facade для Theme

Создайте файл в:

- `SDDSDemoApp/SDDSDemoApp/Common/DSTheme/SandboxDemoAppTheme+<YourTheme>.swift`

По аналогии с существующими facade-файлами:

- только вариации/токены вашей темы,
- без зависимостей на лишние DS модули.

### 5) Создать отдельный app target

Добавьте target по аналогии с:

- `SDDSDemoAppSDDSServ`,
- `SDDSDemoAppPlasmaB2C`,
- `SDDSDemoAppPlasmaHomeDS`.

Важно: линковать только необходимое:

- `SandboxCore`
- `SandboxSwiftUI`
- `SDDSComponents`
- `SDDSThemeCore`
- и только вашу новую тему

### 6) Создать shared scheme

Добавьте схему `SDDSDemoApp<YourTheme>` и задайте:

- `SANDBOX_DS_PROFILE=<your_profile>`

### 7) Проверить stories

Запустите генератор:

```bash
python3 scripts/generate_sandbox_stories.py
```

или соберите схему (run script сделает это автоматически).

### 8) Проверить сборку и smoke

```bash
xcodebuild -scheme SDDSDemoApp<YourTheme> -destination 'generic/platform=iOS Simulator' build
```

Потом откройте несколько сложных экранов (например, Tabs/Dropdown/Popover/Tooltip/Badge) и проверьте визуал + логи.

---

## Полезные файлы

- `SDDSDemoApp/SDDSDemoApp/Common/Sandbox/SandboxBootstrap.swift`
- `SDDSDemoApp/SDDSDemoApp/Common/Sandbox/SandboxDesignSystemProfile.swift`
- `SDDSDemoApp/SDDSDemoApp/Common/Sandbox/GeneratedStoriesRegistration.swift`
- `SDDSDemoApp/SDDSDemoApp/Common/Sandbox/GeneratedStories+Autogen.swift`
- `scripts/generate_sandbox_stories.py`
- `docs/sandbox-ios-runbook.md`

