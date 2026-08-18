import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListNumbered {
    public static var m: ComponentAppearanceVariation<ListNumbered, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNumberedSize.m
        appearance.listItemAppearance = ListNumberedItem.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<ListNumbered, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNumberedSize.s
        appearance.listItemAppearance = ListNumberedItem.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<ListAppearance>] {
        [
            ListNumbered.m.variation,
            ListNumbered.s.variation,
        ]
    }
}

public struct ListNumberedVariation {
    public struct M {}
    public struct S {}
}

private extension ListAppearance {
    static var base: ListAppearance {
        var appearance = ListAppearance()
        appearance.dividerAppearance = Divider.default.appearance
        return appearance
    }
}
