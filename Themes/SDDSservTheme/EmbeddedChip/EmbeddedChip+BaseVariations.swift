import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct EmbeddedChip {
    public static var xl: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var appearance = ChipAppearance.base
        appearance.size = EmbeddedChipSize.xl
        appearance.titleTypography = EmbeddedChipTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
    public static var l: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var appearance = ChipAppearance.base
        appearance.size = EmbeddedChipSize.l
        appearance.titleTypography = EmbeddedChipTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var appearance = ChipAppearance.base
        appearance.size = EmbeddedChipSize.m
        appearance.titleTypography = EmbeddedChipTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var appearance = ChipAppearance.base
        appearance.size = EmbeddedChipSize.s
        appearance.titleTypography = EmbeddedChipTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<EmbeddedChip, ChipAppearance> {
        var appearance = ChipAppearance.base
        appearance.size = EmbeddedChipSize.xs
        appearance.titleTypography = EmbeddedChipTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ChipAppearance>] = [
        EmbeddedChip.xl.variation,
        EmbeddedChip.l.variation,
        EmbeddedChip.m.variation,
        EmbeddedChip.s.variation,
        EmbeddedChip.xs.variation,
    ]
}

public struct EmbeddedChipVariation {
    public struct Xl {}
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension ChipAppearance {
    static var base: ChipAppearance {
        var appearance = ChipAppearance()
        appearance.disabledAlpha = CGFloat(0.5)
        return appearance
    }
}
