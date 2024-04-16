import Foundation

enum StencilTemplate: String {
    case color = "ColorToken.stencil"
}

extension StencilTemplate {
    var filename: String {
        switch self {
        case .color:
            "ColorToken.swift"
        }
    }
}
