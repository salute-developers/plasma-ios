import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

public extension RadioboxAppearance {
    static var `default`: Self {
        .init(
            titleTypography: RadioboxTypography.label,
            subtitleTypography: RadioboxTypography.description,
            titleColor: .backgroundInversePrimary,
            subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
            disabledAlpha: 0.4, 
            imageTintColor: nil
        )
    }
}

public extension RadioboxTypography {
    static var label: TypographyConfiguration {
        RadioboxTypography(
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var description: TypographyConfiguration {
        RadioboxTypography(
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
