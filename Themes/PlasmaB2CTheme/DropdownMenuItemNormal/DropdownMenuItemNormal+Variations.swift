import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.L> {
    
    var l: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var size =  DropdownMenuItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(56.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(16.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.M> {
    
    var m: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var size =  DropdownMenuItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(48.0)
        size.paddingBottom = CGFloat(12.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.S> {
    
    var s: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var size =  DropdownMenuItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.height = CGFloat(40.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(11.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.Xl> {
    
    var xl: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var size =  DropdownMenuItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.height = CGFloat(64.0)
        size.paddingBottom = CGFloat(20.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.paddingTop = CGFloat(20.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(xl: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
        var size =  DropdownMenuItemNormalAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.height = CGFloat(32.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.disclosureIcon = Asset.disclosureRightOutline16.image
        appearance.titleTypography = DropdownMenuItemNormalTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ListItemAppearance {
    
    var `default`: ListItemAppearance {
        var appearance = self
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
    
    var negative: ListItemAppearance {
        var appearance = self
        appearance.titleColor = ColorToken.textDefaultNegative
        return appearance
    }
    
    var positive: ListItemAppearance {
        var appearance = self
        appearance.titleColor = ColorToken.textDefaultPositive
        return appearance
    }
    
}
