import Foundation
import SwiftUI
import SDDSThemeCore

public enum FillStyle: Hashable {
    case color(ColorToken)
    case gradient(GradientToken)
    
    public static func == (lhs: FillStyle, rhs: FillStyle) -> Bool {
        switch (lhs, rhs) {
        case (.color(let lhsColor), .color(let rhsColor)):
            return lhsColor == rhsColor
        case (.gradient(let lhsGradient), .gradient(let rhsGradient)):
            return lhsGradient == rhsGradient
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .color(let color):
            hasher.combine(color)
        case .gradient(let gradient):
            hasher.combine(gradient)
        }
    }
}

public extension FillStyle {
    func withOpacity(_ opacity: CGFloat) -> FillStyle {
        switch self {
        case .color(let colorToken):
            return .color(colorToken.withOpacity(opacity))
        case .gradient(let gradientToken):
            return .gradient(gradientToken)
        }
    }

    /// Возвращает репрезентативный сплошной цвет для контекстов, которые не умеют рисовать градиент
    /// (например, цветовые стопы `AngularGradient`). Для градиента берётся его первый фоновый цвет.
    func representativeColor(for colorScheme: ColorScheme, subtheme: SubthemeData = SubthemeData()) -> Color {
        switch self {
        case .color(let colorToken):
            return colorToken.color(for: colorScheme, subtheme: subtheme)
        case .gradient(let gradientToken):
            return gradientToken.backgrounds(for: colorScheme).first ?? .clear
        }
    }
}
