import Foundation

struct ListSize: CodeGenerationSize {
    typealias Props = ListProps
    
    init(variation: ListConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ListProps, id: String? = nil, nullify: Bool = false) {}
    
    init() {}
} 
