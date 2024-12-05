import Foundation
import SDDSComponents
import SDDSThemeCore

public extension LinkButton {
    static var titleTypography: TypographyConfiguration {
        LinkButtonTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography,
            extraExtraSmall: AdaptiveTypographyToken.bodyXsNormal.typography
        )
        .asContainer
    }
    
    static var subtitleTypography: TypographyConfiguration {
        LinkButtonTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography,
            extraExtraSmall: AdaptiveTypographyToken.bodyXsNormal.typography
        )
        .asContainer
    }
}
