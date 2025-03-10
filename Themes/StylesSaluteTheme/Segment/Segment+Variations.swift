import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<Segment, SegmentAppearance> {
    var `default`: AppearanceVariation<SegmentAppearance> {
        var appearance = Segment.default.appearance
        appearance.size = self.appearance.size
        appearance.segmentItemAppearance = self.appearance.segmentItemAppearance
        
        return .init(name: "primary", appearance: appearance)
    }
    
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = Segment.default.appearance
        appearance.size = self.appearance.size
        
        var secondary = SegmentItem.m.secondary.appearance
        secondary.size = self.appearance.segmentItemAppearance.size
        secondary.counterAppearance = self.appearance.segmentItemAppearance.counterAppearance
        appearance.segmentItemAppearance = secondary
        
        return .init(name: "secondary", appearance: appearance)
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension Segment {
    static var `default`: AppearanceVariation<SegmentAppearance> {
        .init(
            name: "default",
            appearance: .init(
                backgroundColor: ButtonColor(
                    defaultColor: .backgroundDefaultPrimary,
                    highlightedColor: .backgroundDefaultPrimary,
                    hoveredColor: .backgroundDefaultPrimary
                ),
                disabledAlpha: 0.4
            )
        )
    }
}
