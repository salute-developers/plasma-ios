import Foundation

struct ButtonAppearance: CodeGenerationAppearance {
    typealias Variation = ButtonConfiguration.Variation
    typealias Props = ButtonProps
    
    var loadingAlpha: String? = nil
    var disabledAlpha: String? = nil
    var backgroundColor: String? = nil
    var spinnerColor: String? = nil
    var iconColor: String? = nil
    var subtitleColor: String? = nil
    var titleColor: String? = nil
    var titleTypography: String? = nil
    var subtitleTypography: String? = nil
    
    init(variation: ButtonConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ButtonProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.loadingAlpha = CGFloatContextBuilder(props.loadingAlpha?.value, nullify: true).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered])
        ).context
        self.spinnerColor = ButtonColorContextBuilder(
            defaultColor: props.spinnerColor,
            highlightedColor: props.spinnerColor?.value(for: [.pressed]),
            hoveredColor: props.spinnerColor?.value(for: [.hovered])
        ).context
        self.iconColor = ButtonColorContextBuilder(
            defaultColor: props.iconColor,
            highlightedColor: props.iconColor?.value(for: [.pressed]),
            hoveredColor: props.iconColor?.value(for: [.hovered])
        ).context
        self.titleColor = ButtonColorContextBuilder(
            defaultColor: props.labelColor,
            highlightedColor: props.labelColor?.value(for: [.pressed]),
            hoveredColor: props.labelColor?.value(for: [.hovered])
        ).context
        self.subtitleColor = ButtonColorContextBuilder(
            defaultColor: props.valueColor,
            highlightedColor: props.valueColor?.value(for: [.pressed]),
            hoveredColor: props.valueColor?.value(for: [.hovered])
        ).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
