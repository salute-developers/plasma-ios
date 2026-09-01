import Foundation

final class RequiredPlacementContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case requiredEnd = "required-end"
        case requiredStart = "required-start"
    }
    
    let id: String?
    let component: CodeGenerationComponent
    
    init(id: String?, component: CodeGenerationComponent) {
        self.id = id
        self.component = component
    }
    
    var context: String? {
        let type = "\(component.rawValue)RequiredPlacement"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        switch variationId {
        case .requiredStart:
            return "\(type).left"
        case .requiredEnd:
            return "\(type).right"
        }
    }
}
