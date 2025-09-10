import Foundation

struct BasicButtonGroupAppearance: CodeGenerationAppearance {
    typealias Variation = BasicButtonGroupConfiguration.Variation
    typealias Props = BasicButtonGroupProps
    
    var buttonAppearance: String?
    
    init(variation: BasicButtonGroupConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: BasicButtonGroupProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let buttonStyle = props.buttonStyle?.value {
            self.buttonAppearance = ComponentStyleContextBuilder(buttonStyle).context
        }
    }
}
