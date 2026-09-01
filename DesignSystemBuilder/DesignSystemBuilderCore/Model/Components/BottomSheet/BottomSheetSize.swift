import Foundation

struct BottomSheetSize: CodeGenerationSize {
    typealias Props = BottomSheetProps
    
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var pathDrawer: String?
    var handlePathDrawer: String?
    var handleWidth: String?
    var handleHeight: String?
    var handleOffset: String?
    
    init(variation: ComponentConfiguration<BottomSheetProps>.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: BottomSheetProps, id: String? = nil, nullify: Bool = false) {
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.handlePathDrawer = PathDrawerContextBuilder(shape: props.handleShape, nullify: nullify).context
        self.handleWidth = CGFloatContextBuilder(props.handleWidth?.value, nullify: nullify).context
        self.handleHeight = CGFloatContextBuilder(props.handleHeight?.value, nullify: nullify).context
        self.handleOffset = CGFloatContextBuilder(props.handleOffset?.value, nullify: nullify).context
    }
    
    init() {
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
        self.handlePathDrawer = PathDrawerContextBuilder.defaultContext
        self.handleWidth = CGFloat.defaultContext
        self.handleHeight = CGFloat.defaultContext
        self.handleOffset = CGFloat.defaultContext
    }
}
