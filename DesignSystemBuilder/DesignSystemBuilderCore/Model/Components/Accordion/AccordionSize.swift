import Foundation

struct AccordionSize: CodeGenerationSize {
    typealias Props = AccordionActionProps
    
    var itemSpacing: String?
    
    init(variation: AccordionActionConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: AccordionActionProps, id: String? = nil, nullify: Bool = false) {
        self.itemSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
    }
    
    init() {
        self.itemSpacing = CGFloat.defaultContext
    }
} 
