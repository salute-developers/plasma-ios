import Foundation

struct DividerSize: CodeGenerationSize {
    typealias Props = DividerProps
    
    init(variation: DividerConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: DividerProps, id: String? = nil, nullify: Bool = false) {}
    
    init() {}
}
