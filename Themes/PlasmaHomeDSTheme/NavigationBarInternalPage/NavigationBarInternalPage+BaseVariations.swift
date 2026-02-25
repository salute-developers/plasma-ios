import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NavigationBarInternalPage {
    public static var `default`: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var appearance = NavigationBarInternalPageAppearance.base
        appearance.size = NavigationBarInternalPageSize.`default`
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NavigationBarInternalPageAppearance>] = [
        NavigationBarInternalPage.default.variation,
    ]
}

public struct NavigationBarInternalPageVariation {
    public struct Default {}
}

private extension NavigationBarInternalPageAppearance {
    static var base: NavigationBarInternalPageAppearance {
        var appearance = NavigationBarInternalPageAppearance()
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        return appearance
    }
}
