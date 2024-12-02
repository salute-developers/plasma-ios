import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ButtonAppearanceVariation<SegmentElement> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.large)
                .titleTypography(SegmentElement.titleTypography)
                .subtitleTypography(SegmentElement.subtitleTypography)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.medium)
                .titleTypography(SegmentElement.titleTypography)
                .subtitleTypography(SegmentElement.subtitleTypography)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.small)
                .titleTypography(SegmentElement.titleTypography)
                .subtitleTypography(SegmentElement.subtitleTypography)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(SegmentElementSize.extraSmall)
                .titleTypography(SegmentElement.titleTypography)
                .subtitleTypography(SegmentElement.subtitleTypography)
        )
    }
}

public extension SegmentElement {
    static var large: ButtonAppearanceVariation<SegmentElement> {
        return ButtonAppearanceVariation().large
    }
    static var medium: ButtonAppearanceVariation<SegmentElement> {
        return ButtonAppearanceVariation().medium
    }
    static var small: ButtonAppearanceVariation<SegmentElement> {
        return ButtonAppearanceVariation().small
    }
    static var extraSmall: ButtonAppearanceVariation<SegmentElement> {
        return ButtonAppearanceVariation().extraSmall
    }
}
