import Foundation

struct CounterAppearance: CodeGenerationAppearance {
    typealias Props = CounterProps
    typealias Variation = CounterConfiguration.Variation
    
    var textTypography: String?
    var textColor: String?
    var backgroundColor: String?
    
    init(variation: CounterConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CounterProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.textTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.textColor = ButtonColorContextBuilder(
            defaultColor: props.textColor,
            highlightedColor: props.textColor?.value(for: [.pressed]),
            hoveredColor: props.textColor?.value(for: [.hovered])
        ).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered])
        ).context
    }
}

extension CounterAppearance: Reflectable {
    var properties: [(WritableKeyPath<CounterAppearance, String?>, String?)] {
        return [
            (\CounterAppearance.textTypography, textTypography),
            (\CounterAppearance.textColor, textColor),
            (\CounterAppearance.backgroundColor, backgroundColor)
        ]
    }
    
    func update(keyPath: WritableKeyPath<CounterAppearance, String?>, value: String?) -> CounterAppearance {
        var result = self
        result[keyPath: keyPath] = value
        return result
    }
}
