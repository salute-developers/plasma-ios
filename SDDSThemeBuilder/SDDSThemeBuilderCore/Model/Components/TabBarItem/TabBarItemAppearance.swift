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
        
        self.labelColor = ButtonColorContextBuilder(
            defaultColor: props.labelColor,
            highlightedColor: nil,
            hoveredColor: nil,
            selectedColor: props.labelColor?.value(for: [.selected])
        ).context
        self.iconColor = ButtonColorContextBuilder(
            defaultColor: props.iconColor,
            highlightedColor: nil,
            hoveredColor: nil,
            selectedColor: props.iconColor?.value(for: [.selected])
        ).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: nil,
            hoveredColor: nil,
            selectedColor: props.backgroundColor?.value(for: [.selected])
        ).context
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        
        if let counterStyle = props.counterStyle?.value {
            self.counterAppearance = ComponentStyleContextBuilder(counterStyle).context
        }
        
        if let indicatorStyle = props.indicatorStyle?.value {
            self.indicatorAppearance = ComponentStyleContextBuilder(indicatorStyle).context
        }
    }
}
