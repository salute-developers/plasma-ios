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
        
        // Цвета с состояниями
        self.labelColor = ButtonColorContextBuilder(statefulColor: props.labelColor).context
        self.valueColor = ButtonColorContextBuilder(statefulColor: props.valueColor).context
        self.startContentColor = ButtonColorContextBuilder(statefulColor: props.startContentColor).context
        self.endContentColor = ButtonColorContextBuilder(statefulColor: props.endContentColor).context
        self.actionColor = ButtonColorContextBuilder(statefulColor: props.actionColor).context
        
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
