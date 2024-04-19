import Foundation
import ArgumentParser
import SDDSThemeBuilderCore

struct ThemeBuilder: ParsableCommand {
    @Argument var scheme: String
    @Argument var colorsScheme: String
    @Argument var templates: String
    @Argument var output: String
    @Argument var generatedOutput: String
    
    func run() throws {
        guard let schemeURL = URL(string: scheme),
              let colorsSchemeURL = URL(string: colorsScheme),
              let templatesURL = URL(string: templates),
              let outputURL = URL(string: output),
              let generatedOutputURL = URL(string: generatedOutput)
        else {
            return
        }
        
        let app = App(
            schemeURL: schemeURL,
            colorsSchemeURL: colorsSchemeURL,
            templatesURL: templatesURL,
            localSchemeURL: outputURL,
            generatedOutput: generatedOutputURL
        )
        app.run()
    }
}

ThemeBuilder.main()
