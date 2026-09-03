# SDDSIcons

Пакет иконок SDDS: asset-бандл, из которого **swiftgen** генерирует типобезопасные ссылки
`Asset.*`, используемые темами и приложениями.

## Структура

| Путь | Что это |
|---|---|
| `SDDSIcons/Assets.xcassets` | исходные ассеты |
| `Generated/` | сгенерированный swiftgen код (**не править руками**) |
| `Templates/assets.stencil` | шаблон генерации |
| `swiftgen.yml` | конфиг swiftgen |
| `Scripts/build_xcframework.sh` | сборка `SDDSIcons.xcframework` в `SDDSIcons/build` |
| `Scripts/verify_icons.rb` | проверка согласованности `Generated/` с asset-каталогом |

## Генерация

После добавления или переименования ассетов перегенерируйте код по `swiftgen.yml` и
закоммитьте обновлённый `Generated/`, затем прогоните проверку:

```sh
ruby SDDSIcons/Scripts/verify_icons.rb
```

Проверка ловит случаи, когда upstream присылает иконку, ломающую предположения шаблона:
цифру размера внутри имени, новый акроним, для которого не выводится имя каталога, или иконку,
у которой есть не все три размера.

## Сборка

Через общий скрипт (артефакт — в корневом `build/`):

```sh
ruby ./scripts/build_xcframeworks.rb -d . -p SDDSIcons/SDDSIcons.xcodeproj -m SDDSIcons
```

Через скрипт пакета (артефакт — в `SDDSIcons/build/`):

```sh
./SDDSIcons/Scripts/build_xcframework.sh
```

## Грабли

- `Generated/` — артефакт: правки затрутся следующим прогоном swiftgen.
- Бандл крупный; переименование или удаление иконки ломает `Asset.*`-ссылки в темах —
  проверяйте сборку `SDDSComponents` и тем.
- **Иконки публикуются отдельным релизом** `SDDSIcons-v*` через `.github/workflows/release_icons.yml`,
  а не вместе с остальными модулями.
- Коммит-скоуп: `sdds-acore/icons`.
