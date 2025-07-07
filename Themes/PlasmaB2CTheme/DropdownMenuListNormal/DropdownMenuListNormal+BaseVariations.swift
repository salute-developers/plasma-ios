import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DropdownMenuListNormal {
    public static var l: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListNormalSize.l
        appearance.listItemAppearance = DropdownMenuItemNormal.l.default.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListNormalSize.m
        appearance.listItemAppearance = DropdownMenuItemNormal.m.default.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListNormalSize.s
        appearance.listItemAppearance = DropdownMenuItemNormal.s.default.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListNormalSize.xl
        appearance.listItemAppearance = DropdownMenuItemNormal.xl.default.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<DropdownMenuListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = DropdownMenuListNormalSize.xs
        appearance.listItemAppearance = DropdownMenuItemNormal.xs.default.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListAppearance>] = [
        DropdownMenuListNormal.l.variation,
        DropdownMenuListNormal.m.variation,
        DropdownMenuListNormal.s.variation,
        DropdownMenuListNormal.xl.variation,
        DropdownMenuListNormal.xs.variation,
    ]
}

public struct DropdownMenuListNormalVariation {
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
