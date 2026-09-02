import Foundation

struct SelectAppearance: CodeGenerationAppearance {
    typealias Variation = SelectConfiguration.Variation
    typealias Props = SelectProps
    
    var dropdownAppearance: String?
    var textFieldAppearance: String?
    var buttonAppearance: String?
    var selectItemAppearance: String?
    
    init(variation: SelectConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SelectProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let dropdownStyle = props.dropdownStyle?.value {
            self.dropdownAppearance = ComponentStyleContextBuilder(dropdownStyle).context
        }
        
        if let textFieldStyle = props.textFieldStyle?.value {
            self.textFieldAppearance = ComponentStyleContextBuilder(textFieldStyle).context
        }
        
        if let buttonStyle = props.buttonStyle?.value {
            self.buttonAppearance = ComponentStyleContextBuilder(buttonStyle).context
        }
        
        if let selectItemStyle = props.selectItemStyle?.value {
            self.selectItemAppearance = ComponentStyleContextBuilder(selectItemStyle).context
        }
    }
}

