import Foundation

final class GeneralContextBuilder: ContexBuilder, SchemeTokenNameValidator {
    let kind: TokenKind
    let metaScheme: Scheme
    
    init(kind: TokenKind, metaScheme: Scheme) {
        self.kind = kind
        self.metaScheme = metaScheme
    }
    
    func didReceiveContext(dictionary: [String : Any]) throws {
        for key in dictionary.keys {
            try validateTokenName(key, kind, scheme: metaScheme)
        }
    }
}
