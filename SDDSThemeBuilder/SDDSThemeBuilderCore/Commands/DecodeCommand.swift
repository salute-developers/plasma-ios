import Foundation

final class DecodeCommand<T: Codable>: Command {
    let url: URL
    
    init(url: URL) {
        self.url = url
        
        super.init(name: "Decode JSON Scheme")
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let scheme = try decoder.decode(T.self, from: data)
            
            return .value(scheme)
        } catch {
            return .error(error)
        }
    }
}
