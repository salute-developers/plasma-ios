import Foundation

struct SegmentItemAppearance: CodeGenerationAppearance {
    typealias Variation = SegmentItemConfiguration.Variation
    typealias Props = SegmentItemProps
    
    var backgroundColor: String?
    var disabledAlpha: String?
    var startContentColor: String?
    var endContentColor: String?
    var subtitleColor: String?
    var titleColor: String?
    var titleTypography: String?
    var subtitleTypography: String?
    var counterAppearance: String?
    
    init(variation: SegmentItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SegmentItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered]),
            selectedColor: props.backgroundColor?.value(for: [.selected])
        ).context
        self.startContentColor = ButtonColorContextBuilder(
            defaultColor: props.startContentColor,
            highlightedColor: props.startContentColor?.value(for: [.pressed]),
            hoveredColor: props.startContentColor?.value(for: [.hovered]),
            selectedColor: props.startContentColor?.value(for: [.selected])
        ).context
        self.endContentColor = ButtonColorContextBuilder(
            defaultColor: props.endContentColor,
            highlightedColor: props.endContentColor?.value(for: [.pressed]),
            hoveredColor: props.endContentColor?.value(for: [.hovered]),
            selectedColor: props.endContentColor?.value(for: [.selected])
        ).context
        self.titleColor = ButtonColorContextBuilder(
            defaultColor: props.labelColor,
            highlightedColor: props.labelColor?.value(for: [.pressed]),
            hoveredColor: props.labelColor?.value(for: [.hovered]),
            selectedColor: props.labelColor?.value(for: [.selected])
        ).context
        self.subtitleColor = ButtonColorContextBuilder(
            defaultColor: props.valueColor,
            highlightedColor: props.valueColor?.value(for: [.pressed]),
            hoveredColor: props.valueColor?.value(for: [.hovered]),
            selectedColor: props.valueColor?.value(for: [.selected])
        ).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        
        if let counterStyleValue = props.counterStyle?.value {
            var updatedAppearance: CounterAppearance? = nil
            if let counterStyleProps = props.counterStyle?.props {
                updatedAppearance = CounterAppearance(props: counterStyleProps, component: .counter)
            }
            let updatedAppearanceContext = updatedAppearance?.context(with: ComponentStyleContextBuilder(counterStyleValue).context ?? "")
            self.counterAppearance = ComponentStyleContextBuilder(counterStyleValue, appearance: updatedAppearanceContext).context
        }
    }
}
