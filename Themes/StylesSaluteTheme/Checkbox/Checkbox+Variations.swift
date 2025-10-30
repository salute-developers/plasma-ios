import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Checkbox, CheckboxAppearance, CheckboxVariation.M> {
    
    var m: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var size =  CheckboxAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.horizontalGap = CGFloat(12.0)
        size.lineWidth = CGFloat(2.0)
        size.toggleCheckedIconHeight = CGFloat(6.0)
        size.toggleCheckedIconWidth = CGFloat(9.0)
        size.toggleIndeterminateIconHeight = CGFloat(2.0)
        size.toggleIndeterminateIconWidth = CGFloat(12.0)
        size.togglePaddings = CGFloat(2.0)
        size.togglePathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        size.verticalGap = CGFloat(2.0)
        size.width = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = CheckboxTypography(m: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Checkbox, CheckboxAppearance, CheckboxVariation.S> {
    
    var s: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var size =  CheckboxAnySize(size: appearance.size)
        size.height = CGFloat(16.0)
        size.horizontalGap = CGFloat(8.0)
        size.lineWidth = CGFloat(1.5)
        size.toggleCheckedIconHeight = CGFloat(4.0)
        size.toggleCheckedIconWidth = CGFloat(6.0)
        size.toggleIndeterminateIconHeight = CGFloat(2.0)
        size.toggleIndeterminateIconWidth = CGFloat(8.0)
        size.togglePaddings = CGFloat(1.0)
        size.togglePathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer
        size.verticalGap = CGFloat(2.0)
        size.width = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = CheckboxTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension CheckboxAppearance {
    
    var `default`: CheckboxAppearance {
        var appearance = self
        appearance.borderColor = ColorToken.outlineDefaultTransparentTertiary
        appearance.toggleColor = ColorToken.surfaceDefaultAccentMain
        appearance.toggleColorChecked = ColorToken.textOnDarkPrimary
        appearance.toggleColorIndeterminate = ColorToken.textOnDarkPrimary
        return appearance
    }
    
}
