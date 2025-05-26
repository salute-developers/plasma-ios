import Foundation

struct TooltipSize: CodeGenerationSize {
    typealias Props = TooltipProps

    var width: String?
    var tailWidth: String?
    var tailHeight: String?
    var tailPadding: String?
    var offset: String?
    var pathDrawer: String?

    init(variation: TooltipConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: TooltipProps, id: String? = nil, nullify: Bool = false) {
        self.width = CGFloatContextBuilder(props.width?.value, nullify: nullify).context
        self.tailWidth = CGFloatContextBuilder(props.tailWidth?.value, nullify: nullify).context
        self.tailHeight = CGFloatContextBuilder(props.tailHeight?.value, nullify: nullify).context
        self.tailPadding = CGFloatContextBuilder(props.tailPadding?.value, nullify: nullify).context
        self.offset = CGFloatContextBuilder(props.offset?.value, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
    }

    init() {
        self.width = CGFloat.defaultContext
        self.tailWidth = CGFloat.defaultContext
        self.tailHeight = CGFloat.defaultContext
        self.tailPadding = CGFloat.defaultContext
        self.offset = CGFloat.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
    }
} 