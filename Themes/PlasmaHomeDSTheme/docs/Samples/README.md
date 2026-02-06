# Примеры для документации темы PlasmaHomeDSTheme

Сюда кладите **theme-specific** примеры компонентов: файлы `*Samples.swift` с маркером `// @DocSample`, по аналогии с `SDDSComponentsFixtures/Sources/.../Samples/`.

При сборке документации темы экстрактор подхватывает и core-примеры (`SDDSComponentsFixtures`), и примеры из этой папки. Файлы с тем же именем (например, `Button/NavigationBar_WithOverlay.swift`) перезаписывают core.

**Структура:** подкаталоги по компонентам, например:

- `Button/ButtonSamples.swift`
- `NavigationBar/NavigationBarSamples.swift`

**Кастомная документация** темы (override страниц) — в `override-docs/` (файлы `+*Usage.md` мержатся в базовые страницы при генерации).
