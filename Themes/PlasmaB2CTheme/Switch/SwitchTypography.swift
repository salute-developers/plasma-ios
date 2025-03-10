import Foundation
import SDDSComponents

struct SwitchTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    
    func typography(with size: SwitchSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSSwitchSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small, .none:
            return small
        }
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
