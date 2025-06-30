import Foundation

struct ListItemAppearance: CodeGenerationAppearance {
    typealias Variation = ListItemConfiguration.Variation
    typealias Props = ListItemProps
    
    var titleTypography: String?
    var titleColor: String?
    var disclosureIconColor: String?
    var disclosureIcon: String?
    var backgroundColor: String?
    
    init(variation: ListItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ListItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.disclosureIconColor = ColorTokenContextBuilder(props.disclosureIconColor).context
        self.disclosureIcon = ImageContextBuilder(props.disclosureIcon?.value).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered])
        ).context
    }
} 