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
            hoveredColor: props.textColor?.value(for: [.hovered]),
            selectedColor: props.textColor?.value(for: [.selected])
        ).context
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered]),
            selectedColor: props.backgroundColor?.value(for: [.selected])
        ).context
    }
    
    func context(with defaultStyle: String) -> String {
        var result: [String] = []
        let textTypography = self.textTypography ?? "\(defaultStyle).textTypography"
        result += ["textTypography: \(textTypography)"]
        
        let textColor = self.textColor ?? "\(defaultStyle).textColor"
        result += ["textColor: \(textColor)"]
        
        let backgroundColor = self.backgroundColor ?? "\(defaultStyle).backgroundColor"
        result += ["backgroundColor: \(backgroundColor)"]
        return ".init(\(result.joined(separator: ",")))"
    }
}
