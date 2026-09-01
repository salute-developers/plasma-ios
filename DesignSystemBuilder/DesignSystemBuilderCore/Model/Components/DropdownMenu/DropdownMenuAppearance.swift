import Foundation

struct DropdownMenuAppearance: CodeGenerationAppearance {
    typealias Variation = DropdownMenuConfiguration.Variation
    typealias Props = DropdownMenuProps
    
    var listAppearance: String?
    var width: Double?
    var dividerAppearance: String?
    var backgroundColor: String?
    var offset: Double?
    var shadow: String?
    
    init(variation: DropdownMenuConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: DropdownMenuProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let listStyle = props.listStyle?.value {
            self.listAppearance = ComponentStyleContextBuilder(listStyle).context
        }
        if let dividerStyle = props.dividerStyle?.value {
            self.dividerAppearance = ComponentStyleContextBuilder(dividerStyle).context
        }
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
    }
} 
