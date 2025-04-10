import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ProgressBar {
    
    public static let all: [Variation<ProgressBarAppearance>] = [
    ]
}

public struct ProgressBarVariation {
}

private extension ProgressBarAppearance {
    static var base: ProgressBarAppearance {
        var appearance = ProgressBarAppearance()
        appearance.cornerRadius = CircleDrawer() as PathDrawer
        appearance.height = CGFloat(4.0)
        appearance.indicatorCornerRadius = CircleDrawer() as PathDrawer
        appearance.indicatorHeight = CGFloat(4.0)
        appearance.tintFillStyle = .color(.clearColor)
        appearance.trackColor = .clearColor
        return appearance
    }
}
