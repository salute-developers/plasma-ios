import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ChipGroupWide {
    public static var l: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.L> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupWideSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.M> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupWideSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.S> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupWideSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.Xs> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupWideSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.Xxs> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupWideSize.xxs

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ChipGroupAppearance>] = [
        ChipGroupWide.l.variation,
        ChipGroupWide.l.pilled.variation,
        ChipGroupWide.m.variation,
        ChipGroupWide.m.pilled.variation,
        ChipGroupWide.s.variation,
        ChipGroupWide.s.pilled.variation,
        ChipGroupWide.xs.variation,
        ChipGroupWide.xs.pilled.variation,
        ChipGroupWide.xxs.variation,
        ChipGroupWide.xxs.pilled.variation,
    ]
}

public struct ChipGroupWideVariation {
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

private extension ChipGroupAppearance {
    static var base: ChipGroupAppearance {
        var appearance = ChipGroupAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
