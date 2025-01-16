import Foundation

final class NextContextBuilder: CodeGenerationContextBuilder {
    let nextVariation: String?
    let currentVariation: String
    let component: String
    let appearance: String
    
    init(nextVariation: String?, currentVariation: String, component: String, appearance: String) {
        self.nextVariation = nextVariation
        self.currentVariation = currentVariation
        self.component = component
        self.appearance = appearance
    }
    
    var context: String? {
        if let nextVariation = nextVariation {
            return "GeneralAppearanceVariation<\(component), \(appearance), \(component)Variation.\(nextVariation)>"
        } else {
            return "ComponentAppearanceVariation<\(component), \(appearance)>"
        }
    }
}
