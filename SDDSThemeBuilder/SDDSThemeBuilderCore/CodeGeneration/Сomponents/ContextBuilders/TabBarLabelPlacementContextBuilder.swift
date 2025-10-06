import Foundation

final class TabBarLabelPlacementContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case bottom = "bottom"
        case none = "none"
        case top = "top"
    }
    
    let id: String?
    let component: CodeGenerationComponent
    
    init(id: String?, component: CodeGenerationComponent) {
        self.id = id
        self.component = component
    }
    
    var context: String? {
        let type = "TabBarItemLabelPlacement"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        switch variationId {
        case .bottom:
            return "\(type).bottom"
        case .none:
            return "\(type).none"
        case .top:
            return "\(type).top"
        }
    }
    
    static var defaultContext: String {
        return "TabBarItemLabelPlacement.none"
    }
}
