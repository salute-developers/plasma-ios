import Foundation

struct ImageSize: CodeGenerationSize {
    typealias Props = ImageProps

    var ratioWidth: String?
    var ratioHeight: String?

    init(variation: ImageConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: ImageProps, id: String? = nil, nullify: Bool = false) {
        self.ratioWidth = CGFloatContextBuilder(props.width?.value, nullify: nullify).context
        self.ratioHeight = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
    }

    init() {
        self.ratioWidth = CGFloat.defaultContext
        self.ratioHeight = CGFloat.defaultContext
    }
}
