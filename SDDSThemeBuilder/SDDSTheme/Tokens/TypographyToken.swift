import Foundation

public struct TypographyToken {
    public enum Weight: String {
        case ultraLight
        case thin
        case light
        case regular
        case medium
        case semibold
        case bold
        case heavy
        case black
    }
    
    public enum ScreenSize: String {
        case small
        case medium
        case large
    }
    
    public enum Style: String {
        case normal
    }
    
    public let fontFamily: FontFamilyToken.Heading
    public let weight: Weight
    public let style: Style
    public let size: CGFloat
    public let lineHeight: CGFloat
    public let kerning: CGFloat
}

public struct AdaptiveTypographyToken {
    public let small: TypographyToken
    public let medium: TypographyToken
    public let large: TypographyToken
}
