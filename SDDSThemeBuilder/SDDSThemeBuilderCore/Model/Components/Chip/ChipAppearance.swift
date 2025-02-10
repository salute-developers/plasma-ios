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
    
    init(props: ChipProps, id: String? = nil, component: CodeGenerationComponent) {
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered])
        ).context
        self.imageTintColor = ButtonColorContextBuilder(
            defaultColor: props.contentStartColor,
            highlightedColor: props.contentStartColor?.value(for: [.pressed]),
            hoveredColor: props.contentStartColor?.value(for: [.hovered])
        ).context
        self.buttonTintColor = ButtonColorContextBuilder(
            defaultColor: props.contentEndColor,
            highlightedColor: props.contentEndColor?.value(for: [.pressed]),
            hoveredColor: props.contentEndColor?.value(for: [.hovered])
        ).context
        self.titleColor = ButtonColorContextBuilder(
            defaultColor: props.labelColor,
            highlightedColor: props.labelColor?.value(for: [.pressed]),
            hoveredColor: props.labelColor?.value(for: [.hovered])
        ).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
