import Foundation

struct TabsDefaultAppearance: CodeGenerationAppearance {
    typealias Variation = TabsDefaultConfiguration.Variation
    typealias Props = TabsDefaultProps
    
    static let appearance = "TabsAppearance"
    
    var disclosureColor: String?
    var indicatorColor: String?
    var overflowNextIcon: String?
    var overflowNextIconColor: String?
    var overflowPrevIcon: String?
    var overflowPrevIconColor: String?
    var dividerAppearance: String?
    var tabItemAppearance: String?
    var dropdownMenuAppearance: String?
    var disclosureTextTypography: String?
    var disclosureIcon: String?
    
    init(variation: TabsDefaultConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TabsDefaultProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        // Цвета с состояниями
        self.disclosureColor = ButtonColorContextBuilder(
            defaultColor: props.disclosureColor,
            highlightedColor: props.disclosureColor?.value(for: [.pressed]),
            hoveredColor: props.disclosureColor?.value(for: [.hovered]),
            selectedColor: nil
        ).context
        
        // Простые цвета
        self.indicatorColor = ColorTokenContextBuilder(props.indicatorColor).context
        self.overflowNextIconColor = ColorTokenContextBuilder(props.overflowNextIconColor).context
        self.overflowPrevIconColor = ColorTokenContextBuilder(props.overflowPrevIconColor).context
        
        // Иконки
        self.overflowNextIcon = ImageContextBuilder(props.overflowNextIcon?.value).context
        self.overflowPrevIcon = ImageContextBuilder(props.overflowPrevIcon?.value).context
        self.disclosureIcon = ImageContextBuilder(props.disclosureIcon?.value).context
        
        // Типографика
        self.disclosureTextTypography = TypographyTokenContextBuilder(string: props.disclosureTextStyle?.value, id: id, component: component).context
        
        // Вложенные компоненты
        if let dividerStyle = props.dividerStyle?.value {
            self.dividerAppearance = ComponentStyleContextBuilder(dividerStyle).context
        }
        
        if let tabItemStyle = props.tabItemStyle?.value {
            self.tabItemAppearance = ComponentStyleContextBuilder(tabItemStyle).context
        }
        
        if let dropdownMenuStyle = props.dropdownMenuStyle?.value {
            self.dropdownMenuAppearance = ComponentStyleContextBuilder(dropdownMenuStyle).context
        }
    }
}
