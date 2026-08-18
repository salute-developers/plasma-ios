import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct List {
    public static var m: GeneralAppearanceVariation<List, ListAppearance, ListVariation.M> {
        var appearance = ListAppearance.base
        appearance.size = ListSize.m
        appearance.listItemAppearance = ListItem.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<List, ListAppearance, ListVariation.S> {
        var appearance = ListAppearance.base
        appearance.size = ListSize.s
        appearance.listItemAppearance = ListItem.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<ListAppearance>] {
        [
            List.m.variation,
            List.m.hasBackground.variation,
            List.m.noBackground.variation,
            List.m.noBackground.hasItemBackground.variation,
            List.s.variation,
            List.s.hasBackground.variation,
            List.s.noBackground.variation,
            List.s.noBackground.hasItemBackground.variation,
        ]
    }
}

public struct ListVariation {
    public struct M {}
    public struct MHasbackground {}
    public struct MNobackground {}
    public struct MNobackgroundHasitembackground {}
    public struct S {}
    public struct SHasbackground {}
    public struct SNobackground {}
    public struct SNobackgroundHasitembackground {}
}

private extension ListAppearance {
    static var base: ListAppearance {
        var appearance = ListAppearance()
        appearance.dividerAppearance = Divider.default.appearance
        return appearance
    }
}
