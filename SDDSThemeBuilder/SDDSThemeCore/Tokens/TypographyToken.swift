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
        case normal
    }
    
    public enum ScreenSize: String {
        case small
        case medium
        case large
    }
    
    public enum Style: String {
        case normal
        case italic
    }
    
    public let fontName: String
    public let weight: Weight
    public let style: Style
    public let size: CGFloat
    public let lineHeight: CGFloat
    public let kerning: CGFloat
    
    public init(fontName: String, weight: Weight, style: Style, size: CGFloat, lineHeight: CGFloat, kerning: CGFloat) {
        self.fontName = fontName
        self.weight = weight
        self.style = style
        self.size = size
        self.lineHeight = lineHeight
        self.kerning = kerning
    }
}

public struct AdaptiveTypographyToken {
    public let small: TypographyToken
    public let medium: TypographyToken
    public let large: TypographyToken
    
    public init(small: TypographyToken, medium: TypographyToken, large: TypographyToken) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

extension TypographyToken: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(fontName)
        hasher.combine(weight)
        hasher.combine(style)
        hasher.combine(size)
        hasher.combine(lineHeight)
        hasher.combine(kerning)
    }
}

extension AdaptiveTypographyToken: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(small)
        hasher.combine(medium)
        hasher.combine(large)
    }
}
