import Foundation

extension ScreenSize {
    var tokenValue: TypographyToken.ScreenSize {
        switch self {
        case .small:
            .small
        case .medium:
            .medium
        case .large:
            .large
        }
    }
}
