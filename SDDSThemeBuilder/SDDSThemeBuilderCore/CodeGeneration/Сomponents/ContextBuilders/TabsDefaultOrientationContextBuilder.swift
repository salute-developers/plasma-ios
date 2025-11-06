import Foundation

final class TabsDefaultOrientationContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case vertical
        case horizontal
    }
    
    let id: String?
    let component: CodeGenerationComponent
    let nullify: Bool
    
    init(id: String?, component: CodeGenerationComponent, nullify: Bool = false) {
        self.id = id
        self.component = component
        self.nullify = nullify
    }
    
    var context: String? {
        let type = "TabsOrientation"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nullify ? nil : TabsDefaultOrientationContextBuilder.defaultContext
        }
        
        switch variationId {
        case .vertical:
            return "\(type).vertical"
        case .horizontal:
            return "\(type).horizontal"
        }
    }
    
    static var defaultContext: String {
        return "TabsOrientation.horizontal"
    }
}
