import Foundation

struct WheelAppearance: CodeGenerationAppearance {
    typealias Variation = WheelConfiguration.Variation
    typealias Props = WheelProps
    
    // Цвета текста
    var itemTextColor: String?
    var itemTextAfterColor: String?
    var descriptionColor: String?
    
    // Цвета иконок управления
    var controlIconUpColor: String?
    var controlIconDownColor: String?
    
    // Цвет разделителя
    var separatorColor: String?
    
    // Типографика
    var itemTextTypography: String?
    var itemTextAfterTypography: String?
    var descriptionTypography: String?
    
    // Иконки
    var controlIconUp: String?
    var controlIconDown: String?
    
    // Вложенный компонент
    var dividerAppearance: String?
    
    init(variation: WheelConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: WheelProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        // Цвета текста (без состояний)
        self.itemTextColor = ColorTokenContextBuilder(props.itemTextColor).context
        self.itemTextAfterColor = ColorTokenContextBuilder(props.itemTextAfterColor).context
        self.descriptionColor = ColorTokenContextBuilder(props.descriptionColor).context
        
        // Цвета иконок управления (с состоянием focused)
        self.controlIconUpColor = ButtonColorContextBuilder(
            defaultColor: props.controlIconUpColor,
            highlightedColor: nil,
            hoveredColor: nil,
            selectedColor: props.controlIconUpColor?.value(for: [.focused])
        ).context
        
        self.controlIconDownColor = ButtonColorContextBuilder(
            defaultColor: props.controlIconDownColor,
            highlightedColor: nil,
            hoveredColor: nil,
            selectedColor: props.controlIconDownColor?.value(for: [.focused])
        ).context
        
        // Цвет разделителя
        self.separatorColor = ColorTokenContextBuilder(props.separatorColor).context
        
        // Типографика
        self.itemTextTypography = TypographyTokenContextBuilder(
            string: props.itemTextStyle?.value,
            id: id,
            component: component
        ).context
        
        self.itemTextAfterTypography = TypographyTokenContextBuilder(
            string: props.itemTextAfterStyle?.value,
            id: id,
            component: component
        ).context
        
        self.descriptionTypography = TypographyTokenContextBuilder(
            string: props.descriptionStyle?.value,
            id: id,
            component: component
        ).context
        
        // Иконки
        self.controlIconUp = ImageContextBuilder(props.controlIconUp?.value).context
        self.controlIconDown = ImageContextBuilder(props.controlIconDown?.value).context
        
        // Вложенный компонент divider
        if let dividerStyle = props.dividerStyle?.value {
            self.dividerAppearance = ComponentStyleContextBuilder(dividerStyle).context
        }
    }
}
