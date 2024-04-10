import Foundation

public enum AdaptiveStyle {
    case small
    case medium
    case large
}

public extension AdaptiveTypographyToken {
    func token(for style: AdaptiveStyle) -> TypographyToken {
        switch style {
        case .small:
            small
        case .medium:
            medium
        case .large:
            large
        }
    }

    var tokens: [TypographyToken] {
        [small, medium, large]
    }
    
}

public extension AdaptiveTypographyToken {
    var dynamicStarTypography: TypographyToken {
        token(for: Device.size.adaptiveStyle)
    }
}
