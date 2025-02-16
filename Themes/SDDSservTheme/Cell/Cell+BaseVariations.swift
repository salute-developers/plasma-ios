import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct Cell {
    public static var l: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.l
        appearance.avatarAppearance = SDDSAvatar.l.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.m
        appearance.avatarAppearance = SDDSAvatar.m.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.s
        appearance.avatarAppearance = SDDSAvatar.s.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = CellTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<Cell, CellAppearance> {
        var appearance = CellAppearance.base
        appearance.size = CellSize.xs
        appearance.avatarAppearance = SDDSAvatar.s.appearance
        appearance.disclosureTextTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.labelTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.subtitleTypography = CellTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
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
