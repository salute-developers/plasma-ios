# CLAUDE.md — SDDSDemoApp

Демо-приложение / песочница компонентов SDDS. Два режима: общая песочница со всеми темами
и DS-изолированные схемы (одна схема = одна тема).

## Структура

- `SDDSDemoApp/` — исходники приложения.
- `SDDSDemoAppStatic/` — вариант со статической линковкой.
- `SDDSDemoAppTests/` — тесты.
- `SDDSDemoApp.xcodeproj`, `README.md`.

## Запуск

Через Xcode: открыть корневой `SDDS.xcworkspace`, выбрать схему и симулятор, `Cmd+R`.
Схемы: `SDDSDemoApp` (все темы), `SDDSDemoAppSDDSServ`, `SDDSDemoAppPlasmaB2C`,
`SDDSDemoAppPlasmaHomeDS`.

Через CLI (из папки `SDDSDemoApp`):
```sh
xcodebuild -scheme SDDSDemoApp -destination 'generic/platform=iOS Simulator' build
xcodebuild -scheme SDDSDemoAppPlasmaHomeDS -destination 'generic/platform=iOS Simulator' build
```

## Выбор DS

Выбор дизайн-системы — через переменную окружения `SANDBOX_DS_PROFILE` и флаги компиляции
`SANDBOX_DS_*` в DS-изолированных схемах. Подробности и подключение новой темы — в
[README.md](README.md).

## Грабли

- Требуются установленные iOS Simulator runtime и заранее собранные зависимости.
- DS-изолированные схемы завязаны на конкретную тему из `Themes/*` — тема должна быть
  сгенерирована и подключена.
- Коммит-скоуп: `sdds-icore/sandbox`.
