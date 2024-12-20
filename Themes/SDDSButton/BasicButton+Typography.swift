import Foundation
import SDDSServTheme
import SDDSComponents
import SDDSThemeCore

public extension BasicButton {
    static var titleTypography: TypographyConfiguration {
        BasicButtonTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography,
            extraExtraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
    static var subtitleTypography: TypographyConfiguration {
        BasicButtonTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography,
            extraExtraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
}
