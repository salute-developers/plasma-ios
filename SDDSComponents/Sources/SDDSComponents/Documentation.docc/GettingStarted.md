# Быстрый старт

Подключение библиотеки, инициализация темы и первый компонент на экране.

## Подключение

Минимальный набор модулей: ``SDDSComponents``, `SDDSThemeCore` (типы токенов), `SDDSIcons`
(иконки, на которые ссылаются темы) и одна тема — например `SDDSServTheme`.

Через Swift Package Manager репозиторий подключается по коммиту релизного тега: теги
датированные (`release-DD-MM-YYYY`), а SwiftPM принимает в `from:`/`exact:` только семвер.

```swift
dependencies: [
    .package(
        url: "https://github.com/salute-developers/plasma-ios.git",
        revision: "5d4b336d16cb4bd637c24b7fcb310d7b0400d2c3"
    )
]
```

Альтернатива — готовые `.xcframework` из ассетов релиза, их версии перечислены в
`release-manifest.json`.

## Инициализация темы

`Theme.initialize()` регистрирует дефолтный appearance каждого компонента и шрифты темы.
Вызывается один раз на старте приложения. Метод синхронный: шрифты вшиты в исходники темы,
сеть не нужна, и после возврата тема готова к использованию.

```swift
import SwiftUI
import SDDSComponents
import SDDSServTheme

@main
struct MyApp: App {
    init() {
        SDDSServTheme.Theme.initialize()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
```

## Первый компонент

```swift
BasicButton(
    title: "Оплатить",
    subtitle: "1 490 ₽",
    appearance: SDDSServTheme.BasicButton.l.accent.appearance,
    layoutMode: .wrapContent,
    action: {}
)
```

Имя модуля темы не всегда совпадает с именем каталога: `Themes/SDDSservTheme` отдаёт модуль
`SDDSServTheme`. Библиотека и тема объявляют одноимённые типы (``BasicButton``,
``IconButton``), поэтому вариации темы адресуются с именем модуля.

## Дальше

- <doc:Theming> — как устроены вариации и токены.
- <doc:CustomTheme> — как сгенерировать свою тему.
