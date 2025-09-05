import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct EmbeddedChipGroupWide {
    public static var l: GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.L> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupWideSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.M> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupWideSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.S> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupWideSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.Xs> {
        var appearance = ChipGroupAppearance.base
        appearance.size = EmbeddedChipGroupWideSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ChipGroupAppearance>] = [
        EmbeddedChipGroupWide.l.variation,
        EmbeddedChipGroupWide.m.variation,
        EmbeddedChipGroupWide.s.variation,
        EmbeddedChipGroupWide.xs.variation,
    ]
}

public struct EmbeddedChipGroupWideVariation {
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
