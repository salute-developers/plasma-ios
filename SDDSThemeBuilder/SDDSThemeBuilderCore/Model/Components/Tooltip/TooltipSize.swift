import Foundation

struct TooltipSize: CodeGenerationSize {
    typealias Props = TooltipProps

    var contentStartSize: String?
    var tailPadding: String?
    var tailWidth: String?
    var tailHeight: String?
    var offset: String?
    var contentStartPadding: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var pathDrawer: String?

    init(variation: TooltipConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: TooltipProps, id: String? = nil, nullify: Bool = false) {
        self.contentStartSize = CGFloatContextBuilder(props.contentStartSize?.value, nullify: nullify).context
        self.tailPadding = CGFloatContextBuilder(props.tailPadding?.value, nullify: nullify).context
        self.tailWidth = CGFloatContextBuilder(props.tailWidth?.value, nullify: nullify).context
        self.tailHeight = CGFloatContextBuilder(props.tailHeight?.value, nullify: nullify).context
        self.offset = CGFloatContextBuilder(props.offset?.value, nullify: nullify).context
        self.contentStartPadding = CGFloatContextBuilder(props.contentStartPadding?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
    }

    init() {
        self.contentStartSize = CGFloat.defaultContext
        self.tailPadding = CGFloat.defaultContext
        self.tailWidth = CGFloat.defaultContext
        self.tailHeight = CGFloat.defaultContext
        self.offset = CGFloat.defaultContext
        self.contentStartPadding = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
    }
} 