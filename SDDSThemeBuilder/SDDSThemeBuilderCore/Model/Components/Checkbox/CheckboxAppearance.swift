import Foundation

struct CheckboxAppearance: CodeGenerationAppearance {
    typealias Variation = CheckboxConfiguration.Variation
    typealias Props = CheckboxProps
    
    var toggleColor: String? = nil
    var borderColor: String? = nil
    var titleTypography: String? = nil
    var titleColor: String? = nil
    var subtitleTypography: String? = nil
    var subtitleColor: String? = nil
    var toggleColorChecked: String? = nil
    var toggleColorIndeterminate: String? = nil
    var toggleIndeterminateColor: String? = nil
    var disabledAlpha: String? = nil
    
    init(variation: CheckboxConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CheckboxProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.descriptionStyle?.value, id: id, component: component).context
        self.toggleColor = ColorTokenContextBuilder(props.toggleColor?.value(for: [.checked])).context
        self.borderColor = ColorTokenContextBuilder(props.toggleBorderColor).context
        self.titleColor = ColorTokenContextBuilder(props.labelColor).context
        self.subtitleColor = ColorTokenContextBuilder(props.descriptionColor).context
        self.toggleColorChecked = ColorTokenContextBuilder(props.toggleIconColor).context
        self.toggleColorIndeterminate = ColorTokenContextBuilder(props.toggleIconColor).context
        self.toggleIndeterminateColor = ColorTokenContextBuilder(props.toggleIndeterminateIconColor?.value(for: [.indeterminate])).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
    }
}
