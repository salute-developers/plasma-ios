import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NavigationBarInternalPage {
    public static var `default`: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarAppearance> {
        var appearance = NavigationBarAppearance.base
        appearance.size = NavigationBarInternalPageSize.`default`
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.chevronLeft24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<NavigationBarAppearance>] {
        [
            NavigationBarInternalPage.default.variation,
        ]
    }
}

public struct NavigationBarInternalPageVariation {
    public struct Default {}
}

private extension NavigationBarAppearance {
    static var base: NavigationBarAppearance {
        var appearance = NavigationBarAppearance()
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.chevronLeft24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        return appearance
    }
}
