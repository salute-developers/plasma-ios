import Foundation

struct TextFieldSize: CodeGenerationSize {
    typealias Props = TextFieldProps
    
    var titleBottomPadding: String?
    var titleInnerPadding: String?
    var textBeforeTrailingPadding: String?
    var textAfterLeadingPadding: String?
    var boxLeadingPadding: String?
    var boxTrailingPadding: String?
    var captionTopPadding: String?
    var optionalPadding: String?
    var cornerRadius: String?
    var chipGroupStyle: String?
    var chipStyle: String?
    var iconPadding: String?
    var iconActionPadding: String?
    var fieldHeight: String?
    var iconSize: String?
    var iconActionSize: String?
    var chipsPadding: String?
    var chipContainerHorizontalPadding: String?
    var indicatorSize: String?
    var indicatorOffset: String?
    var textBeforeLeadingPadding: String?
    var textAfterTrailingPadding: String?
    var dividerHeight: String?
    var boxPaddingTop: String?
    var boxPaddingBottom: String?
    
    init(variation: TextFieldConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: TextFieldProps, id: String? = nil, nullify: Bool = false) {
        self.titleBottomPadding = CGFloatContextBuilder(props.labelPadding?.value, nullify: nullify).context
        self.titleInnerPadding = CGFloatContextBuilder(props.labelPadding?.value, nullify: nullify).context
        self.textBeforeTrailingPadding = CGFloatContextBuilder(props.prefixPadding?.value, nullify: nullify).context
        self.textAfterLeadingPadding = CGFloatContextBuilder(props.suffixPadding?.value, nullify: nullify).context
        self.boxLeadingPadding = CGFloatContextBuilder(props.boxPaddingStart?.value, nullify: nullify).context
        self.boxTrailingPadding = CGFloatContextBuilder(props.boxPaddingEnd?.value, nullify: nullify).context
        self.captionTopPadding = CGFloatContextBuilder(props.helperTextPadding?.value, nullify: nullify).context
        self.optionalPadding = CGFloatContextBuilder(props.optionalPadding?.value, nullify: nullify).context
        self.cornerRadius = ShapeTokenContextBuilder(shape: props.shape, nullify: nullify).context
        self.iconPadding = CGFloatContextBuilder(props.startContentPadding?.value, nullify: nullify).context
        self.iconActionPadding = CGFloatContextBuilder(props.endContentPadding?.value, nullify: nullify).context
        self.fieldHeight = CGFloatContextBuilder(props.boxMinHeight?.value, nullify: nullify).context
        self.chipsPadding = CGFloatContextBuilder(props.chipsPadding?.value, nullify: nullify).context
        self.chipContainerHorizontalPadding = CGFloatContextBuilder(props.chipsPadding?.value, nullify: nullify).context
        self.iconSize = SizeContextBuilder(x: props.startContentSize?.value, y: props.startContentSize?.value, style: .size, nullify: nullify).context
        self.iconActionSize = SizeContextBuilder(x: props.endContentSize?.value, y: props.endContentSize?.value, style: .size, nullify: nullify).context
        self.indicatorOffset = SizeContextBuilder(x: props.indicatorOffsetX?.value, y: props.indicatorOffsetY?.value, style: .point, nullify: nullify).context
        self.indicatorSize = SizeContextBuilder(x: props.indicatorSize?.value, y: props.indicatorSize?.value, style: .size, nullify: nullify).context
        self.textBeforeLeadingPadding = CGFloat.defaultContext
        self.textAfterTrailingPadding = CGFloat.defaultContext
        self.dividerHeight = CGFloat(1).context
        self.boxPaddingTop = CGFloatContextBuilder(props.boxPaddingBottom?.value, nullify: nullify).context
        self.boxPaddingBottom = CGFloatContextBuilder(props.boxPaddingBottom?.value, nullify: nullify).context
    }
    
    init() {
        self.titleBottomPadding = CGFloat.defaultContext
        self.titleInnerPadding = CGFloat.defaultContext
        self.textBeforeTrailingPadding = CGFloat.defaultContext
        self.textAfterLeadingPadding = CGFloat.defaultContext
        self.boxLeadingPadding = CGFloat.defaultContext
        self.boxTrailingPadding = CGFloat.defaultContext
        self.captionTopPadding = CGFloat.defaultContext
        self.optionalPadding = CGFloat.defaultContext
        self.iconPadding = CGFloat.defaultContext
        self.iconActionPadding = CGFloat.defaultContext
        self.fieldHeight = CGFloat.defaultContext
        self.iconSize = CGSize.defaultContext
        self.iconActionSize = CGSize.defaultContext
        self.chipsPadding = CGFloat.defaultContext
        self.chipContainerHorizontalPadding = CGFloat.defaultContext
        self.indicatorSize = CGSize.defaultContext
        self.indicatorOffset = CGPoint.defaultContext
        self.textBeforeLeadingPadding = CGFloat.defaultContext
        self.textAfterTrailingPadding = CGFloat.defaultContext
        self.dividerHeight = CGFloat.defaultContext
        self.cornerRadius = CGFloat.defaultContext
        self.boxPaddingTop = CGFloat.defaultContext
        self.boxPaddingBottom = CGFloat.defaultContext
    }
}
