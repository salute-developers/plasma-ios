import Foundation

struct PopoverAppearance: CodeGenerationAppearance {
    typealias Variation = PopoverConfiguration.Variation
    typealias Props = PopoverProps
    
    var backgroundColor: String?
    var shadow: String?
    
    init(variation: PopoverConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: PopoverProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
    }
}
