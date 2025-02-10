import Foundation

final class LabelPlacementContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case innerLabel = "inner-label"
        case outerLabel = "outer-label"
    }
    
    let id: String?
    let component: CodeGenerationComponent
    
    init(id: String?, component: CodeGenerationComponent) {
        self.id = id
        self.component = component
    }
    
    var context: String? {
        let type = "\(component.rawValue)LabelPlacement"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        switch variationId {
        case .innerLabel:
            return "\(type).inner"
        case .outerLabel:
            return "\(type).outer"
        }
    }
}
