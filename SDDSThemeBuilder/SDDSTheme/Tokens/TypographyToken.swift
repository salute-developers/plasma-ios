import Foundation

public struct TypographyToken {
    public enum Weight: String {
        case semibold
        case light
        case regular
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
