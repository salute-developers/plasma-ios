import Foundation

final class TypographyTokenContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    let id: String?
    let component: CodeGenerationComponent
    
    init(string: String?, id: String?, component: CodeGenerationComponent) {
        self.string = string
        self.id = id
        self.component = component
    }
    
    var context: String? {
        guard let string = string else {
            return nil
        }
        let oneSizeString = "oneSize"
        var sizeString: String
        if id == id?.baseKey {
            sizeString = id ?? oneSizeString
            if sizeString.contains("-") {
                sizeString = sizeString.camelCase
            }
        } else {
            sizeString = oneSizeString
        }
        return "\(component.rawValue)Typography(\(sizeString): AdaptiveTypographyToken.\(string.camelCase).typography).asContainer"
        
    }
}
