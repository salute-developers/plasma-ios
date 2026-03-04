import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance, NavigationBarInternalPageVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
        var size =  NavigationBarInternalPageAnySize(size: appearance.size)
        size.backIconMargin = CGFloat(4.0)
        size.horizontalSpacing = CGFloat(8.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(8.0)
        size.textBlockTopMargin = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionEndColor = ColorToken.textDefaultPrimary
        appearance.actionStartColor = ColorToken.textDefaultPrimary
        appearance.backIcon = Asset.disclosureLeftOutline24.image
        appearance.backIconColor = ColorToken.textDefaultPrimary
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarInternalPageTypography(default: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
    
        return .init(
            name: "default",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<NavigationBarInternalPage, NavigationBarInternalPageAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension NavigationBarInternalPageAppearance {
    
}
