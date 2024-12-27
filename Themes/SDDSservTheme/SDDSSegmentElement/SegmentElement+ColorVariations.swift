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
}

public extension SDDSSegmentElement {
    static var clear: SegmentElementAppearanceVariation {
        .init(
            name: "clear",
            appearance: SegmentElementAppearance(
                titleTypography: SDDSSegmentElement.titleTypography,
                titleColor: SegmentElementColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
                subtitleColor: SegmentElementColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                iconColor: SegmentElementColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover
                ),
                backgroundColor: SegmentElementColor(
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
                titleColor: SegmentElementColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                subtitleTypography: SDDSSegmentElement.subtitleTypography,
                subtitleColor: SegmentElementColor(
                    defaultColor: .textDefaultSecondary,
                    highlightedColor: .textDefaultSecondaryActive,
                    hoveredColor: .textDefaultSecondaryHover
                ),
                iconColor: SegmentElementColor(
                    defaultColor: .textInversePrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover
                ),
                backgroundColor: SegmentElementColor(
                    defaultColor: .surfaceDefaultSolidDefault,
                    highlightedColor: .surfaceDefaultSolidDefaultActive,
                    hoveredColor: .surfaceDefaultSolidDefaultHover
                ),
                disabledAlpha: 0.4
            )
        )
    }
    static var all: [SegmentElementAppearanceVariation] {
        [
            
            SDDSSegmentElement.clear,
            
            SDDSSegmentElement.default
            
        ]
    }
}
