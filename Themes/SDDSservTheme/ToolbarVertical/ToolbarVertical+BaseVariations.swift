import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ToolbarVertical {
    public static var l: GeneralAppearanceVariation<ToolbarVertical, ToolbarAppearance, ToolbarVerticalVariation.L> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarVerticalSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<ToolbarVertical, ToolbarAppearance, ToolbarVerticalVariation.M> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarVerticalSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<ToolbarVertical, ToolbarAppearance, ToolbarVerticalVariation.S> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarVerticalSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<ToolbarVertical, ToolbarAppearance, ToolbarVerticalVariation.Xs> {
        var appearance = ToolbarAppearance.base
        appearance.size = ToolbarVerticalSize.xs

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ToolbarAppearance>] = [
        ToolbarVertical.l.variation,
        ToolbarVertical.l.hasShadow.variation,
        ToolbarVertical.m.variation,
        ToolbarVertical.m.hasShadow.variation,
        ToolbarVertical.s.variation,
        ToolbarVertical.s.hasShadow.variation,
        ToolbarVertical.xs.variation,
        ToolbarVertical.xs.hasShadow.variation,
    ]
}

public struct ToolbarVerticalVariation {
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
