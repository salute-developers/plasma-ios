import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TabItemHeader {
    public static var h1: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemHeaderSize.h1
        appearance.labelTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH1Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH1Normal.typography).asContainer

        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    public static var h2: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemHeaderSize.h2
        appearance.labelTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH2Normal.typography).asContainer

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemHeaderSize.h3
        appearance.labelTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH3Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH3Normal.typography).asContainer

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemHeaderSize.h4
        appearance.labelTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH4Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH4Normal.typography).asContainer

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<TabItemHeader, TabItemAppearance> {
        var appearance = TabItemAppearance.base
        appearance.size = TabItemHeaderSize.h5
        appearance.labelTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.valueTypography = TabItemHeaderTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<TabItemAppearance>] {
        [
            TabItemHeader.h1.variation,
            TabItemHeader.h2.variation,
            TabItemHeader.h3.variation,
            TabItemHeader.h4.variation,
            TabItemHeader.h5.variation,
        ]
    }
}

public struct TabItemHeaderVariation {
    public struct H1 {}
    public struct H2 {}
    public struct H3 {}
    public struct H4 {}
    public struct H5 {}
}

private extension TabItemAppearance {
    static var base: TabItemAppearance {
        var appearance = TabItemAppearance()
        appearance.actionColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive)
        ]))
        appearance.actionIcon = Asset.close36.image
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultPrimary)
        ]))
        appearance.labelColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
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
        appearance.valueColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultTertiary, values: [
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultTertiaryHover),
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultTertiaryActive),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultSecondary)
        ]))
        return appearance
    }
}
