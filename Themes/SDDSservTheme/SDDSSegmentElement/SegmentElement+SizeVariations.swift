import Foundation
import SDDSComponents
import SDDSThemeCore

public extension ButtonAppearanceVariation<SDDSSegmentElement> {
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
    static var large: ButtonAppearanceVariation<SDDSSegmentElement> {
        return ButtonAppearanceVariation().large
    }
    static var medium: ButtonAppearanceVariation<SDDSSegmentElement> {
        return ButtonAppearanceVariation().medium
    }
    static var small: ButtonAppearanceVariation<SDDSSegmentElement> {
        return ButtonAppearanceVariation().small
    }
    static var extraSmall: ButtonAppearanceVariation<SDDSSegmentElement> {
        return ButtonAppearanceVariation().extraSmall
    }
}
