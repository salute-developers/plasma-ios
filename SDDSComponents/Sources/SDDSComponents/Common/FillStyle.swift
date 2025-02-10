import Foundation
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
