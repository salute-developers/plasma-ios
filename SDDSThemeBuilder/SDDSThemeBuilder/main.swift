import Foundation
import ArgumentParser
import SDDSThemeBuilderCore

struct ThemeBuilder: ParsableCommand {
    @Argument(help: "Путь или URL к JSON-конфигу. Если не указан — встроенный default-конфиг.")
    var configArg: String?

    @Option(name: [.customShort("o"), .long],
            help: "Директория для сгенерированных тем (<name>Theme). Если не указана — пишется в <repo>/Themes, как раньше.")
    var output: String?

    @Flag(name: .long,
          help: "Собрать self-contained плоскую папку исходников токенов (<name>ThemeSources): токены + вендоренный SDDSThemeCore + Theme.swift, без линковки библиотек.")
    var standalone: Bool = false

    @Option(name: .long,
            help: "Путь к исходникам SDDSThemeCore для встраивания в standalone-бандл. Если не указан — repo-relative от бинаря.")
    var coreSources: String?

    @Flag(name: .long,
          help: "Аддитивно к --standalone встроить компонентный слой (вариации компонентов + вендоренные SDDSComponents/InputMask/SDDSIcons).")
    var components: Bool = false

    @Option(name: .long,
            help: "Директория для автономного бандла (<name>ThemeSources). Если не указана — ./SDDSStandalone в текущей рабочей директории.")
    var standaloneOutput: String?

    @Flag(name: .long,
          help: "Вендорить исходники внешних зависимостей (InputMask) в бандл. По умолчанию они остаются внешними (import сохранён, клиент линкует сам).")
    var externalDependencies: Bool = false

    @Option(name: .long,
            help: "Корень вендоримых исходников (библиотеки + пакет темы) для standalone. Если не указан — корень репозитория. Позволяет запускать вне репо, указав распакованную копию исходников.")
    var sourcesRoot: String?

    @Flag(name: .long,
          help: "Генерировать стили компонентов типизированным (старым) путём, без ios-api-meta.json. По умолчанию используется универсальный генератор.")
    var typedGenerator: Bool = false

    func run() throws {
        UniversalRuntime.isEnabled = !typedGenerator
        
        let config: ThemeBuilderConfiguration
        do {
            if let configArg = configArg {
                let configURL: URL
                if let parsed = URL(string: configArg), parsed.scheme != nil {
                    configURL = parsed
                } else {
                    configURL = URL(fileURLWithPath: configArg)
                }
                let jsonData = try Data(contentsOf: configURL)
                config = try JSONDecoder().decode(ThemeBuilderConfiguration.self, from: jsonData)
                print("✅ \(usingExternalConfigurationMessage)")
            } else {
                print("✅ \(usingDefaultConfigurationMessage)")
                config = ThemeBuilderConfiguration()
            }
        } catch {
            print(error)
            print("❌ \(usingDefaultConfigurationMessage)")
            config = ThemeBuilderConfiguration()
        }
        
        let app = App(config: config, sourcePath: #file, outputPath: output, standalone: standalone, coreSourcesPath: coreSources, includeComponents: components, standaloneOutputPath: standaloneOutput, vendorExternalDependencies: externalDependencies, sourcesRootPath: sourcesRoot)
        app.run()
    }
    
    private var usingDefaultConfigurationMessage = "Using default configuration..."
    private var usingExternalConfigurationMessage = "Using configuration provided via command line argument..."
}

ThemeBuilder.main()
