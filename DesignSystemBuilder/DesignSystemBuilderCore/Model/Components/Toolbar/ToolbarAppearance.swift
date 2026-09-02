import Foundation

struct ToolbarAppearance: CodeGenerationAppearance {
    typealias Variation = ToolbarConfiguration.Variation
    typealias Props = ToolbarProps
    
    var backgroundColor: String?
    var shadow: String?
    var dividerAppearance: String?
    
    init(variation: ToolbarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ToolbarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
        
        if let dividerStyle = props.dividerStyle?.value {
            self.dividerAppearance = ComponentStyleContextBuilder(dividerStyle).context
        }
    }
}
