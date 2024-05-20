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
    public let endAngle: CGFloat
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
    public let description: String
    public let darkGradients: [GradientKind]
    public let lightGradients: [GradientKind]
}

extension GradientToken: CustomDebugStringConvertible {
    public var debugDescription: String {
        description
    }
}

extension GradientToken: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(darkGradients)
        hasher.combine(lightGradients)
    }
}

extension GradientKind: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .angular(let data):
            hasher.combine(data)
        case .linear(let data):
            hasher.combine(data)
        case .radial(let data):
            hasher.combine(data)
        case .color(let data):
            hasher.combine(data)
        }
    }
}

extension LinearGradient: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(locations)
        hasher.combine(colors)
        hasher.combine(angle)
    }
}

extension RadialGradient: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(locations)
        hasher.combine(colors)
        hasher.combine(startPoint.x)
        hasher.combine(startPoint.y)
        hasher.combine(endPoint.x)
        hasher.combine(endPoint.y)
    }
}

extension AngularGradient: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(locations)
        hasher.combine(colors)
        hasher.combine(startAngle)
        hasher.combine(endAngle)
        hasher.combine(center.x)
        hasher.combine(center.y)
    }
}

extension PlainColor: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(background)
    }
}
