import Foundation

protocol SchemeTokenNameValidator: AnyObject {
    func validateTokenName(_ key: String, _ kind: TokenKind, scheme: Scheme)
}

extension SchemeTokenNameValidator {
    func validateTokenName(_ key: String, _ kind: TokenKind, scheme: Scheme) {
        let tokens = scheme.tokens.filter { $0.name == key && $0.type == kind }
        guard !tokens.isEmpty else {
            SchemeValidationLogger.printText("token \(key) is missing in meta scheme")
            fatalError()
        }
        guard tokens.count == 1 else {
            SchemeValidationLogger.printText("invalid number of tokens with name \(key)")
            fatalError()
        }
    }
}
