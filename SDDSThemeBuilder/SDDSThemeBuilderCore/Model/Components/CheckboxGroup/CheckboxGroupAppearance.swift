import Foundation

struct CheckboxGroupAppearance: CodeGenerationAppearance {
    typealias Variation = CheckboxGroupConfiguration.Variation
    typealias Props = CheckboxGroupProps
    
    var checkboxAppearance: String? = nil
    
    init(variation: CheckboxGroupConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CheckboxGroupProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        if let checkboxAppearance = props.checkBoxStyle?.value {
            self.checkboxAppearance = ComponentStyleContextBuilder(checkboxAppearance).context
        }
    }
}
