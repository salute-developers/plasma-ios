import Foundation

public enum CodeFieldValidationState {
    case next
    case finished
}

public protocol CodeFieldValidation {
    func validate(value: String, nextSymbol: Character) -> Bool
}

public final class CodeFieldOnlyDigitsValidation: CodeFieldValidation {
    public init() {}
    
    public func validate(value: String, nextSymbol: Character) -> Bool {
        return nextSymbol.isNumber
    }
}

public final class CodeFieldDisabledValidation: CodeFieldValidation {
    public init() {}
    
    public func validate(value: String, nextSymbol: Character) -> Bool {
        return true
    }
}
