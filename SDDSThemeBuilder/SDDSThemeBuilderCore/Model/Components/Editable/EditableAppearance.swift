import Foundation

struct EditableAppearance: CodeGenerationAppearance {
    typealias Variation = EditableConfiguration.Variation
    typealias Props = EditableProps
    
    var textColorDefault: String?
    var textColorReadonly: String?
    var iconColorDefault: String?
    var iconColorReadonly: String?
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
        
        self.textColorDefault = ColorTokenContextBuilder(props.textColor).context
        self.textColorReadonly = ColorTokenContextBuilder(props.textColor?.value(for: [.readonly])).context
        self.iconColorDefault = ColorTokenContextBuilder(props.iconColor).context
        self.iconColorReadonly = ColorTokenContextBuilder(props.iconColor?.value(for: [.readonly])).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.disabledAlpha = props.disableAlpha?.value
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
    }
}
