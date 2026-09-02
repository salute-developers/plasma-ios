import Foundation

final class DrawerCloseIconPlacementContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case inner = "inner"
        case none = "none"
        case outer = "outer"
    }
    
    let id: String?
    let component: CodeGenerationComponent
    
    init(id: String?, component: CodeGenerationComponent) {
        self.id = id
        self.component = component
    }
    
    var context: String? {
        let type = "DrawerCloseIconPlacement"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        return "\(type).\(variationId.rawValue)"
    }
    
    static var defaultContext: String {
        return "DrawerCloseIconPlacement.none"
    }
}

