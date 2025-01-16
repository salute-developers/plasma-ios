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

extension Command {
    func generate(renderer: Renderable, input: CodeGenerationInput, outputURL: URL, fileWriter: FileWriter) -> CommandResult {
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(input.configuration) else {
            return .error(GeneralError.decoding)
        }
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            return .error(GeneralError.decoding)
        }
        
        let result = renderer.render(context: jsonDictionary, template: input.template, removeLines: false)
        
        guard let generatedContent = result.asGenerated else {
            return result
        }
        
        let filename: String
        if let component = input.component {
            filename = input.template.generatedFileName(component: component)
        } else {
            filename = input.template.rawValue + ".swift"
        }
        let saveResult = fileWriter.saveFile(content: generatedContent, outputURL: outputURL, filename: filename)
        
        if saveResult.isError {
            return saveResult
        }
        
        return .success
    }
    
    func generate(renderer: Renderable, inputs: [CodeGenerationInput], outputURL: URL, fileWriter: FileWriter) -> CommandResult {
        for input in inputs {
            let result = generate(renderer: renderer, input: input, outputURL: outputURL, fileWriter: fileWriter)
            guard result == .success else {
                return result
            }
        }
                
        return .success
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
