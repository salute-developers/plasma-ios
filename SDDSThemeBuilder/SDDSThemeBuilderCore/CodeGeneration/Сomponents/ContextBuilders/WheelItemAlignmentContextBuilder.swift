import Foundation

final class WheelItemAlignmentContextBuilder: CodeGenerationContextBuilder {
    enum VariationId: String {
        case start
        case center
        case end
        case mixed
    }
    
    let props: String?
    let component: CodeGenerationComponent
    
    init(props: String?, component: CodeGenerationComponent) {
        self.props = props
        self.component = component
    }
    
    var context: String? {
        let type = "\(component.rawValue)ItemAlignment"
        guard let id = props?.lastKey, let variationId = VariationId(rawValue: id) else {
            return nil
        }
        
        switch variationId {
        case .start:
            return "\(type).start"
        case .center:
            return "\(type).center"
        case .end:
            return "\(type).end"
        case .mixed:
            return "\(type).mixed"
        }
    }
    
    static var defaultContext: String {
        return "WheelItemAlignment.start"
    }
}
