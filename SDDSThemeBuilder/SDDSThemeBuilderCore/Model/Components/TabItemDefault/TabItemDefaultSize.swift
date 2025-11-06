import Foundation

struct TabItemDefaultSize: CodeGenerationSize {
    typealias Variation = TabItemDefaultConfiguration.Variation
    typealias Props = TabItemDefaultProps
    
    var disableAlpha: String?
    var minHeight: String?
    var startContentSize: String?
    var endContentSize: String?
    var startContentPadding: String?
    var valuePadding: String?
    var counterPadding: String?
    var actionPadding: String?
    var paddingStart: String?
    var paddingEnd: String?
    var iconPadding: String?
    var actionSize: String?
    var actionIconSize: String?
    var counterOffsetX: String?
    var counterOffsetY: String?
    
    init(variation: TabItemDefaultConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: TabItemDefaultProps, id: String? = nil, nullify: Bool = false) {
        self.disableAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: nullify).context
        self.minHeight = CGFloatContextBuilder(props.minHeight?.value, nullify: nullify).context
        self.startContentSize = CGFloatContextBuilder(props.startContentSize?.value, nullify: nullify).context
        self.endContentSize = CGFloatContextBuilder(props.endContentSize?.value, nullify: nullify).context
        self.startContentPadding = CGFloatContextBuilder(props.startContentPadding?.value, nullify: nullify).context
        self.valuePadding = CGFloatContextBuilder(props.valuePadding?.value, nullify: nullify).context
        self.counterPadding = CGFloatContextBuilder(props.counterPadding?.value, nullify: nullify).context
        self.actionPadding = CGFloatContextBuilder(props.actionPadding?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.iconPadding = CGFloatContextBuilder(props.iconPadding?.value, nullify: nullify).context
        self.actionSize = CGFloatContextBuilder(props.actionSize?.value, nullify: nullify).context
        self.actionIconSize = ImageSizeContextBuilder(props.actionIcon?.value, nullify: nullify).context
        self.counterOffsetX = CGFloatContextBuilder(props.counterOffsetX?.value, nullify: nullify).context
        self.counterOffsetY = CGFloatContextBuilder(props.counterOffsetY?.value, nullify: nullify).context
    }
    
    init() {
        self.disableAlpha = CGFloat.defaultContext
        self.minHeight = CGFloat.defaultContext
        self.startContentSize = CGFloat.defaultContext
        self.endContentSize = CGFloat.defaultContext
        self.startContentPadding = CGFloat.defaultContext
        self.valuePadding = CGFloat.defaultContext
        self.counterPadding = CGFloat.defaultContext
        self.actionPadding = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.iconPadding = CGFloat.defaultContext
        self.actionSize = CGFloat.defaultContext
        self.actionIconSize = "CGFloat(0)"
        self.counterOffsetX = CGFloat.defaultContext
        self.counterOffsetY = CGFloat.defaultContext
    }
}


