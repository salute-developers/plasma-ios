import Foundation

struct TabItemDefaultAppearance: CodeGenerationAppearance {
    typealias Variation = TabItemDefaultConfiguration.Variation
    typealias Props = TabItemDefaultProps
    
    static let appearance = "TabItemAppearance"
    
    var labelColor: String?
    var valueColor: String?
    var startContentColor: String?
    var endContentColor: String?
    var actionColor: String?
    var labelTypography: String?
    var valueTypography: String?
    var counterAppearance: String?
    var actionIcon: String?
    
    init(variation: TabItemDefaultConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TabItemDefaultProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        // Цвета с состояниями (selected, hovered, pressed)
        self.labelColor = ButtonColorContextBuilder(
            defaultColor: props.labelColor,
            highlightedColor: props.labelColor?.value(for: [.pressed]),
            hoveredColor: props.labelColor?.value(for: [.hovered]),
            selectedColor: props.labelColor?.value(for: [.selected])
        ).context
        
        self.valueColor = ButtonColorContextBuilder(
            defaultColor: props.valueColor,
            highlightedColor: props.valueColor?.value(for: [.pressed]),
            hoveredColor: props.valueColor?.value(for: [.hovered]),
            selectedColor: props.valueColor?.value(for: [.selected])
        ).context
        
        self.startContentColor = ButtonColorContextBuilder(
            defaultColor: props.startContentColor,
            highlightedColor: props.startContentColor?.value(for: [.pressed]),
            hoveredColor: props.startContentColor?.value(for: [.hovered]),
            selectedColor: props.startContentColor?.value(for: [.selected])
        ).context
        
        self.endContentColor = ButtonColorContextBuilder(
            defaultColor: props.endContentColor,
            highlightedColor: props.endContentColor?.value(for: [.pressed]),
            hoveredColor: props.endContentColor?.value(for: [.hovered]),
            selectedColor: props.endContentColor?.value(for: [.selected])
        ).context
        
        self.actionColor = ButtonColorContextBuilder(
            defaultColor: props.actionColor,
            highlightedColor: props.actionColor?.value(for: [.pressed]),
            hoveredColor: props.actionColor?.value(for: [.hovered]),
            selectedColor: nil
        ).context
        
        // Типографика
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.valueTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        
        // Иконка
        self.actionIcon = ImageContextBuilder(props.actionIcon?.value).context
        
        // Вложенные компоненты
        if let counterStyle = props.counterStyle?.value {
            self.counterAppearance = ComponentStyleContextBuilder(counterStyle).context
        }
    }
}
