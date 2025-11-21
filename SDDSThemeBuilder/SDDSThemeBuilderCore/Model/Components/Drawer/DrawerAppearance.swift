import Foundation

struct DrawerAppearance: CodeGenerationAppearance {
    typealias Variation = DrawerConfiguration.Variation
    typealias Props = DrawerProps
    
    var backgroundColor: String?
    var closeColor: String?
    var closeIcon: String?
    var shadow: String?
    
    init(variation: DrawerConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: DrawerProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.closeColor = ColorTokenContextBuilder(props.closeColor).context
        self.closeIcon = ImageContextBuilder(props.closeIcon?.value).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
    }
}

