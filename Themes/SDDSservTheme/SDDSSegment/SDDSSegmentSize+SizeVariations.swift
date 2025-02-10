import Foundation
import SDDSComponents
import SDDSThemeCore

public extension AppearanceVariation<SegmentAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SegmentSize.large)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(SegmentSize.medium)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(SegmentSize.small)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SegmentSize.extraSmall)
        )
    }
}

public extension SDDSSegment {
    static var large: AppearanceVariation<SegmentAppearance> {
        return AppearanceVariation(appearance: SegmentAppearance()).large
    }
    static var medium: AppearanceVariation<SegmentAppearance> {
        return AppearanceVariation(appearance: SegmentAppearance()).medium
    }
    static var small: AppearanceVariation<SegmentAppearance> {
        return AppearanceVariation(appearance: SegmentAppearance()).small
    }
    static var extraSmall: AppearanceVariation<SegmentAppearance> {
        return AppearanceVariation(appearance: SegmentAppearance()).extraSmall
    }
}
