import Foundation

struct ModalSize: CodeGenerationSize {
    typealias Props = ModalProps
    
    var closeSize: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var shape: String?
    var shadow: String?
    
    init(variation: ModalConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ModalProps, id: String? = nil, nullify: Bool = false) {
        self.closeSize = CGFloatContextBuilder(props.closeSize?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
    }
    
    init() {
        self.closeSize = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.shape = PathDrawerContextBuilder.defaultContext
        self.shadow = ShadowTokenContextBuilder.defaultContext
    }
} 
