import Foundation

final class NotificationContentButtonLayoutContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case stretch = "stretch"
        case normal = "normal"
    }
    
    let id: String?
    let component: CodeGenerationComponent
    
    init(id: String?, component: CodeGenerationComponent) {
        self.id = id
        self.component = component
    }
    
    var context: String? {
        let type = "\(component.rawValue)ButtonLayout"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        switch variationId {
        case .stretch:
            return "\(type).stretch"
        case .normal:
            return "\(type).normal"
        }
    }
    
    static var defaultContext: String {
        return "NotificationContentButtonLayout.normal"
    }
}
