import Foundation
import SwiftUI

public struct LinearGradient {
    public let locations: [CGFloat]
    public let colors: [Color]
    public let angle: CGFloat
    
    public init(locations: [CGFloat], colors: [Color], angle: CGFloat) {
        self.locations = locations
        self.colors = colors
        self.angle = angle
    }
}

public struct RadialGradient {
    public let locations: [CGFloat]
    public let colors: [Color]
    public let center: CGPoint
    public let startRadius: CGFloat
    public let endRadius: CGFloat
    
    init(locations: [CGFloat], colors: [Color], center: CGPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.locations = locations
        self.colors = colors
        self.center = center
        self.startRadius = startRadius
        self.endRadius = endRadius
    }
}

public struct AngularGradient {
    public let locations: [CGFloat]
    public let colors: [Color]
    public let startAngle: CGFloat
    public let endAngle: CGFloat
    public let center: CGPoint
    
    public init(locations: [CGFloat], colors: [Color], startAngle: CGFloat, endAngle: CGFloat, center: CGPoint) {
        self.locations = locations
        self.colors = colors
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.center = center
    }
}

public struct PlainColor {
    public let background: Color
    
    public init(background: Color) {
        self.background = background
    }
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
    
    public init(description: String, darkGradients: [GradientKind], lightGradients: [GradientKind]) {
        self.description = description
        self.darkGradients = darkGradients
        self.lightGradients = lightGradients
    }
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
        hasher.combine(center.x)
        hasher.combine(center.y)
        hasher.combine(startRadius)
        hasher.combine(endRadius)
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
