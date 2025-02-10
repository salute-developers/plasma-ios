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
        let sizeString: String
        if id == id?.baseKey {
            sizeString = id ?? oneSizeString
        } else {
            sizeString = oneSizeString
        }
        return "\(component.rawValue)Typography(\(sizeString): Typographies.\(string.camelCase).typography).asContainer"
        
    }
}
