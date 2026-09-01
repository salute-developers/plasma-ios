import Foundation

struct ScrollbarSize: CodeGenerationSize {
    typealias Props = ScrollbarProps
    
    var width: String?
    var shape: String?
    var hoverExpandFactor: String?
    
    init(variation: ComponentConfiguration<ScrollbarProps>.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ScrollbarProps, id: String? = nil, nullify: Bool = false) {
        self.width = CGFloatContextBuilder(props.width?.value, nullify: nullify).context
        self.hoverExpandFactor = CGFloatContextBuilder(props.hoverExpandFactor?.value, nullify: nullify).context
        self.shape = PathDrawerContextBuilder(shape: props.shape).context
    }
    
    init() {
        self.width = CGFloat.defaultContext
        self.hoverExpandFactor = CGFloat.defaultContext
        self.shape = PathDrawerContextBuilder.defaultContext
    }
}
