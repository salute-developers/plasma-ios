import Foundation

struct ButtonGroupAppearance: CodeGenerationAppearance {
    typealias Variation = ButtonGroupConfiguration.Variation
    typealias Props = ButtonGroupProps
    
    var buttonAppearance: String?
    
    init(variation: ButtonGroupConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ButtonGroupProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
         
        if let buttonStyle = props.buttonStyle?.value {
            self.buttonAppearance = ComponentStyleContextBuilder(buttonStyle).context
        }
    }
}
