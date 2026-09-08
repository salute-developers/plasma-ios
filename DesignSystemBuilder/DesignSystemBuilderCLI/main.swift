import Foundation
import ArgumentParser

/// Версия инструмента. Её печатает `--version` и читает `dsbuilder toolchain doctor`
/// на стороне DS Builder CLI, поэтому формат — голый semver, без префиксов.
let dsBuilderIosVersion = "0.1.0"

// Единая точка входа CLI дизайн-системы.
//
// Подкоманда по умолчанию — `themes`, поэтому привычный вызов без подкоманды
// продолжает работать как раньше:
//     dsbuilder-ios cfg.json -o ./Themes
// эквивалентно
//     dsbuilder-ios themes cfg.json -o ./Themes
struct DesignSystemBuilder: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "dsbuilder-ios",
        abstract: "CLI дизайн-системы SDDS под iOS: генерация тем и документационный бандл.",
        version: dsBuilderIosVersion,
        subcommands: [GenerateThemes.self, Theme.self, Docs.self],
        defaultSubcommand: GenerateThemes.self
    )
}

// Коды возврата по контракту платформенного инструмента DS Builder:
// 0 — успех, 1 — ошибка выполнения, 2 — неверные аргументы. ArgumentParser
// по умолчанию отдаёт 64 на ошибках разбора, поэтому маппинг делаем сами.
// `--help` и `--version` приходят сюда как «ошибка» с нулевым кодом.
do {
    var command = try DesignSystemBuilder.parseAsRoot()
    try command.run()
} catch {
    let message = DesignSystemBuilder.fullMessage(for: error)
    switch DesignSystemBuilder.exitCode(for: error) {
    case .success:
        if !message.isEmpty { print(message) }
        Foundation.exit(0)
    case .validationFailure:
        if !message.isEmpty { FileHandle.standardError.write(Data((message + "\n").utf8)) }
        Foundation.exit(2)
    default:
        if !message.isEmpty { FileHandle.standardError.write(Data((message + "\n").utf8)) }
        Foundation.exit(1)
    }
}
