import Foundation

struct AvatarAppearance: CodeGenerationAppearance {
    typealias Variation = AvatarConfiguration.Variation
    typealias Props = AvatarProps
    
    var backgroundFillStyle: String? = nil
    var textFillStyle: String? = nil
    var onlineStatusColor: String? = nil
    var offlineStatusColor: String? = nil
    var textTypography: String? = nil
    var indicatorAppearance: String? = nil
    var badgeAppearance: String? = nil
    var counterAppearance: String? = nil
    var backgroundOpacity: String? = nil
    
    init(variation: AvatarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: AvatarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.backgroundFillStyle = FillStyleContextBuilder(props.background, hasDefault: false).context
        self.backgroundOpacity = CGFloatContextBuilder(props.background?.alpha, nullify: true).context
        self.textFillStyle = FillStyleContextBuilder(props.textColor, hasDefault: false).context
        self.onlineStatusColor = ColorTokenContextBuilder(props.activeStatusColor, hasDefault: false).context
        self.offlineStatusColor = ColorTokenContextBuilder(props.inactiveStatusColor, hasDefault: false).context
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
}
