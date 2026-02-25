import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListNumberedItem {
    public static var s: ComponentAppearanceVariation<ListNumberedItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListNumberedItemSize.s
        appearance.counterAppearance = Counter.xs.secondary.appearance
        appearance.titleTypography = ListNumberedItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListItemAppearance>] = [
        ListNumberedItem.s.variation,
    ]
}

public struct ListNumberedItemVariation {
    public struct S {}
}

private extension ListItemAppearance {
    static var base: ListItemAppearance {
        var appearance = ListItemAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
