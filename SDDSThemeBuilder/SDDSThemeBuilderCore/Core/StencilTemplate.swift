import Foundation

enum StencilTemplate: String {
    case color = "ColorToken.stencil"
    case shape = "ShapeToken.stencil"
    case shadow = "ShadowToken.stencil"
}

extension StencilTemplate {
    var filename: String {
        switch self {
        case .color:
            "ColorToken.swift"
        case .shape:
            "ShapeToken.swift"
        case .shadow:
            "ShadowToken.swift"
        }
    }
}
