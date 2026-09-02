import Foundation

final class NotificationContentIconPlacementContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case top = "top"
        case start = "start"
    }
    
    let id: String?
    let component: CodeGenerationComponent
    
    init(id: String?, component: CodeGenerationComponent) {
        self.id = id
        self.component = component
    }
    
    var context: String? {
        let type = "\(component.rawValue)IconPlacement"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        switch variationId {
        case .top:
            return "\(type).top"
        case .start:
            return "\(type).start"
        }
    }
    
    static var defaultContext: String {
        return "NotificationContentIconPlacement.start"
    }
}
