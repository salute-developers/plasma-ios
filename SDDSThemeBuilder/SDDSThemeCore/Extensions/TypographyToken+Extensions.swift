import Foundation
import SwiftUI
import UIKit

public extension TypographyToken {
    var font: SwiftUI.Font {
        if isSystemFont {
            return .system(size: size)
        }
        return .custom(fontName, size: size)
    }
    
    var uiFont: UIFont {
        if isSystemFont {
            return .systemFont(ofSize: size)
        }
        guard let font = UIFont(name: fontName, size: size) else {
            fatalError("Font is not accessible")
        }
        return font
    }
    
    private var isSystemFont: Bool {
        fontName == "SF Pro"
    }
}

public extension TypographyToken.Weight {
    var sui: SwiftUI.Font.Weight {
        switch self {
        case .black:
            .black
        case .bold:
            .bold
        case .heavy:
            .heavy
        case .light:
            .light
        case .medium:
            .medium
        case .regular, .normal:
            .regular
        case .semibold:
            .semibold
        case .thin:
            .thin
        case .ultraLight:
            .ultraLight
        }
    }
}
