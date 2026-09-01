import Foundation

struct AutocompleteAppearance: CodeGenerationAppearance {
    typealias Variation = AutocompleteConfiguration.Variation
    typealias Props = AutocompleteProps
    
    var dropdownAppearance: String?
    var textFieldAppearance: String?
    
    init(variation: AutocompleteConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: AutocompleteProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let dropdownStyle = props.dropdownStyle?.value {
            self.dropdownAppearance = ComponentStyleContextBuilder(dropdownStyle).context
        }
        
        if let textFieldStyle = props.textFieldStyle?.value {
            self.textFieldAppearance = ComponentStyleContextBuilder(textFieldStyle).context
        }
    }
}

