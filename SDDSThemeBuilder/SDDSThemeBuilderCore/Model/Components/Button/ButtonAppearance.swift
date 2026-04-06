import Foundation

struct ButtonAppearance: CodeGenerationAppearance {
    typealias Variation = ButtonConfiguration.Variation
    typealias Props = ButtonProps
    
    var loadingAlpha: String? = nil
    var disabledAlpha: String? = nil
    var backgroundColor: String? = nil
    var spinnerColor: String? = nil
    var iconColor: String? = nil
    var subtitleColor: String? = nil
    var titleColor: String? = nil
    var titleTypography: String? = nil
    var subtitleTypography: String? = nil
    
    init(variation: ButtonConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ButtonProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.loadingAlpha = CGFloatContextBuilder(props.loadingAlpha?.value, nullify: true).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = ButtonColorContextBuilder(statefulColor: props.backgroundColor).context
        self.spinnerColor = ButtonColorContextBuilder(statefulColor: props.spinnerColor).context
        self.iconColor = ButtonColorContextBuilder(statefulColor: props.iconColor).context
        self.titleColor = ButtonColorContextBuilder(statefulColor: props.labelColor).context
        self.subtitleColor = ButtonColorContextBuilder(statefulColor: props.valueColor).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
