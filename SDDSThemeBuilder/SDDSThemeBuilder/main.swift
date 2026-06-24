import Foundation
import ArgumentParser
import SDDSThemeBuilderCore

struct ThemeBuilder: ParsableCommand {
    @Argument(help: "Путь или URL к JSON-конфигу. Если не указан — встроенный default-конфиг.")
    var configArg: String?

    @Option(name: [.customShort("o"), .long],
            help: "Директория для сгенерированных тем (<name>Theme). Если не указана — пишется в <repo>/Themes, как раньше.")
    var output: String?

    func run() throws {
        
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
        
        let app = App(config: config, sourcePath: #file, outputPath: output)
        app.run()
    }
    
    private var usingDefaultConfigurationMessage = "Using default configuration..."
    private var usingExternalConfigurationMessage = "Using configuration provided via command line argument..."
}

ThemeBuilder.main()
