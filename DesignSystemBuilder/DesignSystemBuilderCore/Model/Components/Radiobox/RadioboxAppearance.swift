import Foundation

struct RadioboxAppearance: CodeGenerationAppearance {
    typealias Variation = RadioboxConfiguration.Variation
    typealias Props = RadioboxProps

    var toggleColor: String?
    var borderColor: String?
    var titleTypography: String?
    var titleColor: String?
    var subtitleTypography: String?
    var subtitleColor: String?
    var toggleColorChecked: String?
    var checkedIconColor: String?
    var toggleIndeterminateIconColor: String?
    var disabledAlpha: String?

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
