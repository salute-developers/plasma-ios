import Foundation

final class PaginationDotsOrientationContextBuilder: CodeGenerationContextBuilder {
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
        let type = "PaginationDotsOrientation"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nullify ? nil : PaginationDotsOrientationContextBuilder.defaultContext
        }
        
        switch variationId {
        case .vertical:
            return "\(type).vertical"
        case .horizontal:
            return "\(type).horizontal"
        }
    }
    
    static var defaultContext: String {
        "PaginationDotsOrientation.horizontal"
    }
}
