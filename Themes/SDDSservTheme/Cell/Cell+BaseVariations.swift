import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct Cell {
    public static var l: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.l
        appearance.avatarAppearance = SDDSAvatar.large.appearance
//        appearance.checkBoxAppearance = SDDSCheckbox.medium.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.iconButtonAppearance = IconButton.l.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
//        appearance.radioBoxAppearance = SDDSRadiobox.medium.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.switchAppearance = SDDSSwitch.large.appearance
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.m
        appearance.avatarAppearance = SDDSAvatar.medium.appearance
//        appearance.checkBoxAppearance = SDDSCheckbox.medium.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.iconButtonAppearance = IconButton.m.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
//        appearance.radioBoxAppearance = SDDSRadiobox.medium.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.switchAppearance = SDDSSwitch.medium.appearance
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.s
        appearance.avatarAppearance = SDDSAvatar.small.appearance
//        appearance.checkBoxAppearance = SDDSCheckbox.small.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.iconButtonAppearance = IconButton.s.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
//        appearance.radioBoxAppearance = SDDSRadiobox.small.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.switchAppearance = SDDSSwitch.small.appearance
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.xs
        appearance.avatarAppearance = SDDSAvatar.small.appearance
//        appearance.checkBoxAppearance = SDDSCheckbox.small.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.iconButtonAppearance = IconButton.xs.clear.appearance
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
//        appearance.radioBoxAppearance = SDDSRadiobox.small.appearance
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.switchAppearance = SDDSSwitch.small.appearance
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
        return appearance
    }
}
