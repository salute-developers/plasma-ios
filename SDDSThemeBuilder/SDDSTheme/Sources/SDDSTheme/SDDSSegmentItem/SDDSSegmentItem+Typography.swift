import Foundation

import SDDSComponents
import SDDSThemeCore


public extension SDDSSegmentItem {
    static var titleTypography: TypographyConfiguration {
        SegmentItemTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
    static var subtitleTypography: TypographyConfiguration {
        SegmentItemTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
}
