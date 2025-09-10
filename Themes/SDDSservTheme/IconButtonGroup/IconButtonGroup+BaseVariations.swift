import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct IconButtonGroup {
    public static var l: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.L> {
        var appearance = IconButtonGroupAppearance.base
        appearance.size = IconButtonGroupSize.l
        appearance.buttonAppearance = IconButton.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.M> {
        var appearance = IconButtonGroupAppearance.base
        appearance.size = IconButtonGroupSize.m
        appearance.buttonAppearance = IconButton.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.S> {
        var appearance = IconButtonGroupAppearance.base
        appearance.size = IconButtonGroupSize.s
        appearance.buttonAppearance = IconButton.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.Xs> {
        var appearance = IconButtonGroupAppearance.base
        appearance.size = IconButtonGroupSize.xs
        appearance.buttonAppearance = IconButton.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<IconButtonGroupAppearance>] = [
        IconButtonGroup.l.variation,
        IconButtonGroup.l.dense.variation,
        IconButtonGroup.l.dense.default.variation,
        IconButtonGroup.l.dense.pilled.variation,
        IconButtonGroup.l.dense.segmented.variation,
        IconButtonGroup.l.noGap.variation,
        IconButtonGroup.l.noGap.default.variation,
        IconButtonGroup.l.noGap.pilled.variation,
        IconButtonGroup.l.noGap.segmented.variation,
        IconButtonGroup.l.wide.variation,
        IconButtonGroup.l.wide.default.variation,
        IconButtonGroup.l.wide.pilled.variation,
        IconButtonGroup.l.wide.segmented.variation,
        IconButtonGroup.m.variation,
        IconButtonGroup.m.dense.variation,
        IconButtonGroup.m.dense.default.variation,
        IconButtonGroup.m.dense.pilled.variation,
        IconButtonGroup.m.dense.segmented.variation,
        IconButtonGroup.m.noGap.variation,
        IconButtonGroup.m.noGap.default.variation,
        IconButtonGroup.m.noGap.pilled.variation,
        IconButtonGroup.m.noGap.segmented.variation,
        IconButtonGroup.m.wide.variation,
        IconButtonGroup.m.wide.default.variation,
        IconButtonGroup.m.wide.pilled.variation,
        IconButtonGroup.m.wide.segmented.variation,
        IconButtonGroup.s.variation,
        IconButtonGroup.s.dense.variation,
        IconButtonGroup.s.dense.default.variation,
        IconButtonGroup.s.dense.pilled.variation,
        IconButtonGroup.s.dense.segmented.variation,
        IconButtonGroup.s.noGap.variation,
        IconButtonGroup.s.noGap.default.variation,
        IconButtonGroup.s.noGap.pilled.variation,
        IconButtonGroup.s.noGap.segmented.variation,
        IconButtonGroup.s.wide.variation,
        IconButtonGroup.s.wide.default.variation,
        IconButtonGroup.s.wide.pilled.variation,
        IconButtonGroup.s.wide.segmented.variation,
        IconButtonGroup.xs.variation,
        IconButtonGroup.xs.dense.variation,
        IconButtonGroup.xs.dense.default.variation,
        IconButtonGroup.xs.dense.pilled.variation,
        IconButtonGroup.xs.dense.segmented.variation,
        IconButtonGroup.xs.noGap.variation,
        IconButtonGroup.xs.noGap.default.variation,
        IconButtonGroup.xs.noGap.pilled.variation,
        IconButtonGroup.xs.noGap.segmented.variation,
        IconButtonGroup.xs.wide.variation,
        IconButtonGroup.xs.wide.default.variation,
        IconButtonGroup.xs.wide.pilled.variation,
        IconButtonGroup.xs.wide.segmented.variation,
    ]
}

public struct IconButtonGroupVariation {
    public struct L {}
    public struct LDense {}
    public struct LDenseDefault {}
    public struct LDensePilled {}
    public struct LDenseSegmented {}
    public struct LNogap {}
    public struct LNogapDefault {}
    public struct LNogapPilled {}
    public struct LNogapSegmented {}
    public struct LWide {}
    public struct LWideDefault {}
    public struct LWidePilled {}
    public struct LWideSegmented {}
    public struct M {}
    public struct MDense {}
    public struct MDenseDefault {}
    public struct MDensePilled {}
    public struct MDenseSegmented {}
    public struct MNogap {}
    public struct MNogapDefault {}
    public struct MNogapPilled {}
    public struct MNogapSegmented {}
    public struct MWide {}
    public struct MWideDefault {}
    public struct MWidePilled {}
    public struct MWideSegmented {}
    public struct S {}
    public struct SDense {}
    public struct SDenseDefault {}
    public struct SDensePilled {}
    public struct SDenseSegmented {}
    public struct SNogap {}
    public struct SNogapDefault {}
    public struct SNogapPilled {}
    public struct SNogapSegmented {}
    public struct SWide {}
    public struct SWideDefault {}
    public struct SWidePilled {}
    public struct SWideSegmented {}
    public struct Xs {}
    public struct XsDense {}
    public struct XsDenseDefault {}
    public struct XsDensePilled {}
    public struct XsDenseSegmented {}
    public struct XsNogap {}
    public struct XsNogapDefault {}
    public struct XsNogapPilled {}
    public struct XsNogapSegmented {}
    public struct XsWide {}
    public struct XsWideDefault {}
    public struct XsWidePilled {}
    public struct XsWideSegmented {}
}

private extension IconButtonGroupAppearance {
    static var base: IconButtonGroupAppearance {
        var appearance = IconButtonGroupAppearance()
        return appearance
    }
}
