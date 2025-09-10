import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct BasicButtonGroup {
    public static var l: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.L> {
        var appearance = BasicButtonGroupAppearance.base
        appearance.size = BasicButtonGroupSize.l
        appearance.buttonAppearance = BasicButton.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.M> {
        var appearance = BasicButtonGroupAppearance.base
        appearance.size = BasicButtonGroupSize.m
        appearance.buttonAppearance = BasicButton.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.S> {
        var appearance = BasicButtonGroupAppearance.base
        appearance.size = BasicButtonGroupSize.s
        appearance.buttonAppearance = BasicButton.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.Xs> {
        var appearance = BasicButtonGroupAppearance.base
        appearance.size = BasicButtonGroupSize.xs
        appearance.buttonAppearance = BasicButton.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BasicButtonGroupAppearance>] = [
        BasicButtonGroup.l.variation,
        BasicButtonGroup.l.dense.variation,
        BasicButtonGroup.l.dense.default.variation,
        BasicButtonGroup.l.dense.segmented.variation,
        BasicButtonGroup.l.noGap.variation,
        BasicButtonGroup.l.noGap.default.variation,
        BasicButtonGroup.l.noGap.segmented.variation,
        BasicButtonGroup.l.wide.variation,
        BasicButtonGroup.l.wide.default.variation,
        BasicButtonGroup.l.wide.segmented.variation,
        BasicButtonGroup.m.variation,
        BasicButtonGroup.m.dense.variation,
        BasicButtonGroup.m.dense.default.variation,
        BasicButtonGroup.m.dense.segmented.variation,
        BasicButtonGroup.m.noGap.variation,
        BasicButtonGroup.m.noGap.default.variation,
        BasicButtonGroup.m.noGap.segmented.variation,
        BasicButtonGroup.m.wide.variation,
        BasicButtonGroup.m.wide.default.variation,
        BasicButtonGroup.m.wide.segmented.variation,
        BasicButtonGroup.s.variation,
        BasicButtonGroup.s.dense.variation,
        BasicButtonGroup.s.dense.default.variation,
        BasicButtonGroup.s.dense.segmented.variation,
        BasicButtonGroup.s.noGap.variation,
        BasicButtonGroup.s.noGap.default.variation,
        BasicButtonGroup.s.noGap.segmented.variation,
        BasicButtonGroup.s.wide.variation,
        BasicButtonGroup.s.wide.default.variation,
        BasicButtonGroup.s.wide.segmented.variation,
        BasicButtonGroup.xs.variation,
        BasicButtonGroup.xs.dense.variation,
        BasicButtonGroup.xs.dense.default.variation,
        BasicButtonGroup.xs.dense.segmented.variation,
        BasicButtonGroup.xs.noGap.variation,
        BasicButtonGroup.xs.noGap.default.variation,
        BasicButtonGroup.xs.noGap.segmented.variation,
        BasicButtonGroup.xs.wide.variation,
        BasicButtonGroup.xs.wide.default.variation,
        BasicButtonGroup.xs.wide.segmented.variation,
    ]
}

public struct BasicButtonGroupVariation {
    public struct L {}
    public struct LDense {}
    public struct LDenseDefault {}
    public struct LDenseSegmented {}
    public struct LNogap {}
    public struct LNogapDefault {}
    public struct LNogapSegmented {}
    public struct LWide {}
    public struct LWideDefault {}
    public struct LWideSegmented {}
    public struct M {}
    public struct MDense {}
    public struct MDenseDefault {}
    public struct MDenseSegmented {}
    public struct MNogap {}
    public struct MNogapDefault {}
    public struct MNogapSegmented {}
    public struct MWide {}
    public struct MWideDefault {}
    public struct MWideSegmented {}
    public struct S {}
    public struct SDense {}
    public struct SDenseDefault {}
    public struct SDenseSegmented {}
    public struct SNogap {}
    public struct SNogapDefault {}
    public struct SNogapSegmented {}
    public struct SWide {}
    public struct SWideDefault {}
    public struct SWideSegmented {}
    public struct Xs {}
    public struct XsDense {}
    public struct XsDenseDefault {}
    public struct XsDenseSegmented {}
    public struct XsNogap {}
    public struct XsNogapDefault {}
    public struct XsNogapSegmented {}
    public struct XsWide {}
    public struct XsWideDefault {}
    public struct XsWideSegmented {}
}

private extension BasicButtonGroupAppearance {
    static var base: BasicButtonGroupAppearance {
        var appearance = BasicButtonGroupAppearance()
        return appearance
    }
}
