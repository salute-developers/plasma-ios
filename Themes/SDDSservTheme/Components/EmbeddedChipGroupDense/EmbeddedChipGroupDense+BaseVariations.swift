import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct EmbeddedChipGroupDense {
    public static var l: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.L> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupDenseSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.M> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupDenseSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.S> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupDenseSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.Xs> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupDenseSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ChipGroupAppearance>] = [
        EmbeddedChipGroupDense.l.variation,
        EmbeddedChipGroupDense.m.variation,
        EmbeddedChipGroupDense.s.variation,
        EmbeddedChipGroupDense.xs.variation,
    ]
}

public struct EmbeddedChipGroupDenseVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension ChipGroupAppearance {
    static var base: ChipGroupAppearance {
        var appearance = ChipGroupAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
