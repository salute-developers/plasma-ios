import Foundation

@_exported import SDDSservTheme
import SwiftUI

public extension ProgressBarAppearance {
    static var accent: ProgressBarAppearance {
        .init(
            tintFillStyle: .color(ColorToken.surfaceDefaultAccent),
            trackColor: ColorToken.surfaceDefaultTransparentSecondary
        )
    }
    
    static var gradientAccent: ProgressBarAppearance {
        .init(
            tintFillStyle: .gradient(GradientToken.surfaceDefaultAccentGradient),
            trackColor: ColorToken.surfaceDefaultTransparentSecondary
        )
    }
}

