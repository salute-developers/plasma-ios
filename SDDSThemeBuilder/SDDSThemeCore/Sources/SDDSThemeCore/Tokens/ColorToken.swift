import SwiftUI

public struct ColorToken: Hashable {
    /// Цвет для тёмной темы
    public let darkColor: Color
        
    /// Цвет для светлой темы
    public let lightColor: Color
    
    public init(darkColor: Color, lightColor: Color) {
        self.darkColor = darkColor
        self.lightColor = lightColor
    }
    
    public static func == (lhs: ColorToken, rhs: ColorToken) -> Bool {
        lhs.darkColor == rhs.darkColor &&
        lhs.lightColor == rhs.lightColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(darkColor)
        hasher.combine(lightColor)
    }
}

extension ColorToken: Hashable {
    public static func ==(lhs: ColorToken, rhs: ColorToken) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
