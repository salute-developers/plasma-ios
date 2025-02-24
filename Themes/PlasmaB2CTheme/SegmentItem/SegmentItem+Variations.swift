import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = SegmentItem.primary.appearance
        appearance.size = self.appearance.size
        
        return .init(name: "primary", appearance: appearance)
    }
    
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = SegmentItem.secondary.appearance
        appearance.size = self.appearance.size

        return .init(name: "secondary", appearance: appearance)
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension SegmentItem {
    static var primary: AppearanceVariation<SegmentItemAppearance> {
        .init(
            name: "primary",
            appearance: .init(
                titleTypography: SegmentItemTypography.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textInversePrimaryActive,
                    hoveredColor: .textInversePrimaryHover,
                    selectedColor: .textInversePrimary
                ),
                subtitleTypography: SegmentItemTypography.subtitleTypography,
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
                titleTypography: SegmentItemTypography.titleTypography,
                titleColor: ButtonColor(
                    defaultColor: .textDefaultPrimary,
                    highlightedColor: .textDefaultPrimaryActive,
                    hoveredColor: .textDefaultPrimaryHover,
                    selectedColor: .textDefaultPrimary
                ),
                subtitleTypography: SegmentItemTypography.subtitleTypography,
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
}
