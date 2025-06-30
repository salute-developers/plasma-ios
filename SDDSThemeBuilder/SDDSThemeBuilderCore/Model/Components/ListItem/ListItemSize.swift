import Foundation

struct ListItemSize: CodeGenerationSize {
    typealias Props = ListItemProps
    
    var shape: String?
    var height: String?
    var contentPaddingEnd: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    
    init(variation: ListItemConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ListItemProps, id: String? = nil, nullify: Bool = false) {
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.contentPaddingEnd = CGFloatContextBuilder(props.contentPaddingEnd?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
    }
    
    init() {
        self.shape = PathDrawerContextBuilder.defaultContext
        self.height = CGFloat.defaultContext
        self.contentPaddingEnd = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
    }
} 
