import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabBarItem {
    public static var `default`: ComponentAppearanceVariation<TabBarItem, TabBarItemAppearance> {
        var appearance = TabBarItemAppearance.base
        appearance.size = TabBarItemSize.`default`
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [])
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
        appearance.labelTypography = TabBarItemTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabBarItemAppearance>] {
        [
            TabBarItem.default.variation,
        ]
    }
}

public struct TabBarItemVariation {
    public struct Default {}
}

private extension TabBarItemAppearance {
    static var base: TabBarItemAppearance {
        var appearance = TabBarItemAppearance()
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [])
        appearance.counterAppearance = Counter.xs.negative.appearance
        appearance.iconColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
        appearance.indicatorAppearance = Indicator.m.negative.appearance
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
        appearance.labelTypography = TabBarItemTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
        return appearance
    }
}
