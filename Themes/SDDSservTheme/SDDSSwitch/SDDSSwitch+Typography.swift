import Foundation
import SDDSComponents


public extension SwitchAppearance {
    static var defaultAppearance: SwitchAppearance {
        .init(
            size: SDDSSwitchSize.medium,
            titleTypography: SwitchTypography.label,
            subtitleTypography: SwitchTypography.description,
            titleColor: .backgroundInversePrimary,
            subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
            tintColor: .surfaceDefaultAccent,
            disabledAlpha: 0.4
        )
    }
}

extension SwitchTypography {
    static var label: TypographyConfiguration {
        SwitchTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var description: TypographyConfiguration {
        SwitchTypography(
            large: Typographies.bodyMNormal.typography,
            medium: Typographies.bodySNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
