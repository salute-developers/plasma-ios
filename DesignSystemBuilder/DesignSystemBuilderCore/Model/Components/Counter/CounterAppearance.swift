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
        self.textColor = StatefulFillStyleContextBuilder(props.textColor).context
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor).context
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
