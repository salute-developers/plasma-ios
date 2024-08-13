import SwiftUI

public struct ColorToken { 
    public let id: String
    
    /// Цвет для тёмной темы
    public let darkColor: Color
        
    /// Цвет для светлой темы
    public let lightColor: Color
    
    public init(id: String = "", darkColor: Color, lightColor: Color) {
        self.id = id
        self.darkColor = darkColor
        self.lightColor = lightColor
    }
}
