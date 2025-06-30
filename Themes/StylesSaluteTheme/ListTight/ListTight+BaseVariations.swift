import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListTight {
    public static var l: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListTightSize.l
        appearance.listItemAppearance = ListItemTight.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListTightSize.m
        appearance.listItemAppearance = ListItemTight.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListTightSize.s
        appearance.listItemAppearance = ListItemTight.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListTightSize.xl
        appearance.listItemAppearance = ListItemTight.xl.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<ListTight, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListTightSize.xs
        appearance.listItemAppearance = ListItemTight.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListAppearance>] = [
        ListTight.l.variation,
        ListTight.m.variation,
        ListTight.s.variation,
        ListTight.xl.variation,
        ListTight.xs.variation,
    ]
}

public struct ListTightVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
}

private extension ListAppearance {
    static var base: ListAppearance {
        var appearance = ListAppearance()
        return appearance
    }
}
