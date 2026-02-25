import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<ListNumberedItem, ListItemAppearance, ListNumberedItemVariation.S> {
    
    var s: ComponentAppearanceVariation<ListNumberedItem, ListItemAppearance> {
        var size =  ListNumberedItemAnySize(size: appearance.size)
        size.contentPaddingStart = CGFloat(6.0)
        size.paddingBottom = CGFloat(0.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.paddingTop = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.xs.secondary.appearance
        appearance.titleTypography = ListNumberedItemTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
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


public extension ComponentAppearanceVariation<ListNumberedItem, ListItemAppearance> {
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

private extension ListItemAppearance {
    
}
