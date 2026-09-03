import Foundation

struct ChipAppearance: CodeGenerationAppearance {
    typealias Variation = ChipConfiguration.Variation
    typealias Props = ChipProps

    var titleColor: String?
    var titleTypography: String?
    var imageTintColor: String?
    var buttonTintColor: String?
    var disabledAlpha: String?
    var backgroundColor: String?

    init(variation: ChipConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: ChipProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }

        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor).context
        self.imageTintColor = StatefulFillStyleContextBuilder(props.contentStartColor).context
        self.buttonTintColor = StatefulFillStyleContextBuilder(props.contentEndColor).context
        self.titleColor = StatefulFillStyleContextBuilder(props.labelColor).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
