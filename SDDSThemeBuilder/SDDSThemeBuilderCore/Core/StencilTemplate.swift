import Foundation

enum StencilTemplate: String {
    case colorToken = "ColorToken"
    case shapeToken = "ShapeToken"
    case shadowToken = "ShadowToken"
    case typographyToken = "TypographyToken"
    case gradientToken = "GradientToken"
    case colors = "Colors"
    case shapes = "Shapes"
    case shadows = "Shadows"
    case typographies = "Typographies"
    case gradients = "Gradients"
    
    var withStencilExt: String {
        rawValue + ".stencil"
    }
}

extension StencilTemplate {
    var filename: String {
        return "\(rawValue)+Generated.swift"
    }
}
