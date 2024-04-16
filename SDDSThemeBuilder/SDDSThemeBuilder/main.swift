import Foundation
import ArgumentParser
import SDDSThemeBuilderCore

struct ThemeBuilder: ParsableCommand {
    @Argument var schemeZip: String
    @Argument var palette: String
    @Argument var templates: String
    @Argument var outputDirectory: String
    @Argument var generatedOutput: String
    
    func run() throws {
        guard let schemeURL = URL(string: schemeZip),
              let paletteURL = URL(string: palette),
              let templatesURL = URL(string: templates),
              let outputDirectoryURL = URL(string: outputDirectory),
              let generatedOutputURL = URL(string: generatedOutput)
        else {
            return
        }
        
        let app = App(
            schemeZipURL: schemeURL,
            paletteURL: paletteURL,
            templatesURL: templatesURL,
            outputDirectoryURL: outputDirectoryURL,
            generatedOutput: generatedOutputURL
        )
        app.run()
    }
}

ThemeBuilder.main()
