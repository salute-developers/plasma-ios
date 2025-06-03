import Foundation

struct ToastSize: CodeGenerationSize {
    typealias Props = ToastProps

    var contentStartSize: String?
    var contentEndSize: String?
    var contentStartPadding: String?
    var contentEndPadding: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var shape: String?

    init(variation: ToastConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: ToastProps, id: String? = nil, nullify: Bool = false) {
        self.contentStartSize = CGFloatContextBuilder(props.contentStartSize?.value, nullify: nullify).context
        self.contentEndSize = CGFloatContextBuilder(props.contentEndSize?.value, nullify: nullify).context
        self.contentStartPadding = CGFloatContextBuilder(props.contentStartPadding?.value, nullify: nullify).context
        self.contentEndPadding = CGFloatContextBuilder(props.contentEndPadding?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
    }

    init() {
        self.contentStartSize = CGFloat.defaultContext
        self.contentEndSize = CGFloat.defaultContext
        self.contentStartPadding = CGFloat.defaultContext
        self.contentEndPadding = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.shape = PathDrawerContextBuilder.defaultContext
    }
} 