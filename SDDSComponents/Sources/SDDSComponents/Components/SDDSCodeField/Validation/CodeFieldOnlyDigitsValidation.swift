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
        
        let slotCount = groups.map(\.count).reduce(UInt(0), +)
        guard UInt(value.count) == slotCount else {
            return .success(.next)
        }
        return value == code ? .success(.validated) : .failure(.invalidCode)
    }
}
