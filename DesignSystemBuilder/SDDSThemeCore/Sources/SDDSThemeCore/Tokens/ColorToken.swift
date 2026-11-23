import SwiftUI

public struct ColorToken: Hashable {
    public let id: String
    
    /// Цвет для тёмной темы
    public let darkColor: Color
        
    /// Цвет для светлой темы
    public let lightColor: Color
    
    public init(id: String = "", darkColor: Color = .clear, lightColor: Color = .clear) {
        self.id = id
        self.darkColor = darkColor
        self.lightColor = lightColor
    }
    
    public static func == (lhs: ColorToken, rhs: ColorToken) -> Bool {
        lhs.id == rhs.id &&
        lhs.darkColor == rhs.darkColor &&
        lhs.lightColor == rhs.lightColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(darkColor)
        hasher.combine(lightColor)
    }
}

public typealias StatefulColor = StatefulValue<ColorToken>

public extension StatefulValue where Value == ColorToken {
    init() {
        self.init(defaultValue: ColorToken())
    }

    func color(
        for activeStates: Set<InteractiveState>,
        colorScheme: ColorScheme,
        subtheme: SubthemeData = SubthemeData()
    ) -> Color {
        _ = subtheme
        return resolvedValue(for: activeStates).color(for: colorScheme)
    }
}
