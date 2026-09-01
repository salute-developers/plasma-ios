import Foundation

struct CardSize: CodeGenerationSize {
    typealias Props = CardProps
    
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var pathDrawer: String?
    
    init(variation: ComponentConfiguration<CardProps>.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CardProps, id: String? = nil, nullify: Bool = false) {
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
    }
    
    init() {
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
    }
}
