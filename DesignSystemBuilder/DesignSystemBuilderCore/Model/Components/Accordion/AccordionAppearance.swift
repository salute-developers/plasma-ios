import Foundation

struct AccordionAppearance: CodeGenerationAppearance {
    typealias Variation = AccordionActionConfiguration.Variation
    typealias Props = AccordionActionProps
    
    var accordionItemAppearance: String?
    var dividerAppearance: String?
    
    init(variation: AccordionActionConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: AccordionActionProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let accordionItemAppearance = props.accordionItemStyle?.value {
            self.accordionItemAppearance = ComponentStyleContextBuilder(accordionItemAppearance).context
        }
        
        if let dividerAppearance = props.dividerStyle?.value {
            self.dividerAppearance = ComponentStyleContextBuilder(dividerAppearance).context
        }
    }
} 
