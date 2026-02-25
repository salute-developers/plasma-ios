import Foundation

struct ListItemAppearance: CodeGenerationAppearance {
    typealias Variation = ListItemConfiguration.Variation
    typealias Props = ListItemProps
    
    var labelTypography: String?
    var titleTypography: String?
    var subtitleTypography: String?
    var labelColor: String?
    var titleColor: String?
    var subtitleColor: String?
    var disclosureIconColor: String?
    var disclosureIcon: String?
    var backgroundColor: String?
    var disabledAlpha: String?
    var counterAppearance: String?
    
    init(variation: ListItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ListItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.subtitleStyle?.value, id: id, component: component).context
        self.labelColor = ColorTokenContextBuilder(props.labelColor).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.subtitleColor = ColorTokenContextBuilder(props.subtitleColor).context
        self.disclosureIconColor = ColorTokenContextBuilder(props.disclosureIconColor).context
        self.disclosureIcon = ImageContextBuilder(props.disclosureIcon?.value).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered])
        ).context
        
        if let counterStyle = props.counterStyle?.value {
            self.counterAppearance = ComponentStyleContextBuilder(counterStyle).context
        }
    }
} 