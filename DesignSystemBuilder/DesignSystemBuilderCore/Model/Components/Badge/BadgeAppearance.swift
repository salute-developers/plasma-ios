import Foundation

struct BadgeAppearance: CodeGenerationAppearance {
    typealias Variation = BadgeConfiguration.Variation
    typealias Props = BadgeProps

    var backgroundColor: String?
    var startContentColor: String?
    var endContentColor: String?
    var labelColor: String?
    var labelTypography: String?

    init(variation: BadgeConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: BadgeProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }

        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor, hasDefault: true).context
        self.startContentColor = StatefulFillStyleContextBuilder(props.startContentColor, hasDefault: true).context
        self.endContentColor = StatefulFillStyleContextBuilder(props.endContentColor, hasDefault: true).context
        self.labelColor = StatefulFillStyleContextBuilder(props.labelColor, hasDefault: true).context
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
