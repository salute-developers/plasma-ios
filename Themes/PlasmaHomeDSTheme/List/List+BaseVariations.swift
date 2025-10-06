import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct List {
    public static var s: ComponentAppearanceVariation<List, ListAppearance> {
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
    ]
}

public struct ListVariation {
    public struct S {}
}

private extension ListAppearance {
    static var base: ListAppearance {
        var appearance = ListAppearance()
        return appearance
    }
}
