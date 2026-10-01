import Foundation
import ArgumentParser
import DesignSystemBuilderCore

/// Генерация вариаций компонентов из локальной `.sdds`.
///
/// Отдельная от темы команда — как `generateComposeComponents` на Android: тема и компоненты
/// берутся из одного `.sdds`, но генерируются независимо и пишут каждая свою мету.
struct Components: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "components",
        abstract: "Генерация кода вариаций компонентов из локальной `.sdds`.",
        subcommands: [Generate.self]
    )
}

extension Components {

    struct Generate: ParsableCommand {
        static let configuration = CommandConfiguration(
            commandName: "generate",
            abstract: "Сгенерировать вариации компонентов темы из `.sdds`.",
            discussion: """
            Токены темы эта команда не трогает — их генерирует `theme generate`. \
            Нужна мета API стилей (`ios-api-meta.json`) рядом с бинарём или в `.sdds` репозитория.
            """
        )

        @OptionGroup var options: SddsGenerationOptions

        func run() throws {
            try options.run(scope: .components)
        }
    }
}
