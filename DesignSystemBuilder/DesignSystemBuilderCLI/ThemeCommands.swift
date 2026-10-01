import Foundation
import ArgumentParser
import DesignSystemBuilderCore

/// Генерация темы из локальной `.sdds`, наполненной DS Builder CLI.
///
/// В отличие от `themes`, которому нужен JSON-конфиг со списком тем, здесь тема одна и
/// описана самой `.sdds`. Так эту команду вызывает `dsbuilder theme generate` из
/// salute-developers/design-system-builder: он передаёт только пути и не знает про Swift.
struct Theme: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "theme",
        abstract: "Генерация кода темы из локальной `.sdds`.",
        subcommands: [Generate.self]
    )
}

extension Theme {

    struct Generate: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "generate",
            abstract: "Сгенерировать токены темы из `.sdds`, наполненной `dsbuilder theme fetch`.",
            discussion: """
            Генерируются токены, шрифты и мета токенов. Вариации компонентов генерирует \
            `components generate` — отдельной командой, как на Android. Прежний совмещённый \
            результат одной командой даёт `--with-components`.
            """
        )

        @OptionGroup var options: SddsGenerationOptions

        @Flag(name: .long, help: "Сгенерировать заодно и вариации компонентов (прежнее поведение команды).")
        var withComponents: Bool = false

        func run() throws {
            try options.run(scope: withComponents ? .all : .theme)
        }
    }
}
