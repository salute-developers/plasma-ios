import Foundation
import SDDSComponents
import SDDSThemeCore

public extension SegmentItemAppearanceVariation {
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
    static var large: SegmentItemAppearanceVariation {
        return SegmentItemAppearanceVariation().large
    }
    static var medium: SegmentItemAppearanceVariation {
        return SegmentItemAppearanceVariation().medium
    }
    static var small: SegmentItemAppearanceVariation {
        return SegmentItemAppearanceVariation().small
    }
    static var extraSmall: SegmentItemAppearanceVariation {
        return SegmentItemAppearanceVariation().extraSmall
    }
}
