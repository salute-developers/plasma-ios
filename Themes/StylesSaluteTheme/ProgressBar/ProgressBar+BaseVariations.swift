import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ProgressBar {
    public static var Default: GeneralAppearanceVariation<ProgressBar, ProgressBarAppearance, ProgressBarVariation.Default> {
        var appearance = ProgressBarAppearance.base
        appearance.size = ProgressBarSize.Default
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.tintFillStyle = .color(.clearColor)
        appearance.trackColor = .clearColor

        return .init(
            name: "Default",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ProgressBarAppearance>] = [
        ProgressBar.Default.variation,
    ]
}

public struct ProgressBarVariation {
    public struct Default {}
}

private extension ProgressBarAppearance {
    static var base: ProgressBarAppearance {
        var appearance = ProgressBarAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.tintFillStyle = .color(.clearColor)
        appearance.trackColor = .clearColor
        return appearance
    }
}
