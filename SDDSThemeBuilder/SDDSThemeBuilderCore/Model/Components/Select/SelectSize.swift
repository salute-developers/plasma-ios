import Foundation

struct SelectSize: CodeGenerationSize {
    typealias Props = SelectProps
    
    init(variation: SelectConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: SelectProps, id: String? = nil, nullify: Bool = false) {}
    
    init() {}
}

