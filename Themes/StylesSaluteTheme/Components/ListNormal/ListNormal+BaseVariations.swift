import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListNormal {
    public static var l: ComponentAppearanceVariation<ListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNormalSize.l
        appearance.listItemAppearance = ListItemNormal.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<ListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNormalSize.m
        appearance.listItemAppearance = ListItemNormal.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<ListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNormalSize.s
        appearance.listItemAppearance = ListItemNormal.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<ListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNormalSize.xl
        appearance.listItemAppearance = ListItemNormal.xl.appearance

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<ListNormal, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNormalSize.xs
        appearance.listItemAppearance = ListItemNormal.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListAppearance>] = [
        ListNormal.l.variation,
        ListNormal.m.variation,
        ListNormal.s.variation,
        ListNormal.xl.variation,
        ListNormal.xs.variation,
    ]
}

public struct ListNormalVariation {
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
