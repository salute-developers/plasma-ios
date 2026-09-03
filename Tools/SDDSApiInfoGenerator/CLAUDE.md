# CLAUDE.md — SDDSApiInfoGenerator

SwiftSyntax-тул: снимает слепок публичного API стилей из `*Appearance` в `ios-api-meta.json`.

**Полное описание, схема выхода, правила сверки config-id ↔ Appearance и запуск —
[README.md](README.md). Разметка маркерами — [../../SDDSApiInfo/README.md](../../SDDSApiInfo/README.md).**

## Что нужно помнить агенту

- **Имена свойств в `Props` и `Appearance` переименовывать НЕЛЬЗЯ.** Расхождение config-id и
  имени property чинится маркером `@ApiName` на свойстве, а не переименованием.
- Компонент виден мете только с `@ApiInfo` / `@ApiComponent` — авто-детекта по суффиксу нет.
- Мета — продукт сборки, в git не коммитится; её генерят `build_cli.sh` и `scripts/run_tests.rb`.
- Тул автономен от CLI `DesignSystemBuilder`.
- `.build/` в `.gitignore`; `Package.resolved` трекается.
- Коммит-скоуп: `sdds-icore/theme-builder`.
