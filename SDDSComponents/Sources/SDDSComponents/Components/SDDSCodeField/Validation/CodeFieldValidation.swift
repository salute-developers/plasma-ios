import Foundation

public typealias CodeFieldValidationResult = Result<CodeFieldValidationState, CodeFieldValidationError>

public enum CodeFieldValidationState {
    case initial
    case next
    case validated
}

public enum CodeFieldValidationError: Error {
    case inputFailed
    case invalidCode
}

public protocol CodeFieldValidation {
    func validate(value: String, nextSymbol: Character) -> CodeFieldValidationResult
}
