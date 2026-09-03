# CLAUDE.md — SDDSIcons

Asset-бандл иконок; swiftgen генерирует из него `Asset.*`.

**Полное описание, генерация и сборка — [README.md](README.md).**

## Что нужно помнить агенту

- `Generated/` — артефакт: правки затрутся следующим прогоном swiftgen.
- Бандл крупный; переименование или удаление иконки ломает `Asset.*`-ссылки в темах —
  проверяй сборку `SDDSComponents` и тем.
- После правки ассетов прогоняй `ruby SDDSIcons/Scripts/verify_icons.rb`.
- Иконки публикуются отдельным релизом `SDDSIcons-v*` (`release_icons.yml`), а не вместе с
  остальными модулями.
- Коммит-скоуп: `sdds-acore/icons`.
