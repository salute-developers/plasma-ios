import Foundation

final class DecodeSchemeCommand: Command {
    let schemeURL: URL
    
    init(schemeURL: URL) {
        self.schemeURL = schemeURL
        
        super.init(name: "Decode JSON Scheme")
    }
    
    override func run() -> CommandResult {
        super.run()
        
        do {
            let data = try Data(contentsOf: schemeURL)
            let decoder = JSONDecoder()
            let plasmaScheme = try decoder.decode(PlasmaScheme.self, from: data)
            
            print(plasmaScheme)
            
            return .scheme(plasmaScheme)
        } catch {
            return .error(error)
        }
    }
}
