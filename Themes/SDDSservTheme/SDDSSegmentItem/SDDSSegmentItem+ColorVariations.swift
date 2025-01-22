import Foundation
import SDDSComponents
import SDDSThemeCore

public extension AppearanceVariation<SegmentItemAppearance> {
    var primary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentItem.primary.appearance)
        )
    }
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentItem.secondary.appearance)
        )
    }
}

public extension SDDSSegmentItem {
    static var primary: AppearanceVariation<SegmentItemAppearance> {
        .init(
            name: "primary",
            appearance: .init(
                titleTypography: SDDSSegmentItem.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover,
                    selectedColor: .textInversePrimary
                ),
                subtitleTypography: SDDSSegmentItem.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textInverseSecondaryActive,
                    hoveredColor: .textInverseSecondaryHover,
                    selectedColor: .textInverseSecondary
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover,
                    selectedColor: .textInversePrimary
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .surfaceDefaultClearActive,
                    hoveredColor: .surfaceDefaultClearHover,
                    selectedColor: .surfaceDefaultSolidDefault
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var secondary: AppearanceVariation<SegmentItemAppearance> {
        .init(
            name: "secondary",
            appearance: SegmentItemAppearance(
                titleTypography: SDDSSegmentItem.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover,
                    selectedColor: .textDefaultPrimary
                ),
                subtitleTypography: SDDSSegmentItem.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover,
                    selectedColor: .textDefaultSecondary
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover,
                    selectedColor: .textDefaultPrimary
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .surfaceDefaultClearActive,
                    hoveredColor: .surfaceDefaultClearHover,
                    selectedColor: .surfaceDefaultTransparentCard
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var accent: AppearanceVariation<SegmentItemAppearance> {
        .init(
            name: "accent",
            appearance: .init(
                titleTypography: SDDSSegmentItem.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover,
                    selectedColor: .textOnDarkPrimary
                ),
                subtitleTypography: SDDSSegmentItem.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textOnDarkSecondaryActive,
                    hoveredColor: .textOnDarkSecondaryHover,
                    selectedColor: .textOnDarkSecondary
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textOnDarkPrimaryActive,
                    hoveredColor: .textOnDarkPrimaryHover,
                    selectedColor: .textOnDarkPrimary
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .surfaceDefaultClearActive,
                    hoveredColor: .surfaceDefaultClearHover,
                    selectedColor: .surfaceDefaultAccent
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var all: [AppearanceVariation<SegmentItemAppearance>] {
        [
            
            SDDSSegmentItem.primary,
            
            SDDSSegmentItem.secondary
            
        ]
    }
}
