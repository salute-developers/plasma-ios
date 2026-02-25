import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct List {
    public static var s: GeneralAppearanceVariation<List, ListAppearance, ListVariation.S> {
        var appearance = ListAppearance.base
        appearance.size = ListSize.s
        appearance.listItemAppearance = ListItem.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListAppearance>] = [
        List.s.variation,
        List.s.hasBackground.variation,
        List.s.noBackground.variation,
        List.s.noBackground.hasItemBackground.variation,
    ]
}

public struct ListVariation {
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
