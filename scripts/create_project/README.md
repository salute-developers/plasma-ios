# create_project.rb

Этот скрипт предназначен для копирования содержимого таргета `SDDSTheme` из исходного Xcode проекта, создания нового Xcode проекта с заданным названием и добавления в него зависимостей, конфигураций и других настроек. Также скрипт позволяет добавить уже собранный `XCFramework` в секцию `Frameworks and Libraries`. Данный скрипт позволяет создать Xcode проект для сборки фреймворка с набором токенов.

## Требования

- Ruby 2.6 или выше
- Библиотека `xcodeproj` для Ruby (`gem install xcodeproj`)

## Установка

1. Убедитесь, что у вас установлен Ruby.
2. Установите `xcodeproj` с помощью команды:
    ```sh
    gem install xcodeproj
    ```

## Использование

1. Скачайте или скопируйте скрипт в файл `create_project.rb`.
2. Запустите скрипт с помощью команды:

    ```sh
    ruby create_project.rb /path/to/SDDSThemeBuilder.xcodeproj NewProjectName /path/to/output /path/to/SDDSThemeCore.xcframework
    ```

    где:
    - `/path/to/SDDSThemeBuilder.xcodeproj` — путь к исходному Xcode проекту.
    - `NewProjectName` — название нового проекта.
    - `/path/to/output` — путь к директории, где будет создан новый проект.
    - `/path/to/SDDSThemeCore.xcframework` — путь к собранному `SDDSThemeCore.xcframework`.

## Пример

```sh
ruby create_project.rb /Users/username/Projects/SDDSThemeBuilder/SDDSThemeBuilder.xcodeproj Vertical /Users/username/Projects/Themes /Users/username/Frameworks/SDDSThemeCore.xcframework

