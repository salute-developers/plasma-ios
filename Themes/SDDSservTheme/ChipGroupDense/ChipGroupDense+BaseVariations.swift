import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ChipGroupDense {
    public static var l: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.L> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupDenseSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.M> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupDenseSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.S> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupDenseSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.Xs> {
        var appearance = ChipGroupAppearance.base
        appearance.size = ChipGroupDenseSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ChipGroupAppearance>] = [
        ChipGroupDense.l.variation,
        ChipGroupDense.l.pilled.variation,
        ChipGroupDense.m.variation,
        ChipGroupDense.m.pilled.variation,
        ChipGroupDense.s.variation,
        ChipGroupDense.s.pilled.variation,
        ChipGroupDense.xs.variation,
        ChipGroupDense.xs.pilled.variation,
    ]
}

public struct ChipGroupDenseVariation {
    public struct L {}
    public struct LPilled {}
    public struct M {}
    public struct MPilled {}
    public struct S {}
    public struct SPilled {}
    public struct Xs {}
    public struct XsPilled {}
}

private extension ChipGroupAppearance {
    static var base: ChipGroupAppearance {
        var appearance = ChipGroupAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
