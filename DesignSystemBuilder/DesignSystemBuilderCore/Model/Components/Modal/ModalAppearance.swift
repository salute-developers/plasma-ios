import Foundation

struct ModalAppearance: CodeGenerationAppearance {
    typealias Variation = ModalConfiguration.Variation
    typealias Props = ModalProps

    var backgroundColor: String?
    var closeColor: String?

    init(variation: ModalConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: ModalProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.closeColor = ColorTokenContextBuilder(props.closeColor).context
    }
} 