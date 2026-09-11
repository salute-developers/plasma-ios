import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabItemDefault {
    public static var l: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.L> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemDefaultSize.l
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.s.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.M> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemDefaultSize.m
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.S> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemDefaultSize.s
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: GeneralAppearanceVariation<TabItemDefault, TabItemAppearance, TabItemDefaultVariation.Xs> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemDefaultSize.xs
        appearance.actionIcon = Asset.close16.image
        appearance.counterAppearance = Counter.xxs.accent.appearance
        appearance.labelTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.valueTypography = TabItemDefaultTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabItemAppearance>] {
        [
            TabItemDefault.l.variation,
            TabItemDefault.l.horizontal.variation,
            TabItemDefault.l.vertical.variation,
            TabItemDefault.m.variation,
            TabItemDefault.m.horizontal.variation,
            TabItemDefault.m.vertical.variation,
            TabItemDefault.s.variation,
            TabItemDefault.s.horizontal.variation,
            TabItemDefault.s.vertical.variation,
            TabItemDefault.xs.variation,
            TabItemDefault.xs.horizontal.variation,
            TabItemDefault.xs.vertical.variation,
        ]
    }
}

public struct TabItemDefaultVariation {
    public struct L {}
    public struct LHorizontal {}
    public struct LVertical {}
    public struct M {}
    public struct MHorizontal {}
    public struct MVertical {}
    public struct S {}
    public struct SHorizontal {}
    public struct SVertical {}
    public struct Xs {}
    public struct XsHorizontal {}
    public struct XsVertical {}
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
        appearance.labelColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
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
        appearance.valueColor = StatefulFillStyle(defaultValue: .color(.textDefaultTertiary), values: [
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultTertiaryHover)),
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultTertiaryActive)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary))
        ])
        return appearance
    }
}
