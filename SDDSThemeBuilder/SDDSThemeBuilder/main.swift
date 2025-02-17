import Foundation
import ArgumentParser
import SDDSThemeBuilderCore

struct ThemeBuilder: ParsableCommand {
    @Argument var configArg: String?
    
    func run() throws {
        
        let config: ThemeBuilderConfiguration
        do {
            if let configArg = configArg, let configURL = URL(string: configArg) {
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
        
        let app = App(config: config, sourcePath: #file)
        app.run()
    }
    
    private var usingDefaultConfigurationMessage = "Using default configuration..."
    private var usingExternalConfigurationMessage = "Using configuration provided via command line argument..."
}

ThemeBuilder.main()
