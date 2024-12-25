import Foundation
import SDDSComponents
import SDDSThemeCore

public extension SDDSCounter {
    static var dataTypography: TypographyConfiguration {
        CounterTypography(
            large: AdaptiveTypographyToken.bodySNormal.typography,
            medium: AdaptiveTypographyToken.bodyXsNormal.typography,
            small: AdaptiveTypographyToken.bodyXxsNormal.typography,
            extraSmall: AdaptiveTypographyToken.bodyXxsNormal.typography,
            extraExtraSmall: AdaptiveTypographyToken.bodyXxsNormal.typography
        )
        .asContainer
    }
}

