import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NavigationBarMainPage {
    public static var `default`: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarAppearance> {
        var appearance = NavigationBarAppearance.base
        appearance.size = NavigationBarMainPageSize.`default`
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<NavigationBarAppearance>] {
        [
            NavigationBarMainPage.default.variation,
        ]
    }
}

public struct NavigationBarMainPageVariation {
    public struct Default {}
}

private extension NavigationBarAppearance {
    static var base: NavigationBarAppearance {
        var appearance = NavigationBarAppearance()
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        return appearance
    }
}
