import Foundation

struct DropdownMenuSize: CodeGenerationSize {    
    typealias Variation = DropdownMenuConfiguration.Variation
    typealias Props = DropdownMenuProps
    
    var shape: String?
    var width: String?
    var offset: String?
    
    init(variation: DropdownMenuConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: DropdownMenuProps, id: String? = nil, nullify: Bool = false) {        
        self.shape = PathDrawerContextBuilder(shape: props.shape).context
        self.width = CGFloatContextBuilder(props.width?.value).context
        self.offset = CGFloatContextBuilder(props.offset?.value).context
    }
    
    init() {
        self.shape = PathDrawerContextBuilder.defaultContext
        self.width = CGFloat.defaultContext
        self.offset = CGFloat.defaultContext
    }
}
