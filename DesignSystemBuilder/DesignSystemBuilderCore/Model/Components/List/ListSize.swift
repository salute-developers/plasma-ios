import Foundation

struct ListSize: CodeGenerationSize {
    typealias Props = ListProps
    
    var gap: String?
    var shape: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    
    init(variation: ListConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ListProps, id: String? = nil, nullify: Bool = false) {
        self.gap = CGFloatContextBuilder(props.gap?.value, nullify: nullify).context
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
    }
    
    init() {
        self.gap = CGFloat.defaultContext
        self.shape = PathDrawerContextBuilder.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
    }
} 
