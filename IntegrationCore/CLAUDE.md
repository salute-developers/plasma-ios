# CLAUDE.md — IntegrationCore

Ядро песочницы: `SandboxCore` / `SandboxSwiftUI` / `SandboxDemoTheme`.

**Полное описание, состав пакетов и сборка — [README.md](README.md).**

## Что нужно помнить агенту

- В клиентское приложение не идёт — нужен только `SDDSDemoApp`.
- `SandboxCore` не имеет зависимостей; не добавляй их — на него ссылаются пакеты тем.
- **`StoryRegistry` — точка расширения:** новая история должна регистрироваться, иначе не
  появится в песочнице.
- Коммит-скоуп: `sdds-icore/sandbox`.
