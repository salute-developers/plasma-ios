import Foundation

public final class CodeFieldOnlyDigitsValidation: CodeFieldValidation {
    private let code: String
    private let groups: [CodeFieldGroup]
    
    public init(code: String, groups: [CodeFieldGroup]) {
        self.code = code
        self.groups = groups
    }
    
    public func validate(value: String, nextSymbol: Character) -> CodeFieldValidationResult {
        guard nextSymbol.isNumber else {
            return .failure(.inputFailed)
        }
        
        let count = groups.map { $0.count }.reduce(0, +)
        guard count == value.count else {
            return .success(.next)
        }
        
        if value == code {
            return .success(.validated)
        } else {
            return .failure(.invalidCode)
        }
    }
}
