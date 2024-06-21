import Foundation

protocol SchemeTokenNameValidator: AnyObject {
    func validateTokenName(_ key: String, _ kind: TokenKind, scheme: Scheme) throws
}

extension SchemeTokenNameValidator {
    func validateTokenName(_ key: String, _ kind: TokenKind, scheme: Scheme) throws {
        let tokens = scheme.tokens.filter { $0.name == key && $0.type == kind }
        guard !tokens.isEmpty else {
            return try SchemeValidationLogger.printText("token \(key) is missing in meta scheme")
        }
        guard tokens.count == 1 else {
            return try SchemeValidationLogger.printText("invalid number of tokens with name \(key)")
        }
    }
}
