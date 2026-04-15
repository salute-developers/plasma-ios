import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NavigationBarInternalPage {
    public static var hasBackground: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.Hasbackground> {
        var appearance = NavigationBarInternalPageAppearance.base
        appearance.size = NavigationBarInternalPageSize.hasBackground
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard

        return .init(
            name: "hasBackground",
            appearance: appearance
        )
    }
    public static var noBackground: GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.Nobackground> {
        var appearance = NavigationBarInternalPageAppearance.base
        appearance.size = NavigationBarInternalPageSize.noBackground
        appearance.backgroundColor = ColorToken.surfaceDefaultClear

        return .init(
            name: "noBackground",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NavigationBarInternalPageAppearance>] = [
        NavigationBarInternalPage.hasBackground.variation,
        NavigationBarInternalPage.hasBackground.rounded.variation,
        NavigationBarInternalPage.hasBackground.shadow.variation,
        NavigationBarInternalPage.hasBackground.shadow.rounded.variation,
        NavigationBarInternalPage.noBackground.variation,
        NavigationBarInternalPage.noBackground.rounded.variation,
    ]
}

public struct NavigationBarInternalPageVariation {
    public struct Hasbackground {}
    public struct HasbackgroundRounded {}
    public struct HasbackgroundShadow {}
    public struct HasbackgroundShadowRounded {}
    public struct Nobackground {}
    public struct NobackgroundRounded {}
}

private extension NavigationBarInternalPageAppearance {
    static var base: NavigationBarInternalPageAppearance {
        var appearance = NavigationBarInternalPageAppearance()
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarInternalPageTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        return appearance
    }
}
