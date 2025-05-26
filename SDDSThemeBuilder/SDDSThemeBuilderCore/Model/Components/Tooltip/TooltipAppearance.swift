import Foundation

struct TooltipAppearance: CodeGenerationAppearance {
    typealias Variation = TooltipConfiguration.Variation
    typealias Props = TooltipProps

    var backgroundColor: String?
    var shadow: String?

    init(variation: TooltipConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: TooltipProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }

        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
    }
} 