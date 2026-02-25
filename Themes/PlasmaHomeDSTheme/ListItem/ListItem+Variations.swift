import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<ListItem, ListItemAppearance, ListItemVariation.S> {
    
    var hasBackground: ComponentAppearanceVariation<ListItem, ListItemAppearance> {
        var size =  ListItemAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(10.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(10.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentPrimary, highlightedColor: ColorToken.surfaceDefaultTransparentPrimary, hoveredColor: ColorToken.surfaceDefaultTransparentPrimary, selectedColor: .clearColor)
    
        return .init(
            name: "s.hasBackground",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<ListItem, ListItemAppearance, ListItemVariation.S> {
        var size =  ListItemAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(12.0)
        size.contentPaddingStart = CGFloat(12.0)
        size.height = CGFloat(48.0)
        size.paddingBottom = CGFloat(10.0)
        size.paddingEnd = CGFloat(0.0)
        size.paddingStart = CGFloat(0.0)
        size.paddingTop = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.labelTypography = ListItemTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.subtitleTypography = ListItemTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
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

public extension GeneralAppearanceVariation<ListItem, ListItemAppearance, ListItemVariation.SHasbackground> {
    
    var hasBackground: ComponentAppearanceVariation<ListItem, ListItemAppearance> {
        var size =  ListItemAnySize(size: appearance.size)
        size.paddingBottom = CGFloat(10.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(10.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentPrimary, highlightedColor: ColorToken.surfaceDefaultTransparentPrimary, hoveredColor: ColorToken.surfaceDefaultTransparentPrimary, selectedColor: .clearColor)
    
        return .init(
            name: "s.hasBackground",
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
