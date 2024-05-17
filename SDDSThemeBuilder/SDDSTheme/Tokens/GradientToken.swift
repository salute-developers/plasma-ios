import Foundation
import SwiftUI

public struct LinearGradient {
    public let locations: [CGFloat]
    public let colors: [Color]
    public let angle: CGFloat
}

public struct RadialGradient {
    public let locations: [CGFloat]
    public let colors: [Color]
    public let startPoint: CGPoint
    public let endPoint: CGPoint
}

public struct AngularGradient {
    public let locations: [CGFloat]
    public let colors: [Color]
    public let startAngle: CGFloat
    public let endAngle: CGPoint
    public let center: CGPoint
}

public struct PlainColor {
    public let background: Color
}

public enum GradientKind {
    case linear(LinearGradient)
    case angular(AngularGradient)
    case radial(RadialGradient)
    case color(PlainColor)
}

public struct GradientToken {
    public let darkGradients: [GradientKind]
    public let lightGradients: [GradientKind]
}
