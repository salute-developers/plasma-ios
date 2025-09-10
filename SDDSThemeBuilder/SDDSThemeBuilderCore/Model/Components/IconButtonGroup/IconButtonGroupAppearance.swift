import Foundation

struct IconButtonGroupAppearance: CodeGenerationAppearance {
    typealias Variation = IconButtonGroupConfiguration.Variation
    typealias Props = IconButtonGroupProps
    
    var buttonAppearance: String?
    
    init(variation: IconButtonGroupConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: IconButtonGroupProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let buttonStyle = props.buttonStyle?.value {
            self.buttonAppearance = ComponentStyleContextBuilder(buttonStyle).context
        }
    }
}
