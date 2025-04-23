import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ProgressBar {
    public static var Default: ComponentAppearanceVariation<ProgressBar, ProgressBarAppearance> {
        var appearance = ProgressBarAppearance.base
        return .init(
            name: "Default",
            appearance: appearance
        )
    }
    public static let all: [Variation<ProgressBarAppearance>] = [
        ProgressBar.Default.variation
    ]
}

public struct ProgressBarVariation {
}

private extension ProgressBarAppearance {
    static var base: ProgressBarAppearance {
        var appearance = ProgressBarAppearance()
        appearance.tintFillStyle = .color(.clearColor)
        appearance.trackColor = .clearColor
        return appearance
    }
}
