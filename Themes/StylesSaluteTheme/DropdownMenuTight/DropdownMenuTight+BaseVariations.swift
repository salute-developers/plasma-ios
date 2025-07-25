import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DropdownMenuTight {
    public static var l: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuTightSize.l
        appearance.listAppearance = DropdownMenuListTight.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuTightSize.m
        appearance.listAppearance = DropdownMenuListTight.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuTightSize.s
        appearance.listAppearance = DropdownMenuListTight.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<DropdownMenuTight, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuTightSize.xs
        appearance.listAppearance = DropdownMenuListTight.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<DropdownMenuAppearance>] = [
        DropdownMenuTight.l.variation,
        DropdownMenuTight.m.variation,
        DropdownMenuTight.s.variation,
        DropdownMenuTight.xs.variation,
    ]
}

public struct DropdownMenuTightVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension DropdownMenuAppearance {
    static var base: DropdownMenuAppearance {
        var appearance = DropdownMenuAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.dividerAppearance = Divider.default.appearance
        appearance.shadow = ShadowToken.downHardM
        return appearance
    }
}
