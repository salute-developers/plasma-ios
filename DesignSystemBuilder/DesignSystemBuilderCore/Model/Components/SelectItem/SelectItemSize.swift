import Foundation

struct SelectItemSize: CodeGenerationSize {
    typealias Props = SelectItemProps
    
    var shape: String?
    var height: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var controlMargin: String?
    var controlSize: String?
    
    init(variation: SelectItemConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: SelectItemProps, id: String? = nil, nullify: Bool = false) {
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.controlMargin = CGFloatContextBuilder(props.controlMargin?.value, nullify: nullify).context
        self.controlSize = CGFloatContextBuilder(props.controlSize?.value, nullify: nullify).context
    }
    
    init() {
        self.shape = PathDrawerContextBuilder.defaultContext
        self.height = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.controlMargin = CGFloat.defaultContext
        self.controlSize = CGFloat.defaultContext
    }
}

