import Foundation

final class DecodeSchemeCommand: Command {
    let schemeURL: URL
    
    init(schemeURL: URL) {
        self.schemeURL = schemeURL
        
        super.init(name: "Decode JSON Scheme")
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        do {
            let data = try Data(contentsOf: schemeURL)
            let decoder = JSONDecoder()
            let scheme = try decoder.decode(Scheme.self, from: data)
            
            return .scheme(scheme)
        } catch {
            return .error(error)
        }
    }
}
