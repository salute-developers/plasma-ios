import Foundation

struct CodeFieldAppearance: CodeGenerationAppearance {
    typealias Variation = CodeFieldConfiguration.Variation
    typealias Props = CodeFieldProps
    
    var valueColor: String? = nil
    var valueColorError: String? = nil
    var captionColor: String? = nil
    var captionColorError: String? = nil
    var cursorColor: String? = nil
    var backgroundColor: String? = nil
    var backgroundColorActivated: String? = nil
    var backgroundColorError: String? = nil
    var captionTypography: String? = nil
    var valueTypography: String? = nil
    
    init(variation: CodeFieldConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CodeFieldProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.valueColor = ColorTokenContextBuilder(props.valueColor).context
        self.valueColorError = ColorTokenContextBuilder(props.valueColor?.value(for: [.error])).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.captionColor = ColorTokenContextBuilder(props.captionColor).context
        self.captionColorError = ColorTokenContextBuilder(props.captionColor?.value(for: [.error])).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.backgroundColorActivated = ColorTokenContextBuilder(props.backgroundColor?.value(for: [.activated])).context
        self.backgroundColorError = ColorTokenContextBuilder(props.backgroundColor?.value(for: [.error])).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
        self.valueTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
    }
} 
