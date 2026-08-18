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
        appearance.actionColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive)
        ]))
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultPrimary)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultPrimary)
        ]))
        return appearance
    }
}
