import SwiftUI

public struct ColorToken {
    /// Цвет для тёмной темы
    public let darkColor: Color
        
    /// Цвет для светлой темы
    public let lightColor: Color
    
    public init(darkColor: Color, lightColor: Color) {
        self.darkColor = darkColor
        self.lightColor = lightColor
    }
}
