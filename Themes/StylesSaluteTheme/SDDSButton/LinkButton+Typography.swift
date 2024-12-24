/* This file is code generated. */

import Foundation
import SDDSComponents
import SDDSThemeCore

public extension LinkButton {
    static var titleTypography: TypographyConfiguration {
        LinkButtonTypography(
            large: AdaptiveTypographyToken.bodyLBold.typography,
            medium: AdaptiveTypographyToken.bodyMBold.typography,
            small: AdaptiveTypographyToken.bodySBold.typography,
            extraSmall: AdaptiveTypographyToken.bodyXsBold.typography
        )
        .asContainer
    }
}
