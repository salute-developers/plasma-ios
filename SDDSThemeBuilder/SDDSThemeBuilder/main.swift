import Foundation
import ArgumentParser
import SDDSThemeBuilderCore

struct ThemeBuilder: ParsableCommand {
    @Argument var schemeZip: String
    @Argument var palette: String
    @Argument var themeBuilder: String
    
    func run() throws {
        guard let schemeURL = URL(string: schemeZip),
              let paletteURL = URL(string: palette),
              let themeBuilderURL = URL(string: themeBuilder)
        else {
            return
        }
        
        let app = App(
            schemeZipURL: schemeURL,
            paletteURL: paletteURL,
            themeBuilderURL: themeBuilderURL
        )
        app.run()
    }
}

ThemeBuilder.main()
