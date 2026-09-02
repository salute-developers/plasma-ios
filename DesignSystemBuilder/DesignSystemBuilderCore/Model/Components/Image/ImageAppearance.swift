import Foundation

struct ImageAppearance: CodeGenerationAppearance {
    typealias Variation = ImageConfiguration.Variation
    typealias Props = ImageProps

    init(variation: ImageConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: ImageProps?, id: String? = nil, component: CodeGenerationComponent) {
        _ = props
        _ = id
        _ = component
    }
}
