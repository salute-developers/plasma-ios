import Foundation

struct ToastAppearance: CodeGenerationAppearance {
    typealias Variation = ToastConfiguration.Variation
    typealias Props = ToastProps

    var backgroundColor: String?
    var textColor: String?
    var contentStartColor: String?
    var contentEndColor: String?
    var textTypography: String?

    init(variation: ToastConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: ToastProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.textColor = ColorTokenContextBuilder(props.textColor).context
        self.contentStartColor = ColorTokenContextBuilder(props.contentStartColor).context
        self.contentEndColor = ColorTokenContextBuilder(props.contentEndColor).context
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
    }
} 