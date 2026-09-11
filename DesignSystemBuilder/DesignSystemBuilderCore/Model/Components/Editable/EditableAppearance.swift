import Foundation

struct EditableAppearance: CodeGenerationAppearance {
    typealias Variation = EditableConfiguration.Variation
    typealias Props = EditableProps
    
    var textColor: String?
    var iconColor: String?
    var cursorColor: String?
    var disabledAlpha: Double?
    var textTypography: String?
    
    init(variation: EditableConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: EditableProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.textColor = StatefulFillStyleContextBuilder(props.textColor).context
        self.iconColor = StatefulFillStyleContextBuilder(props.iconColor).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.disabledAlpha = props.disableAlpha?.value
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
    }
}
