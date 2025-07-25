import Foundation

struct ListAppearance: CodeGenerationAppearance {
    typealias Variation = ListConfiguration.Variation
    typealias Props = ListProps
    
    var listItemAppearance: String?
    var dividerAppearance: String?
    var scrollBarAppearance: String?
    
    init(variation: ListConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ListProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let listItemStyle = props.listItemStyle?.value {
            self.listItemAppearance = ComponentStyleContextBuilder(listItemStyle).context
        }
        
        if let dividerStyle = props.dividerStyle?.value {
            self.dividerAppearance = ComponentStyleContextBuilder(dividerStyle).context
        }
        
        if let scrollBarStyle = props.scrollBarStyle?.value {
            self.scrollBarAppearance = ComponentStyleContextBuilder(scrollBarStyle).context
        }
    }
} 
