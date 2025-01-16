import Foundation

final class TypographyTokenContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    let sizeKey: String?
    
    init(_ string: String?, _ sizeKey: String?) {
        self.string = string
        self.sizeKey = sizeKey
    }
    
    var context: String? {
        guard let string = string else {
            return nil
        }
        let sizeString = sizeKey ?? "oneSize"
        return "TextFieldTypography(\(sizeString): Typographies.\(string.camelCase).typography).asContainer"
        
    }
}
