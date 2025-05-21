import Foundation

final class ShadowTokenContextBuilder: CodeGenerationContextBuilder {
    let shadow: ShadowKeyValue?
    
    init(shadow: ShadowKeyValue?) {
        self.shadow = shadow
    }
    
    var context: String? {
        guard let shadow = shadow, let value = shadow.value else {
            return nil
        }
        
        return "ShadowToken.\(value.camelCase)"
    }
}
