import Foundation

struct SelectItemAppearance: CodeGenerationAppearance {
    typealias Variation = SelectItemConfiguration.Variation
    typealias Props = SelectItemProps
    
    var itemType: String?
    var iconColor: String?
    var backgroundColor: String?
    var disabledAlpha: String?
    var cellAppearance: String?
    var checkboxAppearance: String?
    var icon: String?
    
    init(variation: SelectItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SelectItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.itemType = props.itemType?.value.map { ".\($0)" }
        self.iconColor = ColorTokenContextBuilder(props.iconColor).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered])
        ).context
        
        if let cellStyle = props.cellStyle?.value {
            self.cellAppearance = ComponentStyleContextBuilder(cellStyle).context
        }
        
        if let checkboxStyle = props.checkboxStyle?.value {
            self.checkboxAppearance = ComponentStyleContextBuilder(checkboxStyle).context
        }
        
        self.icon = ImageContextBuilder(props.icon?.value).context
    }
}

