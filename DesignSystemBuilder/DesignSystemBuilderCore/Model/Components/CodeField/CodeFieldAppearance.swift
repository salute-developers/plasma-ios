import Foundation

struct CodeFieldAppearance: CodeGenerationAppearance {
    typealias Variation = CodeFieldConfiguration.Variation
    typealias Props = CodeFieldProps
    
    var valueColor: String? = nil
    var captionColor: String? = nil
    var dotColor: String? = nil
    var cursorColor: String? = nil
    var backgroundColor: String? = nil
    var captionTypography: String? = nil
    var valueTypography: String? = nil
    
    init(variation: CodeFieldConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CodeFieldProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.valueColor = StatefulFillStyleContextBuilder(props.valueColor).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.captionColor = StatefulFillStyleContextBuilder(props.captionColor).context
        self.dotColor = StatefulFillStyleContextBuilder(props.dotColor).context
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
        self.valueTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
    }
} 
