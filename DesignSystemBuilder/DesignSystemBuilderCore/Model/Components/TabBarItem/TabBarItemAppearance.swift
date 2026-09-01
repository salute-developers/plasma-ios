import Foundation

struct TabBarItemAppearance: CodeGenerationAppearance {
    typealias Variation = TabBarItemConfiguration.Variation
    typealias Props = TabBarItemProps
    
    var labelColor: String?
    var iconColor: String?
    var backgroundColor: String?
    var labelTypography: String?
    var counterAppearance: String?
    var indicatorAppearance: String?
    
    init(variation: TabBarItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TabBarItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.labelColor = ButtonColorContextBuilder(statefulColor: props.labelColor).context
        self.iconColor = ButtonColorContextBuilder(statefulColor: props.iconColor).context
        self.backgroundColor = ButtonColorContextBuilder(statefulColor: props.backgroundColor).context
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        
        if let counterStyle = props.counterStyle?.value {
            self.counterAppearance = ComponentStyleContextBuilder(counterStyle).context
        }
        
        if let indicatorStyle = props.indicatorStyle?.value {
            self.indicatorAppearance = ComponentStyleContextBuilder(indicatorStyle).context
        }
    }
}
