import Foundation

public final class CodeFieldDisabledValidation: CodeFieldValidation {
    public init() {}
    
    public func validate(value: String, nextSymbol: Character) -> CodeFieldValidationResult {
        return .success(.next)
    }
}
