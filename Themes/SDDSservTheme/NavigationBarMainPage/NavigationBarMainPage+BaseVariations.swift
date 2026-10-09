import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NavigationBarMainPage {
    public static var hasBackground: GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarAppearance, NavigationBarMainPageVariation.Hasbackground> {
        var appearance = NavigationBarAppearance.base
        appearance.size = NavigationBarMainPageSize.hasBackground
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard

        return .init(
            name: "hasBackground",
            appearance: appearance
        )
    }
    public static var noBackground: GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarAppearance, NavigationBarMainPageVariation.Nobackground> {
        var appearance = NavigationBarAppearance.base
        appearance.size = NavigationBarMainPageSize.noBackground
        appearance.backgroundColor = ColorToken.surfaceDefaultClear

        return .init(
            name: "noBackground",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<NavigationBarAppearance>] {
        [
            NavigationBarMainPage.hasBackground.variation,
            NavigationBarMainPage.hasBackground.rounded.variation,
            NavigationBarMainPage.hasBackground.shadow.variation,
            NavigationBarMainPage.hasBackground.shadow.rounded.variation,
            NavigationBarMainPage.noBackground.variation,
            NavigationBarMainPage.noBackground.rounded.variation,
        ]
    }
}

public struct NavigationBarMainPageVariation {
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
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarMainPageTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        return appearance
    }
}
