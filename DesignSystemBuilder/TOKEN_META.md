# Мета-информация по токенам (`config-info-tokens-ios.json`)

Генератор `DesignSystemBuilder` при генерации темы отдаёт мета-файл по всем сгенерированным
токенам дизайн-системы. Файл нужен внешним инструментам (binding/дизайн-тулинг), чтобы
однозначно сопоставить исходный токен, сгенерированный Swift-символ и его резолвнутое значение.

## Где лежит результат

Мета-файл — **per-theme**, в `.sdds` рядом с пакетом темы:

```
Themes/<Name>Theme/.sdds/config-info-tokens-ios.json
```

Например, для PlasmaHomeDS — `Themes/PlasmaHomeDSTheme/.sdds/config-info-tokens-ios.json`.
С `--output <dir>` пишется в `<dir>/<Name>Theme/.sdds/`.

Файл трекается в git (как `.sdds/config.json`); данные токенов внутри `.sdds/tenants/**` —
нет. Перезаписывается при каждой генерации этой темы.

## Как это работает

1. При генерации базовой темы (`App.generateBaseTheme`) после генерации токенов вызывается
   `App.generateTokensMeta(...)`.
2. Метаданные токенов (`type`, `name`, `displayName`, `description`, `enabled`) берутся из
   `meta.json` темы (модель `Scheme.tokens` / `Token`).
3. Резолвнутые **значения** и **сгенерированные имена** берутся из тех же context-builder'ов,
   что генерят Swift-токены (`ColorContextBuilder`, `GradientContextBuilder`,
   `TypographyContextBuilder`, `GeneralContextBuilder`) — они запускаются повторно read-only.
4. Чистая логика сборки записей вынесена в `TokenMetaResolver`
   (`DesignSystemBuilderCore/Model/Scheme/Token.swift`) и покрыта юнит-тестами; `App` отвечает
   только за запуск билдеров и запись файла.

Источник значений — `ios_<type>.json` из схемы. Полнота зависит от источника темы:
- **zip / theme-converter** и **наполненный `.sdds` / DS Builder** — значения есть.
- пустой `.sdds` — часть значений может отсутствовать.

## Формат файла

```jsonc
{
  "name": "plasma_homeds_default",   // из meta.json
  "version": "latest",               // из meta.json
  "tokens": [
    {
      "theme": "dark",               // light/dark для color/gradient; "" для остальных
      "type": "color",
      "name": "dark.outline.on-dark.info",           // исходное имя (meta.json)
      "displayName": "onDarkOutlineInfo",
      "description": "Цвет обводки информация на темном фоне",
      "tenant": "",                  // "" — базовая тема
      "reference": "OutlineOnDarkInfo",              // PascalCase сген. символа
      "themeReference": "PlasmaHomeDSTheme.ColorToken.outlineOnDarkInfo",
      "value": "0xFF199AF0"          // резолвнутое значение (полиморфно по типу)
    }
  ]
}
```

### Поля записи токена

| Поле | Описание |
| --- | --- |
| `theme` | Режим `light`/`dark` для color/gradient (по префиксу имени). Для typography/shadow/shape/spacing — `""`. |
| `type` | `color` / `gradient` / `typography` / `shadow` / `shape` / `spacing`. `fontFamily` в файл **не** попадает. |
| `name` | Исходное имя токена из `meta.json` (как есть, с префиксом режима/экрана). |
| `displayName`, `description` | Из `meta.json`. |
| `tenant` | `""` (базовая тема; тенант-варианты в v1 не выгружаются). |
| `reference` | PascalCase сгенерированного символа (`OutlineOnDarkInfo`). |
| `themeReference` | `<Тема>Theme.<ТипТокена>.<camelVar>`. Тип токена по типу: `ColorToken`, `GradientToken`, `AdaptiveTypographyToken`, `ShadowToken`, `ShapeToken`, `SpacingToken`. |
| `value` | Резолвнутое значение, формат зависит от типа (см. ниже). |

### `value` по типам

| Тип | Формат `value` | Пример |
| --- | --- | --- |
| color | ARGB-строка `0xAARRGGBB` (альфа первая) | `"0xFF199AF0"` |
| gradient | массив слоёв: `kind`, `colors` (ARGB `0x…`), `locations` (числа), `angle`/… | `[{"kind":"linear","angle":45,"colors":["0xFF1A9E32","0xFF04C6C9"],"locations":[0,1]}]` |
| typography | объект свойств одного экрана | `{"fontName":"SF Pro","weight":"medium","style":"normal","size":32,"lineHeight":36,"kerning":0}` |
| shadow | массив слоёв `{color:0x…, offsetX, offsetY, blurRadius, spreadRadius}` | `[{"color":"0x66000000","offsetX":0,"offsetY":60,"blurRadius":112,"spreadRadius":-8}]` |
| shape | `{cornerRadius, kind}` | `{"cornerRadius":16,"kind":"round"}` |
| spacing | число (pt) | `20` |

## Как запустить

```sh
cd DesignSystemBuilder
./build_cli.sh                                   # ожидаем ** BUILD SUCCEEDED **
./build/dsbuilder/dsbuilder <config.json> --output /tmp/out
```

Признак успеха в логе:
```
📝 tokens meta written: /tmp/out/<Name>Theme/.sdds/config-info-tokens-ios.json (N tokens)
```

Быстрый просмотр:
```sh
python3 -m json.tool Themes/PlasmaHomeDSTheme/.sdds/config-info-tokens-ios.json | head -40
```

## Автотесты

```sh
cd DesignSystemBuilder
xcodebuild test -project DesignSystemBuilder.xcodeproj \
  -scheme DesignSystemBuilderCoreTests \
  -only-testing:DesignSystemBuilderCoreTests/TokenMetaResolverTests
# ожидаем ** TEST SUCCEEDED **
```

`TokenMetaResolverTests` покрывает: конвертацию ARGB (6/8-значный hex), PascalCase,
`0/1`→число (не bool), маппинг экрана typography, сборку записей по всем типам, исключения
(fontFamily/disabled/отсутствие значения).

## Ограничения (не баги)

- Только базовая тема, `tenant: ""`.
- Полнота значений зависит от источника темы (см. «Как это работает»).
- `shadow`-цвета конвертируются в ARGB, только если в `ios_shadow.json` уже hex; palette-ссылка
  останется как есть.
