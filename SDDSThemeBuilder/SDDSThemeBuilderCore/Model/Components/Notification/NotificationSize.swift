import Foundation

struct NotificationSize: CodeGenerationSize {
    typealias Props = NotificationProps
    
    var closeSize: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var shape: String?
    
    init(variation: NotificationConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: NotificationProps, id: String? = nil, nullify: Bool = false) {
        self.closeSize = CGFloatContextBuilder(props.closeSize?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
    }
    
    init() {
        self.closeSize = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.shape = PathDrawerContextBuilder.defaultContext
    }
} 
