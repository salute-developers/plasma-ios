import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NavigationBarInternalPage {
    public static var hasBackground: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarAppearance, NavigationBarInternalPageVariation.Hasbackground> {
        var appearance = NavigationBarAppearance.base
        appearance.size = NavigationBarInternalPageSize.hasBackground
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard

        return .init(
            name: "hasBackground",
            appearance: appearance
        )
    }
    public static var noBackground: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarAppearance, NavigationBarInternalPageVariation.Nobackground> {
        var appearance = NavigationBarAppearance.base
        appearance.size = NavigationBarInternalPageSize.noBackground
        appearance.backgroundColor = ColorToken.surfaceDefaultClear

        return .init(
            name: "noBackground",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<NavigationBarAppearance>] {
        [
            NavigationBarInternalPage.hasBackground.variation,
            NavigationBarInternalPage.hasBackground.rounded.variation,
            NavigationBarInternalPage.hasBackground.shadow.variation,
            NavigationBarInternalPage.hasBackground.shadow.rounded.variation,
            NavigationBarInternalPage.noBackground.variation,
            NavigationBarInternalPage.noBackground.rounded.variation,
        ]
    }
}

public struct NavigationBarInternalPageVariation {
    public struct Hasbackground {}
    public struct HasbackgroundRounded {}
    public struct HasbackgroundShadow {}
    public struct HasbackgroundShadowRounded {}
    public struct Nobackground {}
    public struct NobackgroundRounded {}
}

private extension NavigationBarAppearance {
    static var base: NavigationBarAppearance {
        var appearance = NavigationBarAppearance()
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        return appearance
    }
}
