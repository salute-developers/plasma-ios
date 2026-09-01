import Foundation
import SwiftUI
import UIKit

public extension TypographyToken {
    var font: SwiftUI.Font {
        if isSystemFont {
            return .system(size: size, weight: weight.sui)
        }
        return .custom(fontName, size: size)
    }

    var uiFont: UIFont {
        if isSystemFont {
            return .systemFont(ofSize: size, weight: weight.uiKitWeight)
        }
        guard let font = UIFont(name: fontName, size: size) else {
            print("Font is not accessible")
            return .systemFont(ofSize: size, weight: weight.uiKitWeight)
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

    /// UIKit-эквивалент `sui`. Применяется для `UIFont.systemFont(ofSize:weight:)`
    /// при использовании системного шрифта в качестве sentinel'а `"SF Pro"`.
    var uiKitWeight: UIFont.Weight {
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
