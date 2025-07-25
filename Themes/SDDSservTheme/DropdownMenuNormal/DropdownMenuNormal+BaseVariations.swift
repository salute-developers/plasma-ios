import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DropdownMenuNormal {
    public static var l: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuNormalSize.l
        appearance.listAppearance = DropdownMenuListNormal.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuNormalSize.m
        appearance.listAppearance = DropdownMenuListNormal.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuNormalSize.s
        appearance.listAppearance = DropdownMenuListNormal.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuNormalSize.xl
        appearance.listAppearance = DropdownMenuListNormal.xl.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<DropdownMenuNormal, DropdownMenuAppearance> {
        var appearance = DropdownMenuAppearance.base
        appearance.size = DropdownMenuNormalSize.xs
        appearance.listAppearance = DropdownMenuListNormal.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<DropdownMenuAppearance>] = [
        DropdownMenuNormal.l.variation,
        DropdownMenuNormal.m.variation,
        DropdownMenuNormal.s.variation,
        DropdownMenuNormal.xl.variation,
        DropdownMenuNormal.xs.variation,
    ]
}

public struct DropdownMenuNormalVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
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
