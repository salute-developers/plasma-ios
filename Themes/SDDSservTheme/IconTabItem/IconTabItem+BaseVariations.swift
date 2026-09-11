import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct IconTabItem {
    public static var l: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = IconTabItemSize.l
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.negative.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = IconTabItemSize.m
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.negative.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = IconTabItemSize.s
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xxs.negative.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = IconTabItemSize.xs
        appearance.actionIcon = Asset.close16.image
        appearance.counterAppearance = Counter.xxs.negative.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabItemAppearance>] {
        [
            IconTabItem.l.variation,
            IconTabItem.m.variation,
            IconTabItem.s.variation,
            IconTabItem.xs.variation,
        ]
    }
}

public struct IconTabItemVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension TabItemAppearance {
    static var base: TabItemAppearance {
        var appearance = TabItemAppearance()
        appearance.actionColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultSecondaryActive))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary))
        ])
        return appearance
    }
}
