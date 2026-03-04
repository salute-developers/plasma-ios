import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListNumbered {
    public static var s: ComponentAppearanceVariation<ListNumbered, ListAppearance> {
        var appearance = ListAppearance.base
        appearance.size = ListNumberedSize.s
        appearance.listItemAppearance = ListNumberedItem.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListAppearance>] = [
        ListNumbered.s.variation,
    ]
}

public struct ListNumberedVariation {
    public struct S {}
}

private extension ListAppearance {
    static var base: ListAppearance {
        var appearance = ListAppearance()
        appearance.dividerAppearance = Divider.default.appearance
        return appearance
    }
}
