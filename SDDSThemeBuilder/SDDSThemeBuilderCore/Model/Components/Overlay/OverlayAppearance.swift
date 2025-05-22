import Foundation

struct OverlayAppearance: CodeGenerationAppearance {
    typealias Variation = OverlayConfiguration.Variation
    typealias Props = OverlayProps
    
    var blurRadius: String?
    var backgroundColor: String?
    
    init(variation: OverlayConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: OverlayProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.blurRadius = CGFloatContextBuilder(props.blurRadius?.value, nullify: true).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor, hasDefault: true).context
    }
}
