import Foundation

public enum AdaptiveStyle {
    case small
    case medium
    case large
}

public extension AdaptiveTypographyToken {
    /// Возвращает токен в зависимости от стиля.
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

    /// Возвращает tuple со всеми возможными токенами.
    var tokens: [TypographyToken] {
        [small, medium, large]
    }
    
}

public extension AdaptiveTypographyToken {
    /// Возвращает токен для текущего размера экрана, который определяется автоматически
    var typography: TypographyToken {
        token(for: Device.size.adaptiveStyle)
    }
}
