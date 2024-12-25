import Foundation
import SDDSComponents
import SDDSThemeCore

public extension SegmentElementAppearanceVariation {
    var clear: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.clear.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.default.appearance)
        )
    }
    var white: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegmentElement.white.appearance)
        )
    }
}

public extension SDDSSegmentElement {
    static var clear: SegmentElementAppearanceVariation {
        .init(
            name: "clear",
            appearance: SegmentElementAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var `default`: SegmentElementAppearanceVariation {
        .init(
            name: "default",
            appearance: SegmentElementAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
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
    static var white: SegmentElementAppearanceVariation {
        .init(
            name: "white",
            appearance: SegmentElementAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
                subtitleColor: ButtonColor(
                    defaultColor: .textOnLightSecondary,
                    highlightedColor: .textOnLightSecondaryActive,
                    hoveredColor: .textOnLightSecondaryHover
                ),
                iconColor: ButtonColor(
                    defaultColor: .textOnLightPrimary,
                    highlightedColor: .textOnLightPrimaryActive,
                    hoveredColor: .textOnLightPrimaryHover
                ),
                backgroundColor: ButtonColor(
                    defaultColor: .surfaceDefaultSolidCard,
                    highlightedColor: .surfaceDefaultSolidCardActive,
                    hoveredColor: .surfaceDefaultSolidCardHover
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var all: [SegmentElementAppearanceVariation] {
        [
            
            SDDSSegmentElement.clear,
            
            SDDSSegmentElement.default,
            
            SDDSSegmentElement.white
            
        ]
    }
}
