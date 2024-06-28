import Foundation
import SwiftUI
import UIKit

public extension TypographyToken {
    var font: SwiftUI.Font {
        .custom(fontName, size: size)
    }
    
    var uiFont: UIFont {
        guard let font = UIFont(name: fontName, size: size) else {
            fatalError("Font is not accessible")
        }
        return font
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
