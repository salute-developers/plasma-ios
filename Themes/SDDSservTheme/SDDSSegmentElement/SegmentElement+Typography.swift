import Foundation
import SDDSServTheme
import SDDSComponents
import SDDSThemeCore


public extension SDDSSegmentElement {
    static var titleTypography: TypographyConfiguration {
        SegmentElementTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
    static var subtitleTypography: TypographyConfiguration {
        SegmentElementTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
}
