import Foundation

struct TooltipAppearance: CodeGenerationAppearance {
    typealias Variation = TooltipConfiguration.Variation
    typealias Props = TooltipProps

    var backgroundColor: String?
    var textColor: String?
    var contentStartColor: String?
    var shadow: String?
    var textTypography: String?

    init(variation: TooltipConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: TooltipProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.textColor = ColorTokenContextBuilder(props.textColor).context
        self.contentStartColor = ColorTokenContextBuilder(props.contentStartColor).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
    }
} 
