import Foundation

struct AutocompleteSize: CodeGenerationSize {
    typealias Props = AutocompleteProps
    
    init(variation: AutocompleteConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: AutocompleteProps, id: String? = nil, nullify: Bool = false) {}
    
    init() {}
}

