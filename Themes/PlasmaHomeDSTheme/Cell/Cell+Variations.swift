import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Cell, CellAppearance, CellVariation.L> {
    
    var l: ComponentAppearanceVariation<Cell, CellAppearance> {
        var size =  CellAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.contentPaddingStart = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.avatarAppearance = Avatar.l.appearance
        appearance.buttonAppearance = IconButton.l.clear.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline24.image
        appearance.disclosureTextTypography = CellTypography(l: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.labelTypography = CellTypography(l: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.m.appearance
        appearance.subtitleTypography = CellTypography(l: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.switchAppearance = Switch.l.appearance
        appearance.titleTypography = CellTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
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

public extension GeneralAppearanceVariation<Cell, CellAppearance, CellVariation.M> {
    
    var m: ComponentAppearanceVariation<Cell, CellAppearance> {
        var size =  CellAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(8.0)
        size.contentPaddingStart = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.avatarAppearance = Avatar.m.appearance
        appearance.buttonAppearance = IconButton.m.clear.appearance
        appearance.checkboxAppearance = Checkbox.m.default.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline24.image
        appearance.disclosureTextTypography = CellTypography(m: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.labelTypography = CellTypography(m: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.m.appearance
        appearance.subtitleTypography = CellTypography(m: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.switchAppearance = Switch.m.appearance
        appearance.titleTypography = CellTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
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

public extension GeneralAppearanceVariation<Cell, CellAppearance, CellVariation.S> {
    
    var s: ComponentAppearanceVariation<Cell, CellAppearance> {
        var size =  CellAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.contentPaddingStart = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.avatarAppearance = Avatar.s.appearance
        appearance.buttonAppearance = IconButton.s.clear.appearance
        appearance.checkboxAppearance = Checkbox.s.default.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline16.image
        appearance.disclosureTextTypography = CellTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelTypography = CellTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.s.appearance
        appearance.subtitleTypography = CellTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.switchAppearance = Switch.s.appearance
        appearance.titleTypography = CellTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<Cell, CellAppearance, CellVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<Cell, CellAppearance> {
        var size =  CellAnySize(size: appearance.size)
        size.contentPaddingEnd = CGFloat(6.0)
        size.contentPaddingStart = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.avatarAppearance = Avatar.s.appearance
        appearance.buttonAppearance = IconButton.s.clear.appearance
        appearance.checkboxAppearance = Checkbox.s.default.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline16.image
        appearance.disclosureTextTypography = CellTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.labelTypography = CellTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.s.appearance
        appearance.subtitleTypography = CellTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.switchAppearance = Switch.s.appearance
        appearance.titleTypography = CellTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs",
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


public extension ComponentAppearanceVariation<Cell, CellAppearance> {
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

private extension CellAppearance {
    
}
