import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance, NavigationBarMainPageVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
        var size =  NavigationBarMainPageAnySize(size: appearance.size)
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
        appearance.backgroundColor = ColorToken.surfaceDefaultClear
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.textTypography = NavigationBarMainPageTypography(default: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<NavigationBarMainPage, NavigationBarMainPageAppearance> {
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

private extension NavigationBarMainPageAppearance {
    
}
