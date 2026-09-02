import Foundation

struct CodeInputAppearance: CodeGenerationAppearance {
    typealias Variation = CodeInputConfiguration.Variation
    typealias Props = CodeInputProps
    
    var codeColor: String?
    var captionColor: String?
    var strokeColor: String?
    var fillColor: String?
    var codeTypography: String?
    var captionTypography: String?
    
    init(variation: CodeInputConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CodeInputProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.codeColor = StatefulFillStyleContextBuilder(props.codeColor).context
        self.captionColor = StatefulFillStyleContextBuilder(props.captionColor).context
        self.strokeColor = StatefulFillStyleContextBuilder(props.strokeColor).context
        self.fillColor = StatefulFillStyleContextBuilder(props.fillColor).context
        self.codeTypography = TypographyTokenContextBuilder(string: props.codeStyle?.value, id: id, component: component).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
    }
}
