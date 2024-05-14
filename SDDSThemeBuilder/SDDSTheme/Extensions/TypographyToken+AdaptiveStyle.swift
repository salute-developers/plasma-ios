import Foundation

public enum AdaptiveStyle {
    case small
    case medium
    case large
}

public extension AdaptiveTypographyToken {
    func typographyToken(for style: AdaptiveStyle) -> TypographyToken {
        switch style {
        case .small:
            small
        case .medium:
            medium
        case .large:
            large
        }
    }
}
