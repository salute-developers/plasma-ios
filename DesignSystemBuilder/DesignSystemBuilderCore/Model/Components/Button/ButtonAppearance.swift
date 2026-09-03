import Foundation

struct ButtonAppearance: CodeGenerationAppearance {
    typealias Variation = ButtonConfiguration.Variation
    typealias Props = ButtonProps

    var loadingAlpha: String?
    var disabledAlpha: String?
    var backgroundColor: String?
    var spinnerColor: String?
    var iconColor: String?
    var subtitleColor: String?
    var titleColor: String?
    var titleTypography: String?
    var subtitleTypography: String?

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
