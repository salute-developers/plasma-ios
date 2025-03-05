import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Segment {
    public static var l: ComponentAppearanceVariation<Segment, SegmentAppearance> {
        var appearance = SegmentAppearance()
        appearance.size = SegmentSize.large
        appearance.segmentItemAppearance = SegmentItem.l.primary.appearance
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    public static var m: ComponentAppearanceVariation<Segment, SegmentAppearance> {
        var appearance = SegmentAppearance()
        appearance.size = SegmentSize.medium
        appearance.segmentItemAppearance = SegmentItem.m.primary.appearance
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var s: ComponentAppearanceVariation<Segment, SegmentAppearance> {
        var appearance = SegmentAppearance()
        appearance.size = SegmentSize.small
        appearance.segmentItemAppearance = SegmentItem.s.primary.appearance
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var xs: ComponentAppearanceVariation<Segment, SegmentAppearance> {
        var appearance = SegmentAppearance()
        appearance.size = SegmentSize.extraSmall
        appearance.segmentItemAppearance = SegmentItem.xs.primary.appearance
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SegmentAppearance>] = [
        l,
        m,
        s,
        xs
    ].map { $0.variation }

}
