import Foundation

struct CarouselAppearance: CodeGenerationAppearance {
    typealias Variation = CarouselConfiguration.Variation
    typealias Props = CarouselProps

    var indicatorAppearance: String?
    var nextButtonAppearance: String?
    var prevButtonAppearance: String?
    var nextButtonIcon: String?
    var prevButtonIcon: String?

    init(variation: CarouselConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: CarouselProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props else { return }

        if let indicatorStyle = props.indicatorStyle?.value {
            self.indicatorAppearance = ComponentStyleContextBuilder(indicatorStyle).context
        }
        if let nextButtonStyle = props.nextButtonStyle?.value {
            self.nextButtonAppearance = ComponentStyleContextBuilder(nextButtonStyle).context
        }
        if let prevButtonStyle = props.prevButtonStyle?.value {
            self.prevButtonAppearance = ComponentStyleContextBuilder(prevButtonStyle).context
        }

        self.nextButtonIcon = ImageContextBuilder(props.nextButtonIcon?.value).context
        self.prevButtonIcon = ImageContextBuilder(props.prevButtonIcon?.value).context
    }
}
