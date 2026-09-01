import Foundation

struct CarouselSize: CodeGenerationSize {
    typealias Props = CarouselProps

    var gap: String?
    var indicatorPadding: String?
    var nextButtonPadding: String?
    var prevButtonPadding: String?
    var buttonsPlacement: String?

    init(variation: CarouselConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: CarouselProps, id: String? = nil, nullify: Bool = false) {
        self.gap = CGFloatContextBuilder(props.gap?.value, nullify: nullify).context
        self.indicatorPadding = CGFloatContextBuilder(props.indicatorPadding?.value, nullify: nullify).context
        self.nextButtonPadding = CGFloatContextBuilder(props.nextButtonPadding?.value, nullify: nullify).context
        self.prevButtonPadding = CGFloatContextBuilder(props.prevButtonPadding?.value, nullify: nullify).context
        self.buttonsPlacement = CarouselButtonsPlacementContextBuilder(id: props.buttonsPlacement?.value, nullify: nullify).context
    }

    init() {
        self.gap = CGFloat.defaultContext
        self.indicatorPadding = CGFloat.defaultContext
        self.nextButtonPadding = CGFloat.defaultContext
        self.prevButtonPadding = CGFloat.defaultContext
        self.buttonsPlacement = CarouselButtonsPlacementContextBuilder.defaultContext
    }
}

final class CarouselButtonsPlacementContextBuilder: CodeGenerationContextBuilder {
    private let value: String?
    private let nullify: Bool

    static var defaultContext: String { "CarouselButtonsPlacement.inner" }

    init(id: String?, nullify: Bool = false) {
        self.value = id
        self.nullify = nullify
    }

    var context: String? {
        switch value?.lowercased() {
        case "inner":
            return "CarouselButtonsPlacement.inner"
        case "outer":
            return "CarouselButtonsPlacement.outer"
        default:
            return nullify ? nil : Self.defaultContext
        }
    }
}
