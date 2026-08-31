# docs-info-artifacts

Генерация машинных info-артефактов документации (`config-info-swiftui.json`,
`theme-info.json`) в `SDDSThemeBuilder` по golden-контракту backend Documentation Service
(`InfoArtifactDtos`, фикстуры `ios-components.json`/`ios-theme.json`; форматы
`sdds-swiftui-components-info-v1` / `sdds-ios-theme-info-v1`).

## ADDED Requirements

### Requirement: Генерация components-info для платформы swiftui
`SDDSThemeBuilder` SHALL при генерации компонентов темы записывать
`.sdds/config-info-swiftui.json` со структурой `{name, packageName, components:[...]}`, где
каждый компонент содержит непустой `key` (kebab-case DS-имя), `coreName`, `styleName`,
`props` (имена/значения/дефолты из DS-меты `components/<theme>/meta.json`), `styleApi`
(`stylesClassName`, `returnTypeName`, `params[]` с `typeName` и `values[{value, codeName}]`)
и `variations[]`, где каждая вариация несёт `name`, `props` и **`reference`** в dot-notation
iOS-стилей (например `FormItem.M`) — поле `composeReference` MUST NOT использоваться.

#### Scenario: Компонент с вариациями попадает в config-info
- **WHEN** тема генерируется для компонента FormItem с вариацией `m`
- **THEN** в `.sdds/config-info-swiftui.json` присутствует запись с `key: "form-item"`,
  `variations[0].name == "m"` и `variations[0].reference == "FormItem.M"`

#### Scenario: Обязательные поля не пустые
- **WHEN** генерация завершилась
- **THEN** у каждой записи `key`, `coreName`, `styleName` непустые, а `variations` — массив
  (возможно пустой), иначе генерация завершается ошибкой с указанием компонента

### Requirement: Генерация theme-info
`SDDSThemeBuilder` SHALL при генерации токенов темы записывать `.sdds/theme-info.json` со
структурой `{name, version, tokens:[...]}` без поля `platform`, где каждый токен содержит
`type` (color/typography/gradient/shadow/spacing/shape/font), `name` (DS-имя токена),
`displayName`, `description`, `reference`, `themeReference` (реальный путь обращения к токену
в сгенерированном коде темы, например `<Theme>Theme.AdaptiveTypographyToken.headerH2Medium`)
и `value` с фактическим значением токена (для typography — `{fontFamilyRef, fontName,
kerning, lineHeight, size, style, weight}`).

#### Scenario: Токен цвета с фактическим значением
- **WHEN** тема содержит цветовой токен `dark.surface.default.transparent-card`
- **THEN** `theme-info.json` содержит токен с `type: "color"`, этим `name`, непустым
  `themeReference` и `value.color` в hex-формате

#### Scenario: Согласованность reference между слоями
- **WHEN** один и тот же токен присутствует в нескольких слоях/tenant-вариантах
- **THEN** его `reference` и `themeReference` идентичны во всех записях с одинаковым `name`

### Requirement: Совместимость с golden-фикстурами backend
Сгенерированные артефакты SHALL быть десериализуемы по схеме backend-DTO: тесты
`SDDSThemeBuilder` MUST валидировать выход против структуры golden-фикстур
(`ios-components.json`, `ios-theme.json`): состав обязательных полей, `reference` у вариаций,
отсутствие `platform` в theme-info.

#### Scenario: Валидация против фикстуры
- **WHEN** выполняются тесты theme-builder
- **THEN** декодер, повторяющий required/optional-поля backend-DTO, успешно разбирает оба
  сгенерированных файла и падает на фикстуре с пустым `key`
