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
    case generated(String)
    case error(Error)
    case url(URL)
    case schemeDirectory(SchemeDirectory)
    case value(Any)
}

extension CommandResult: Equatable {
    public static func == (lhs: CommandResult, rhs: CommandResult) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty), (.success, .success):
            return true
        case (.data(let lhsData), .data(let rhsData)):
            return lhsData == rhsData
        case (.generated(let lhsGenerated), .generated(let rhsGenerated)):
            return lhsGenerated == rhsGenerated
        case (.error(let lhsError), .error(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.url(let lhsURL), .url(let rhsURL)):
            return lhsURL == rhsURL
        default:
            return false
        }
    }
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
    
    var asURL: URL? {
        switch self {
        case .url(let value):
            value
        default:
            nil
        }
    }
    
    var asSchemeDirectory: SchemeDirectory? {
        switch self {
        case .schemeDirectory(let value):
            return value
        default:
            return nil
        }
    }
    
    var asFontFamiliesContainer: FontFamiliesContainer? {
        switch self {
        case .value(let fontFamily):
            return fontFamily as? FontFamiliesContainer
        default:
            return nil
        }
    }
    
    var asScheme: Scheme? {
        switch self {
        case .value(let scheme):
            return scheme as? Scheme
        default:
            return nil
        }
    }
}
