import Foundation

struct CellSize: CodeGenerationSize {
    typealias Props = CellProps
    
    var contentPaddingStart: String?
    var contentPaddingEnd: String?
    
    init(variation: ComponentConfiguration<CellProps>.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CellProps, id: String? = nil, nullify: Bool = false) {
        self.contentPaddingStart = CGFloatContextBuilder(props.contentPaddingStart?.value, nullify: nullify).context
        self.contentPaddingEnd = CGFloatContextBuilder(props.contentPaddingEnd?.value, nullify: nullify).context
    }
    
    init() {
        self.contentPaddingStart = CGFloat.defaultContext
        self.contentPaddingEnd = CGFloat.defaultContext
    }
}
