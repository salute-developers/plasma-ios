# Локальный AI-workflow (plasma-ios)

Как вести разработку с AI-агентом **локально**: без issue-трекера, без CI, без PR-автоматики.
Задачи ставятся прямо в сессии Claude Code; проверка — локально + просмотр владельцем.

> Режим биллинга: только интерактивный Claude Code (подписка). `ANTHROPIC_API_KEY` —
> **unset**, `claude -p`/headless — **не использовать**. См.
> [.claude/memory/local-mode-billing.md](../.claude/memory/local-mode-billing.md).

## Цикл

1. **Задача.** Опиши агенту прямо в сессии (что · где · как проверить — см.
   [TASK_GUIDE.md](TASK_GUIDE.md)) или возьми пункт из [BACKLOG.md](BACKLOG.md).

2. **Ветка.** Отведи feature-ветку из `develop`:
   ```sh
   git checkout develop && git pull
   git checkout -b feat/<кратко>     # или fix/<кратко>
   ```

3. **Планирование под тип работы:**
   - **Фича** → **OpenSpec** (spec-driven): `/opsx:explore` (разведка/выбор подхода,
     по желанию) → `/opsx:propose <что строим>` → реализация `/opsx:apply` →
     `/opsx:archive`. Спеки и изменения живут в `openspec/` (`changes/`, `archive/`) и
     **коммитятся** в git.
   - **Баг** → systematic debugging (воспроизвести → изолировать → диагноз → фикс).

   > OpenSpec ставится один раз (см. «Установка инструментов» ниже); `openspec init`
   > добавляет управляемый блок в `CLAUDE.md` и слэш-команды `/opsx:*`.

4. **Реализация.** TDD, где применимо. Навигация по коду — через граф **Serena** (MCP),
   не голым `grep`. Читай `CLAUDE.md` пакета перед правками. Не редактируй
   сгенерированные файлы (`Themes/*`, `SDDSIcons/Generated/*`) — меняй источник и
   регенерируй.

5. **Локальная проверка** (то, что есть у затронутого пакета — см. [project.yml](../project.yml)):
   ```sh
   ./lint.sh                       # swiftlint
   ruby scripts/run_tests.rb       # тесты, где заданы схемы
   # + целевая сборка пакета (xcodebuild ...) или ручной осмотр, если авто-проверок нет
   ```

6. **Ревью.** `/code-review high` (в рамках подписки). Исправь замечания.

7. **Память.** Если приняли решение/нашли грабли — допиши факт в
   [.claude/memory/](../.claude/memory/) и строку в его `MEMORY.md`.

8. **Коммит.** Conventional Commits, один логический пункт = один коммит, скоуп = target
   (см. [CONTRIBUTING.md](../CONTRIBUTING.md)). Без `Co-Authored-By`.

9. **Merge в `develop`/`main` — только с разрешения владельца.** Никаких issue/PR-автоматик:
   всё локально.

## Установка инструментов (один раз, вручную)

Всё — в рамках подписки, без метерного API. Запускается разработчиком локально.

```sh
# OpenSpec — spec-driven workflow (/opsx:*)
npm install -g @fission-ai/openspec@latest
openspec init            # интерактивно: выбери Claude Code; создаст openspec/ и блок в CLAUDE.md
openspec update          # позже — обновить AI-гайд и слэш-команды

# claude-mem — память сессий
npx claude-mem install

# superpowers — набор плагинов (в интерактивной сессии Claude Code)
#   /plugin install superpowers@claude-plugins-official

# Serena (граф-навигация, уже прописан в .mcp.json) — проверить в сессии: /mcp
```

`openspec/` и обновлённый `CLAUDE.md` после `openspec init` — **коммитим** в git.

## Чего НЕ делаем

- Не создаём `.github/`-workflow для агентов, не заводим `ANTHROPIC_API_KEY` в CI.
- Не мержим в `develop`/`main` без явного согласия.
- Не правим сгенерированный код руками.
