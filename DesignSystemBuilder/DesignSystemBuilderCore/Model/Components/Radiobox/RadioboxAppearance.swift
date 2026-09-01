import Foundation

struct RadioboxAppearance: CodeGenerationAppearance {
    typealias Variation = RadioboxConfiguration.Variation
    typealias Props = RadioboxProps
    
    var toggleColor: String? = nil
    var borderColor: String? = nil
    var titleTypography: String? = nil
    var titleColor: String? = nil
    var subtitleTypography: String? = nil
    var subtitleColor: String? = nil
    var toggleColorChecked: String? = nil
    var checkedIconColor: String? = nil
    var toggleIndeterminateIconColor: String? = nil
    var disabledAlpha: String? = nil
    
    init(variation: RadioboxConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: RadioboxProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.toggleColorChecked = StatefulFillStyleContextBuilder(props.toggleIconColor, hasDefault: true).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.descriptionStyle?.value, id: id, component: component).context
        self.toggleColor = StatefulFillStyleContextBuilder(props.toggleColor, hasDefault: true).context
        self.borderColor = StatefulFillStyleContextBuilder(props.toggleBorderColor, hasDefault: true).context
        self.titleColor = StatefulFillStyleContextBuilder(props.labelColor, hasDefault: true).context
        self.subtitleColor = StatefulFillStyleContextBuilder(props.descriptionColor, hasDefault: true).context
        self.checkedIconColor = StatefulFillStyleContextBuilder(props.toggleIconColor, hasDefault: true).context
        self.toggleIndeterminateIconColor = StatefulFillStyleContextBuilder(props.toggleIndeterminateIconColor, hasDefault: true).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
    }
}
