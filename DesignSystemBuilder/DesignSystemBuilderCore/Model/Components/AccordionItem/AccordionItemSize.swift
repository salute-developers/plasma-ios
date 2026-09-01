import Foundation

struct AccordionItemSize: CodeGenerationSize {
    typealias Props = AccordionItemProps
    
    var shape: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var contentPaddingStart: String?
    var contentPaddingEnd: String?
    var contentPaddingBottom: String?
    var iconPadding: String?
    var iconPlacement: String?
    var iconRotation: String?
    
    init(variation: AccordionItemConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: AccordionItemProps, id: String? = nil, nullify: Bool = false) {
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.contentPaddingStart = CGFloatContextBuilder(props.contentPaddingStart?.value, nullify: nullify).context
        self.contentPaddingEnd = CGFloatContextBuilder(props.contentPaddingEnd?.value, nullify: nullify).context
        self.contentPaddingBottom = CGFloatContextBuilder(props.contentPaddingBottom?.value, nullify: nullify).context
        self.iconPadding = CGFloatContextBuilder(props.iconPadding?.value, nullify: nullify).context
        self.iconPlacement = AccordionItemPlacementContextBuilder(props.iconPlacement?.value, nullify: nullify).context
        self.iconRotation = CGFloatContextBuilder(props.iconRotation?.value, nullify: nullify).context
    }
    
    init() {
        self.shape = PathDrawerContextBuilder.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.contentPaddingStart = CGFloat.defaultContext
        self.contentPaddingEnd = CGFloat.defaultContext
        self.contentPaddingBottom = CGFloat.defaultContext
        self.iconPadding = CGFloat.defaultContext
        self.iconPlacement = AccordionItemPlacementContextBuilder.defaultContext
        self.iconRotation = CGFloat.defaultContext
    }
} 
