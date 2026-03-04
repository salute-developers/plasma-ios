import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NavigationBarMainPage {
    public static var `default`: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var appearance = NavigationBarMainPageAppearance.base
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
    
    public static let all: [Variation<NavigationBarMainPageAppearance>] = [
        NavigationBarMainPage.default.variation,
    ]
}

public struct NavigationBarMainPageVariation {
    public struct Default {}
}

private extension NavigationBarMainPageAppearance {
    static var base: NavigationBarMainPageAppearance {
        var appearance = NavigationBarMainPageAppearance()
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        return appearance
    }
}
