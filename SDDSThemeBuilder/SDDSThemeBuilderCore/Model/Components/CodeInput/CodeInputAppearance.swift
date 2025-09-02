import Foundation

struct CodeInputAppearance: CodeGenerationAppearance {
    typealias Variation = CodeInputConfiguration.Variation
    typealias Props = CodeInputProps
    
    var codeColor: String?
    var codeColorError: String?
    var captionColor: String?
    var captionColorError: String?
    var strokeColor: String?
    var strokeColorError: String?
    var strokeColorFocused: String?
    var fillColor: String?
    var fillColorError: String?
    var codeTypography: String?
    var captionTypography: String?
    
    init(variation: CodeInputConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CodeInputProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.codeColor = ColorTokenContextBuilder(props.codeColor).context
        self.codeColorError = ColorTokenContextBuilder(props.codeColor?.value(for: [.error])).context
        self.captionColor = ColorTokenContextBuilder(props.captionColor).context
        self.captionColorError = ColorTokenContextBuilder(props.captionColor?.value(for: [.error])).context
        self.strokeColor = ColorTokenContextBuilder(props.strokeColor).context
        self.strokeColorError = ColorTokenContextBuilder(props.strokeColor?.value(for: [.error])).context
        self.strokeColorFocused = ColorTokenContextBuilder(props.strokeColor?.value(for: [.focused])).context
        self.fillColor = ColorTokenContextBuilder(props.fillColor).context
        self.fillColorError = ColorTokenContextBuilder(props.fillColorError).context
        self.codeTypography = TypographyTokenContextBuilder(string: props.codeStyle?.value, id: id, component: component).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
    }
}
