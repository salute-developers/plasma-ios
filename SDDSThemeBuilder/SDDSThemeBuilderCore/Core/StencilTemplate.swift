import Foundation

enum StencilTemplate: String {
    case color = "ColorToken"
    case shape = "ShapeToken"
    case shadow = "ShadowToken"
    case typography = "TypographyToken"
    
    var withStencilExt: String {
        rawValue + ".stencil"
    }
}

extension StencilTemplate {
    var filename: String {
        return "\(rawValue)+Generated.swift"
    }
}
