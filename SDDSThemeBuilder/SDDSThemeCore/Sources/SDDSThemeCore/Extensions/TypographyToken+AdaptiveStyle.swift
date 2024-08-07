import Foundation

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
