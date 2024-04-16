import Foundation

protocol Runnable {
    @discardableResult func run() -> CommandResult
}

class Command: Runnable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    @discardableResult func run() -> CommandResult {
        Logger.printLine()
        Logger.printText(name)
        
        return .empty
    }
}

enum CommandResult {
    case empty
    case success
    case scheme(Scheme)
    case error(Error)
}
