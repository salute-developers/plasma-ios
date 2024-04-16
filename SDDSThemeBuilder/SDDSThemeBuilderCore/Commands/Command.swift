import Foundation

public protocol Runnable {
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

public enum CommandResult {
    case empty
    case success
    case data(Data)
    case dictionary([String: Any])
    case scheme(Scheme)
    case generated(String)
    case error(Error)
}

extension CommandResult {
    var asData: Data? {
        switch self {
        case .data(let value):
            return value
        default:
            return nil
        }
    }
    
    var isError: Bool {
        switch self {
        case .error:
            true
        default:
            false
        }
    }
    
    var asDictionary: [String: Any]? {
        switch self {
        case .dictionary(let value):
            value
        default:
            nil
        }
    }
    
    var asGenerated: String? {
        switch self {
        case .generated(let value):
            value
        default:
            nil
        }
    }
}
