import Foundation
import ArgumentParser

struct ThemeBuilder: ParsableCommand {
    @Argument var scheme: String
    @Argument var output: String
    
    func run() throws {
        guard let schemeURL = URL(string: scheme), let outputURL = URL(string: output) else {
            return
        }
        
        let app = App(schemeURL: schemeURL, localSchemeURL: outputURL)
        app.run()
    }
}

ThemeBuilder.main()
