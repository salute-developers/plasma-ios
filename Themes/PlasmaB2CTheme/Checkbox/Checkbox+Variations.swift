import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Checkbox, CheckboxAppearance, CheckboxVariation.L> {
    
    var l: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
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
        appearance.subtitleTypography = CheckboxTypography(l: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

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
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
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
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
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
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
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
        appearance.toggleColor = ColorToken.surfaceDefaultAccent
        appearance.toggleColorChecked = ColorToken.textOnDarkPrimary
        appearance.toggleColorIndeterminate = ColorToken.textOnDarkPrimary
        return appearance
    }
    
    var negative: CheckboxAppearance {
        var appearance = self
        appearance.borderColor = ColorToken.outlineDefaultNegative
        appearance.toggleColor = ColorToken.surfaceDefaultNegative
        appearance.toggleColorChecked = ColorToken.textOnDarkPrimary
        appearance.toggleColorIndeterminate = ColorToken.textOnDarkPrimary
        return appearance
    }
    
}
