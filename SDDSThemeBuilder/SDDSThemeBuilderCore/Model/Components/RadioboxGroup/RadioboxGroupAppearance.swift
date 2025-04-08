import Foundation

struct RadioboxGroupAppearance: CodeGenerationAppearance {
    typealias Variation = RadioboxGroupConfiguration.Variation
    typealias Props = RadioboxGroupProps

    var radioboxAppearance: String? = nil
  
    init(variation: RadioboxGroupConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: RadioboxGroupProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        if let radioboxAppearance = props.radioBoxStyle?.value {
            self.radioboxAppearance = ComponentStyleContextBuilder(radioboxAppearance).context
        }
    }
}
