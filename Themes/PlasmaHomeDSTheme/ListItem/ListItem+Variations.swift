import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<ListItem, ListItemAppearance, ListItemVariation.S> {
    
    var s: ComponentAppearanceVariation<ListItem, ListItemAppearance> {
        var size =  ListItemAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(12.0)
        size.height = CGFloat(48.0)
        size.paddingBottom = CGFloat(10.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(10.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<ListItem, ListItemAppearance> {
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
