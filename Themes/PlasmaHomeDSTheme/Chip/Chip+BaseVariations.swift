import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Chip {
    public static var l: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.L> {
        var appearance = ChipAppearance.base
        appearance.size = ChipSize.l
        appearance.titleTypography = ChipTypography(oneSize: Typographies.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.M> {
        var appearance = ChipAppearance.base
        appearance.size = ChipSize.m
        appearance.titleTypography = ChipTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.S> {
        var appearance = ChipAppearance.base
        appearance.size = ChipSize.s
        appearance.titleTypography = ChipTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xs> {
        var appearance = ChipAppearance.base
        appearance.size = ChipSize.xs
        appearance.titleTypography = ChipTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xxs> {
        var appearance = ChipAppearance.base
        appearance.size = ChipSize.xxs
        appearance.titleTypography = ChipTypography(oneSize: Typographies.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ChipAppearance>] = [
        Chip.l.variation,
        Chip.l.pilled.variation,
        Chip.m.variation,
        Chip.m.pilled.variation,
        Chip.s.variation,
        Chip.s.pilled.variation,
        Chip.xs.variation,
        Chip.xs.pilled.variation,
        Chip.xxs.variation,
        Chip.xxs.pilled.variation,
    ]
}

public struct ChipVariation {
    public struct L {}
    public struct LPilled {}
    public struct M {}
    public struct MPilled {}
    public struct S {}
    public struct SPilled {}
    public struct Xs {}
    public struct XsPilled {}
    public struct Xxs {}
    public struct XxsPilled {}
}

private extension ChipAppearance {
    static var base: ChipAppearance {
        var appearance = ChipAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
