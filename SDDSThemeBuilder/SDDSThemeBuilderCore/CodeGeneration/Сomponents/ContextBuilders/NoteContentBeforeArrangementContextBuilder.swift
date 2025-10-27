import Foundation

// swiftlint:disable type_name
final class NoteContentBeforeArrangementContextBuilder: CodeGenerationContextBuilder {
// swiftlint:enable type_name
    enum VariationId: String {
        case top
        case center
    }
    
    let id: String?
    let component: CodeGenerationComponent
    
    init(id: String?, component: CodeGenerationComponent) {
        self.id = id
        self.component = component
    }
    
    var context: String? {
        let type = "\(component.rawValue)ContentBeforeArrangement"
        guard let id = id?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        
        switch variationId {
        case .top:
            return "\(type).top"
        case .center:
            return "\(type).center"
        }
    }
    
    static var defaultContext: String {
        return "NoteContentBeforeArrangement.top"
    }
}


