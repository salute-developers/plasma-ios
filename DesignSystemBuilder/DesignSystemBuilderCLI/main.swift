import Foundation
import ArgumentParser

// Единая точка входа CLI дизайн-системы.
//
// Подкоманда по умолчанию — `themes`, поэтому привычный вызов без подкоманды
// продолжает работать как раньше:
//     dsbuilder cfg.json -o ./Themes
// эквивалентно
//     dsbuilder themes cfg.json -o ./Themes
struct DesignSystemBuilder: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "dsbuilder",
        abstract: "CLI дизайн-системы SDDS: генерация тем и документационный бандл.",
        subcommands: [GenerateThemes.self, Docs.self],
        defaultSubcommand: GenerateThemes.self
    )
}

DesignSystemBuilder.main()
