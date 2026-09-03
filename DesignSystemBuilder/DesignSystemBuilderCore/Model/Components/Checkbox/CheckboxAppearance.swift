import Foundation

struct CheckboxAppearance: CodeGenerationAppearance {
    typealias Variation = CheckboxConfiguration.Variation
    typealias Props = CheckboxProps

    var toggleColor: String?
    var borderColor: String?
    var titleTypography: String?
    var titleColor: String?
    var subtitleTypography: String?
    var subtitleColor: String?
    var toggleColorChecked: String?
    var toggleColorIndeterminate: String?
    var toggleIndeterminateColor: String?
    var disabledAlpha: String?

    init(variation: CheckboxConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: CheckboxProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.descriptionStyle?.value, id: id, component: component).context
        self.toggleColor = StatefulFillStyleContextBuilder(props.toggleColor, hasDefault: true).context
        self.borderColor = StatefulFillStyleContextBuilder(props.toggleBorderColor, hasDefault: true).context
        self.titleColor = StatefulFillStyleContextBuilder(props.labelColor, hasDefault: true).context
        self.subtitleColor = StatefulFillStyleContextBuilder(props.descriptionColor, hasDefault: true).context
        self.toggleColorChecked = StatefulFillStyleContextBuilder(props.toggleIconColor, hasDefault: true).context
        self.toggleColorIndeterminate = StatefulFillStyleContextBuilder(props.toggleIconColor, hasDefault: true).context
        self.toggleIndeterminateColor = StatefulFillStyleContextBuilder(props.toggleIndeterminateIconColor, hasDefault: true).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
    }
}
