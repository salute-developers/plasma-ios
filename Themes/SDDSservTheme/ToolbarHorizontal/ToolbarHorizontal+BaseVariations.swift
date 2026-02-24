import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ToolbarHorizontal {
    public static var l: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.L> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarHorizontalSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.M> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarHorizontalSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.S> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarHorizontalSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<ToolbarHorizontal, ToolbarAppearance, ToolbarHorizontalVariation.Xs> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarHorizontalSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ToolbarAppearance>] = [
        ToolbarHorizontal.l.variation,
        ToolbarHorizontal.l.hasShadow.variation,
        ToolbarHorizontal.m.variation,
        ToolbarHorizontal.m.hasShadow.variation,
        ToolbarHorizontal.s.variation,
        ToolbarHorizontal.s.hasShadow.variation,
        ToolbarHorizontal.xs.variation,
        ToolbarHorizontal.xs.hasShadow.variation,
    ]
}

public struct ToolbarHorizontalVariation {
    public struct L {}
    public struct LHasshadow {}
    public struct M {}
    public struct MHasshadow {}
    public struct S {}
    public struct SHasshadow {}
    public struct Xs {}
    public struct XsHasshadow {}
}

private extension ToolbarAppearance {
    static var base: ToolbarAppearance {
        var appearance = ToolbarAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.dividerAppearance = Divider.default.appearance
        return appearance
    }
}
