import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListNumberedItem {
    public static var m: ComponentAppearanceVariation<ListNumberedItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListNumberedItemSize.m
        appearance.counterAppearance = Counter.s.secondary.appearance
        appearance.subtitleTypography = ListNumberedItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.titleTypography = ListNumberedItemTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<ListNumberedItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListNumberedItemSize.s
        appearance.counterAppearance = Counter.s.secondary.appearance
        appearance.subtitleTypography = ListNumberedItemTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleTypography = ListNumberedItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<ListItemAppearance>] {
        [
            ListNumberedItem.m.variation,
            ListNumberedItem.s.variation,
        ]
    }
}

public struct ListNumberedItemVariation {
    public struct M {}
    public struct S {}
}

private extension ListItemAppearance {
    static var base: ListItemAppearance {
        var appearance = ListItemAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [])
        return appearance
    }
}
