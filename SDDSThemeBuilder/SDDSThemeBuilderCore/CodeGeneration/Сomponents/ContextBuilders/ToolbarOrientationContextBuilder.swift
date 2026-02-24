import Foundation

final class ToolbarOrientationContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case vertical
        case horizontal
    }
    
    let id: String?
    let nullify: Bool
    
    init(id: String?, nullify: Bool = false) {
        self.id = id
        self.nullify = nullify
    }
    
    var context: String? {
        let type = "TabsOrientation"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nullify ? nil : ToolbarOrientationContextBuilder.defaultContext
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
