import Foundation
import SDDSComponents
import SDDSThemeCore

public extension AppearanceVariation<SegmentItemAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SegmentItemSize.large)
                .titleTypography(SDDSSegmentItem.titleTypography)
                .subtitleTypography(SDDSSegmentItem.subtitleTypography)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(SegmentItemSize.medium)
                .titleTypography(SDDSSegmentItem.titleTypography)
                .subtitleTypography(SDDSSegmentItem.subtitleTypography)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(SegmentItemSize.small)
                .titleTypography(SDDSSegmentItem.titleTypography)
                .subtitleTypography(SDDSSegmentItem.subtitleTypography)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SegmentItemSize.extraSmall)
                .titleTypography(SDDSSegmentItem.titleTypography)
                .subtitleTypography(SDDSSegmentItem.subtitleTypography)
        )
    }
}

public extension SDDSSegmentItem {
    static var large: AppearanceVariation<SegmentItemAppearance> {
        return AppearanceVariation(appearance: SegmentItemAppearance()).large
    }
    static var medium: AppearanceVariation<SegmentItemAppearance> {
        return AppearanceVariation(appearance: SegmentItemAppearance()).medium
    }
    static var small: AppearanceVariation<SegmentItemAppearance> {
        return AppearanceVariation(appearance: SegmentItemAppearance()).small
    }
    static var extraSmall: AppearanceVariation<SegmentItemAppearance> {
        return AppearanceVariation(appearance: SegmentItemAppearance()).extraSmall
    }
}
