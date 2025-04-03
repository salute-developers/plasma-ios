import Foundation

struct RadioboxAppearance: CodeGenerationAppearance {
    typealias Variation = RadioboxConfiguration.Variation
    typealias Props = RadioboxProps
    
    var toggleColor: String? = nil
    var toggleBorderColor: String? = nil
    var titleTypography: String? = nil
    var titleColor: String? = nil
    var subtitleTypography: String? = nil
    var subtitleColor: String? = nil
    var checkedIconColor: String? = nil
    
    init(variation: RadioboxConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: RadioboxProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.descriptionStyle?.value, id: id, component: component).context
        self.toggleColor = SelectionControContextBuilder(
            defaultColor: props.toggleColor,
            checkedColor: props.toggleColor?.value(for: [.checked])
        ).context
        self.toggleBorderColor = SelectionControContextBuilder(
            defaultColor: props.toggleBorderColor,
            checkedColor: props.toggleBorderColor?.value(for: [.checked])
        ).context
        self.titleColor = ColorTokenContextBuilder(props.labelColor).context
        self.subtitleColor = ColorTokenContextBuilder(props.descriptionColor).context
        self.checkedIconColor = ColorTokenContextBuilder(props.toggleIconColor).context
    }
}
