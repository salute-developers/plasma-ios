import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<TabBar, TabBarIslandAppearance, TabBarVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<TabBar, TabBarIslandAppearance> {
        var size =  TabBarAnySize(size: appearance.size)
        size.bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxl.cornerRadius) as PathDrawer
        size.contentPaddingBottom = CGFloat(2.0)
        size.contentPaddingEnd = CGFloat(8.0)
        size.contentPaddingStart = CGFloat(8.0)
        size.contentPaddingTop = CGFloat(2.0)
        size.itemSpacing = CGFloat(8.0)
        size.paddingEnd = CGFloat(48.0)
        size.paddingStart = CGFloat(48.0)
        size.topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.tabBarItemAppearance = TabBarItem.default.appearance
    
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


public extension ComponentAppearanceVariation<TabBar, TabBarIslandAppearance> {
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

private extension TabBarIslandAppearance {
    
}
