import Foundation
import SDDSComponents
import SDDSThemeCore

public extension SegmentItemAppearanceVariation {
    var clear: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentItem.clear.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentItem.default.appearance)
        )
    }
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentItem.secondary.appearance)
        )
    }
}

public extension SDDSSegmentItem {
    static var clear: SegmentItemAppearanceVariation {
        .init(
            name: "clear",
            appearance: SegmentItemAppearance(
                titleTypography: SDDSSegmentItem.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SDDSSegmentItem.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultClear,
                    highlightedColor: .surfaceDefaultClearActive,
                    hoveredColor: .surfaceDefaultClearHover
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var `default`: SegmentItemAppearanceVariation {
        .init(
            name: "default",
            appearance: SegmentItemAppearance(
                titleTypography: SDDSSegmentItem.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                subtitleTypography: SDDSSegmentItem.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textInverseSecondary,
                    highlightedColor: .textInverseSecondaryActive,
                    hoveredColor: .textInverseSecondaryHover
                ),
                iconColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultSolidDefault,
                    highlightedColor: .surfaceDefaultSolidDefaultActive,
                    hoveredColor: .surfaceDefaultSolidDefaultHover
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var secondary: SegmentItemAppearanceVariation {
        .init(
            name: "secondary",
            appearance: SegmentItemAppearance(
                titleTypography: SDDSSegmentItem.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SDDSSegmentItem.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                iconColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultTransparentCard,
                    highlightedColor: .surfaceDefaultTransparentCardActive,
                    hoveredColor: .surfaceDefaultTransparentCardHover
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var all: [SegmentItemAppearanceVariation] {
        [
            
            SDDSSegmentItem.clear,
            
            SDDSSegmentItem.default,
            
            SDDSSegmentItem.secondary
            
        ]
    }
}
