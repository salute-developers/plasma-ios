import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Divider {
    public static var `default`: ComponentAppearanceVariation<Divider, DividerAppearance> {
        var appearance = DividerAppearance.base
        appearance.size = DividerSize.`default`
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentTertiary
        appearance.shape = CircleDrawer() as PathDrawer
        appearance.thickness = CGFloat(1.0)

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<DividerAppearance>] = [
        Divider.default.variation,
    ]
}

public struct DividerVariation {
    public struct Default {}
}

private extension DividerAppearance {
    static var base: DividerAppearance {
        var appearance = DividerAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentTertiary
        appearance.shape = CircleDrawer() as PathDrawer
        appearance.thickness = CGFloat(1.0)
        return appearance
    }
}
