# generate_themes.rb

Этот скрипт предназначен для автоматического создания Xcode проектов для каждой темы по всем вертикалям на основе заданных параметров из JSON файла. Скрипт запускает схему `SDDSThemeBuilder` для каждой темы, а затем запускает `create_project.rb` для создания нового проекта и генерации фреймворка.

## Требования

- Ruby 2.6 или выше
- Библиотека `xcodeproj` для Ruby (`gem install xcodeproj`)
- Библиотека `json` для Ruby
- Исполняемый файл утилиты `SDDSThemeBuilder` под macOS
- Собранный `SDDSThemeCore.xcframework`

## Установка

1. Убедитесь, что у вас установлен Ruby.
2. Установите необходимые библиотеки с помощью команды:
    ```sh
    gem install xcodeproj json
    ```

## Использование

### Конфигурация

Создайте файл конфигурации в формате JSON, который будет содержать параметры для каждой темы. Пример JSON файла:

```json
{
  "themes": [
    {
      "scheme": "https://github.com/salute-developers/theme-converter/raw/main/themes/caldera_online/0.1.0.zip",
      "palette": "https://raw.githubusercontent.com/salute-developers/plasma/dev/packages/plasma-colors/palette/general.json",
      "name": "CaldernaOnlineTheme"
    },
    {
      "scheme": "https://github.com/salute-developers/theme-converter/raw/main/themes/default/0.1.0.zip",
      "palette": "https://raw.githubusercontent.com/salute-developers/plasma/dev/packages/plasma-colors/palette/general.json",
      "name": "DefaultTheme"
    },
    {
      "scheme": "https://github.com/salute-developers/theme-converter/raw/main/themes/flamingo/0.1.0.zip",
      "palette": "https://raw.githubusercontent.com/salute-developers/plasma/dev/packages/plasma-colors/palette/general.json",
      "name": "FlamingoTheme"
    }
  ],
  "output_dir": "file:///Users/username/plasma-ios/SDDSThemeBuilder",
  "source_project_path": "/Users/username/plasma-ios/SDDSThemeBuilder",
  "create_project_script_path": "/Users/username/plasma-ios/scripts/create_project/create_project.rb",
  "xcframeworks": [
    {
      "xcframework_path": "/Users/username/plasma-ios/SDDSThemeBuilder/build/SDDSThemeCore.xcframework"
    }
  ],
  "themes_output_dir": "/Users/username/plasma-ios/Themes",
  "executable_path": "/Users/username/themebuilder/SDDSThemeBuilder"
}
```

### Описание параметров в JSON
`themes`: Массив объектов, каждый из которых представляет отдельную тему. Каждый объект содержит:
- `scheme`: URL на ZIP-архив с темой.
- `palette`: URL на JSON файл с палитрой цветов.
- `name`: Название темы.

`output_dir`: Путь к директории, где будет размещен вывод исполняемого файла SDDSThemeBuilder. Этот путь должен начинаться с file://. 

`source_project_path`: Путь к исходному Xcode проекту `SDDSThemeBuilder`.

`create_project_script_path`: Путь к скрипту `create_project.rb`, который будет запущен для создания нового Xcode проекта и генерации фреймворка.

`xcframeworks`: Массив объектов, каждый из которых содержит путь к xcframework, который будет включен в новый проект. Каждый объект содержит:
- `xcframework_path`: Путь к xcframework.

`themes_output_dir`: Путь к директории, где будут создаваться новые Xcode проекты для тем.

`executable_path`: Путь к исполняемому файлу SDDSThemeBuilder.

### Запуск скрипта

 ```
 ruby generate_themes.rb /Users/username/plasma-ios/config/themes_config.json

 ```
