import Foundation

struct AvatarAppearance: CodeGenerationAppearance {
    typealias Variation = AvatarConfiguration.Variation
    typealias Props = AvatarProps
    
    var shape: String? = nil
    var backgroundFillStyle: String? = nil
    var textFillStyle: String? = nil
    var onlineStatusColor: String? = nil
    var offlineStatusColor: String? = nil
    var textTypography: String? = nil
    var indicatorAppearance: String? = nil
    var badgeAppearance: String? = nil
    var counterAppearance: String? = nil
    
    init(variation: AvatarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: AvatarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.shape = ShapeTokenContextBuilder(shape: props.shape, nullify: true).context
//        self.backgroundFillStyle = FillStyleContextBuilder(props.background, hasDefault: true).context
//        self.textFillStyle = FillStyleContextBuilder(props.textColor, hasDefault: true).context
        self.onlineStatusColor = ColorTokenContextBuilder(props.inactiveStatusColor).context
        self.offlineStatusColor = ColorTokenContextBuilder(props.inactiveStatusColor).context
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
        if let indicatorAppearance = props.statusStyle?.value {
            self.indicatorAppearance = ComponentStyleContextBuilder(indicatorAppearance).context
        }
        if let badgeAppearance = props.badgeStyle?.value {
            self.badgeAppearance = ComponentStyleContextBuilder(badgeAppearance).context
        }
        if let counterAppearance = props.counterStyle?.value {
            self.counterAppearance = ComponentStyleContextBuilder(counterAppearance).context
        }
    }
    
//    init() {
//        self.shape = 
//        self.backgroundFillStyle =
//        self.textFillStyle =
//        self.onlineStatusColor =
//        self.offlineStatusColor =
//        self.textTypography =
//    }
}
