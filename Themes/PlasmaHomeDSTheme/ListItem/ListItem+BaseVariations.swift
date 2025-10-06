import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct ListItem {
    public static var s: ComponentAppearanceVariation<ListItem, ListItemAppearance> {
        var appearance = ListItemAppearance.base
        appearance.size = ListItemSize.s
        appearance.disclosureIcon = Asset.disclosureRightOutline24.image
        appearance.titleTypography = ListItemTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ListItemAppearance>] = [
        ListItem.s.variation,
    ]
}

public struct ListItemVariation {
    public struct S {}
}

private extension ListItemAppearance {
    static var base: ListItemAppearance {
        var appearance = ListItemAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentSecondary, highlightedColor: ColorToken.surfaceDefaultTransparentSecondary, hoveredColor: ColorToken.surfaceDefaultTransparentSecondary, selectedColor: .clearColor)
        appearance.disclosureIconColor = ColorToken.textDefaultSecondary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
