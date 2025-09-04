import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DropdownMenuListTight {
    public static var l: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListTightSize.l
        appearance.listItemAppearance = DropdownMenuItemTight.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListTightSize.m
        appearance.listItemAppearance = DropdownMenuItemTight.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListTightSize.s
        appearance.listItemAppearance = DropdownMenuItemTight.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListTightSize.xl
        appearance.listItemAppearance = DropdownMenuItemTight.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<DropdownMenuListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListTightSize.xs
        appearance.listItemAppearance = DropdownMenuItemTight.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListAppearance>] = [
        DropdownMenuListTight.l.variation,
        DropdownMenuListTight.m.variation,
        DropdownMenuListTight.s.variation,
        DropdownMenuListTight.xl.variation,
        DropdownMenuListTight.xs.variation,
    ]
}

public struct DropdownMenuListTightVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
}

private extension ListAppearance {
    static var base: ListAppearance {
        var appearance = ListAppearance()
        appearance.dividerAppearance = Divider.default.appearance
        appearance.scrollBarAppearance = ScrollBar.s.appearance
        return appearance
    }
}
