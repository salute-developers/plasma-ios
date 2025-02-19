import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Cell {
    public static var l: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.l
        appearance.avatarAppearance = Avatar.l.appearance
        appearance.checkboxAppearance = Checkbox.m.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline24.image
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.buttonAppearance = IconButton.l.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.m.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.switchAppearance = Switch.l.appearance
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.m
        appearance.avatarAppearance = Avatar.m.appearance
        appearance.checkboxAppearance = Checkbox.m.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline24.image
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.buttonAppearance = IconButton.m.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.m.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.switchAppearance = Switch.m.appearance
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.s
        appearance.avatarAppearance = Avatar.s.appearance
        appearance.checkboxAppearance = Checkbox.s.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline16.image
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.buttonAppearance = IconButton.s.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.s.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.switchAppearance = Switch.s.appearance
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.xs
        appearance.avatarAppearance = Avatar.s.appearance
        appearance.checkboxAppearance = Checkbox.s.appearance
        appearance.disclosureImage = Asset.disclosureRightOutline16.image
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.buttonAppearance = IconButton.xs.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.radioboxAppearance = Radiobox.s.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.switchAppearance = Switch.s.appearance
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CellAppearance>] = [
        Cell.l.variation,
        Cell.m.variation,
        Cell.s.variation,
        Cell.xs.variation,
    ]
}

public struct CellVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension CellAppearance {
    static var base: CellAppearance {
        var appearance = CellAppearance()
        appearance.disclosureTextColor = ColorToken.textDefaultSecondary
        appearance.labelColor = ColorToken.textDefaultSecondary
        appearance.subtitleColor = ColorToken.textDefaultSecondary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
