import Foundation

struct TextAreaSize: CodeGenerationSize {
    typealias Props = TextFieldProps
    
    var titleBottomPadding: String?
    var titleInnerPadding: String?
    var boxLeadingPadding: String?
    var boxTrailingPadding: String?
    var captionTopPadding: String?
    var captionBottomPadding: String?
    var optionalPadding: String?
    var chipGroupStyle: String?
    var chipStyle: String?
    var iconActionPadding: String?
    var fieldHeight: String?
    var iconActionSize: String?
    var cornerRadius: String?
    var chipsPadding: String?
    var chipContainerHorizontalPadding: String?
    var indicatorSize: String?
    var indicatorOffset: String?
    var boxPaddingTop: String?
    var boxPaddingBottom: String?
    var endContentPadding: String?
    let scrollBarThickness: String?
    let scrollBarPaddingTop: String?
    let scrollBarPaddingBottom: String?
    let scrollBarPaddingEnd: String?
        
    init(variation: TextFieldConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: TextFieldProps, id: String? = nil, nullify: Bool = false) {
        self.titleBottomPadding = CGFloatContextBuilder(props.labelPadding?.value, nullify: nullify).context
        self.titleInnerPadding = CGFloatContextBuilder(props.labelPadding?.value, nullify: nullify).context
        self.boxLeadingPadding = CGFloatContextBuilder(props.boxPaddingStart?.value, nullify: nullify).context
        self.boxTrailingPadding = CGFloatContextBuilder(props.boxPaddingEnd?.value, nullify: nullify).context
        self.boxPaddingTop = CGFloatContextBuilder(props.boxPaddingTop?.value, nullify: nullify).context
        self.boxPaddingBottom = CGFloatContextBuilder(props.boxPaddingBottom?.value, nullify: nullify).context
        self.captionTopPadding = CGFloatContextBuilder(props.helperTextPadding?.value, nullify: nullify).context
        self.captionBottomPadding = CGFloatContextBuilder(props.helperTextPadding?.value, nullify: nullify).context
        self.optionalPadding = CGFloatContextBuilder(props.optionalPadding?.value, nullify: nullify).context
        self.iconActionPadding = CGFloatContextBuilder(props.endContentPadding?.value, nullify: nullify).context
        self.cornerRadius = ShapeTokenContextBuilder(shape: props.shape, nullify: nullify).context
        self.fieldHeight = CGFloatContextBuilder(props.boxMinHeight?.value, nullify: nullify).context
        self.iconActionSize = SizeContextBuilder(x: props.endContentSize?.value, y: props.endContentSize?.value, style: .size, nullify: nullify).context
        self.chipsPadding = CGFloatContextBuilder(props.chipsPadding?.value, nullify: nullify).context
        self.chipContainerHorizontalPadding = CGFloatContextBuilder(props.chipsPadding?.value, nullify: nullify).context
        self.indicatorSize = SizeContextBuilder(x: props.indicatorSize?.value, y: props.indicatorSize?.value, style: .size, nullify: nullify).context
        self.indicatorOffset = SizeContextBuilder(x: props.indicatorOffsetX?.value, y: props.indicatorOffsetY?.value, style: .point, nullify: nullify).context
        self.endContentPadding = CGFloatContextBuilder(props.endContentPadding?.value, nullify: nullify).context
        self.scrollBarThickness = CGFloatContextBuilder(props.scrollBarThickness?.value, nullify: nullify).context
        self.scrollBarPaddingTop = CGFloatContextBuilder(props.scrollBarPaddingTop?.value, nullify: nullify).context
        self.scrollBarPaddingBottom = CGFloatContextBuilder(props.scrollBarPaddingBottom?.value, nullify: nullify).context
        self.scrollBarPaddingEnd = CGFloatContextBuilder(props.scrollBarPaddingEnd?.value, nullify: nullify).context
    }
    
    init() {
        self.titleBottomPadding = CGFloat.defaultContext
        self.titleInnerPadding = CGFloat.defaultContext
        self.boxLeadingPadding = CGFloat.defaultContext
        self.boxTrailingPadding = CGFloat.defaultContext
        self.boxPaddingTop = CGFloat.defaultContext
        self.boxPaddingBottom = CGFloat.defaultContext
        self.captionTopPadding = CGFloat.defaultContext
        self.captionBottomPadding = CGFloat.defaultContext
        self.optionalPadding = CGFloat.defaultContext
        self.iconActionPadding = CGFloat.defaultContext
        self.fieldHeight = CGFloat.defaultContext
        self.iconActionSize = CGSize.defaultContext
        self.chipsPadding = CGFloat.defaultContext
        self.chipContainerHorizontalPadding = CGFloat.defaultContext
        self.indicatorSize = CGSize.defaultContext
        self.indicatorOffset = CGPoint.defaultContext
        self.cornerRadius = CGFloat.defaultContext
        self.endContentPadding = CGFloat.defaultContext
        self.scrollBarThickness = CGFloat.defaultContext
        self.scrollBarPaddingTop = CGFloat.defaultContext
        self.scrollBarPaddingBottom = CGFloat.defaultContext
        self.scrollBarPaddingEnd = CGFloat.defaultContext
    }

}
