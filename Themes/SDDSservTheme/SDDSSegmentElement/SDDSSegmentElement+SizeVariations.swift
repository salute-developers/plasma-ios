import Foundation
import SDDSComponents
import SDDSThemeCore

public extension SegmentElementAppearanceVariation {
    var large: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.large)
                .titleTypography(SDDSSegmentElement.titleTypography)
                .subtitleTypography(SDDSSegmentElement.subtitleTypography)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.medium)
                .titleTypography(SDDSSegmentElement.titleTypography)
                .subtitleTypography(SDDSSegmentElement.subtitleTypography)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.small)
                .titleTypography(SDDSSegmentElement.titleTypography)
                .subtitleTypography(SDDSSegmentElement.subtitleTypography)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.extraSmall)
                .titleTypography(SDDSSegmentElement.titleTypography)
                .subtitleTypography(SDDSSegmentElement.subtitleTypography)
        )
    }
}

public extension SDDSSegmentElement {
    static var large: SegmentElementAppearanceVariation {
        return SegmentElementAppearanceVariation().large
    }
    static var medium: SegmentElementAppearanceVariation {
        return SegmentElementAppearanceVariation().medium
    }
    static var small: SegmentElementAppearanceVariation {
        return SegmentElementAppearanceVariation().small
    }
    static var extraSmall: SegmentElementAppearanceVariation {
        return SegmentElementAppearanceVariation().extraSmall
    }
}
