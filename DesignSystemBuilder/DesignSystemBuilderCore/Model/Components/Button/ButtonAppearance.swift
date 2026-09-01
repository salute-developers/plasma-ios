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
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor, hasDefault: true).context
        self.spinnerColor = StatefulFillStyleContextBuilder(props.spinnerColor, hasDefault: true).context
        self.iconColor = StatefulFillStyleContextBuilder(props.iconColor, hasDefault: true).context
        self.titleColor = StatefulFillStyleContextBuilder(props.labelColor, hasDefault: true).context
        self.subtitleColor = StatefulFillStyleContextBuilder(props.valueColor, hasDefault: true).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
