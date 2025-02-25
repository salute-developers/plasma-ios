import Foundation

struct BadgeAppearance: CodeGenerationAppearance {
    typealias Variation = BadgeConfiguration.Variation
    typealias Props = BadgeProps
    
    var backgroundColor: String? = nil
    var startContentColor: String? = nil
    var endContentColor: String? = nil
    var labelColor: String? = nil
    var labelTypography: String? = nil
    
    init(variation: BadgeConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: BadgeProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.startContentColor = ColorTokenContextBuilder(props.startContentColor).context
        self.endContentColor = ColorTokenContextBuilder(props.endContentColor).context
        self.labelColor = ColorTokenContextBuilder(props.labelColor).context
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
