import Foundation

struct CodeFieldAppearance: CodeGenerationAppearance {
    typealias Variation = CodeFieldConfiguration.Variation
    typealias Props = CodeFieldProps

    var valueColor: String?
    var valueColorError: String?
    var captionColor: String?
    var captionColorError: String?
    var dotColor: String?
    var dotColorError: String?
    var cursorColor: String?
    var backgroundColor: String?
    var backgroundColorActivated: String?
    var backgroundColorError: String?
    var captionTypography: String?
    var valueTypography: String?

    init(variation: CodeFieldConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: CodeFieldProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }

        self.valueColor = ColorTokenContextBuilder(props.valueColor).context
        self.valueColorError = ColorTokenContextBuilder(props.valueColor?.value(for: .error)).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.captionColor = ColorTokenContextBuilder(props.captionColor).context
        self.captionColorError = ColorTokenContextBuilder(props.captionColor?.value(for: .error)).context
        self.dotColor = ColorTokenContextBuilder(props.dotColor).context
        self.dotColorError = ColorTokenContextBuilder(props.dotColor?.value(for: .error)).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.backgroundColorActivated = ColorTokenContextBuilder(props.backgroundColor?.value(for: .activated)).context
        self.backgroundColorError = ColorTokenContextBuilder(props.backgroundColor?.value(for: .error)).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
        self.valueTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
    }
}
