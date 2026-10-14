# Proposal: разделить генерацию темы и компонентов на iOS

## Why

На Android генерация разделена: `generateComposeTheme`/`generateViewTheme` отдельно от
`generateComposeComponents`/`generateViewComponents` (plasma-android PR #920). Благодаря этому
DS Builder CLI умеет `theme generate` и `components generate --platform compose|android-view`
(design-system-builder PR #74).

На iOS обе вещи делает один проход `dsbuilder-ios theme generate`: токены и вариации компонентов
генерируются вместе, отдельного входа нет. Поэтому `IosCliDelegate` объявляет только `THEME`
и `DOCS_AGGREGATE`, а `dsbuilder components generate --platform swiftui` отказывает с
объяснением «на iOS компоненты генерируются вместе с темой». Ревью PR #69 зафиксировало это
как недоработку iOS-стороны.

Второе расхождение глубже разделения команд: **источник конфигов компонентов**. Android читает
их из локальной `.sdds/components`, которую наполняет DS Builder CLI (`components fetch`,
формат `meta.json` + файл конфига на вариацию). iOS берёт конфиги из theme-converter по сети:
`ComponentConfigSource` ходит в `<baseURL>/components/<scheme>/<file>`, а локальная директория
используется только для `LocalSchemes`. Пока источник не переключён, «компоненты из дизайн-системы»
на iOS и на Android — это разные наборы данных, и разделение команд само по себе этого не чинит.

## What Changes

- `dsbuilder-ios` получает подкоманду `components generate --sdds <dir>`, генерирующую только
  вариации компонентов, а `theme generate` перестаёт их генерировать (остаются токены,
  шрифты и мета-файлы).
- Обратная совместимость: существующий проход «тема вместе с компонентами» сохраняется под
  существующим входом (`themes`/`theme generate --with-components`), чтобы текущие вызовы
  в plasma-ios и релизные скрипты не сломались — зеркально тому, как Android сохранил
  `generateTheme`/`generateComponents` рядом с пер-платформенными тасками.
- `ComponentConfigSource` резолвит конфиги из `.sdds/components` (формат DS Builder:
  `meta.json` + `config`-файл на вариацию), а theme-converter остаётся fallback'ом.
- `IosCliDelegate` объявляет `Capability.COMPONENTS` и маппит её в `components generate`;
  `dsbuilder components generate --platform swiftui` начинает работать.
- Форматирование сгенерированного кода после генерации — аналог `spotlessApply` на Android.

## Non-goals

- Разделение SwiftUI и UIKit на две целевые платформы: вариации UIKit живут в той же библиотеке
  и генерируются вместе со SwiftUI, отдельной `TargetPlatform` для них нет.
- Изменение формата `ios-api-meta.json` и схемы `config-info-ios.json`.
- Переезд на новую модель appearance DS Builder (несколько appearance у компонента,
  колонка `platform` у appearances/properties — design-system-builder PR #80): это отдельная
  задача, см. «Что ещё изменилось» в [design.md](./design.md).
