import Foundation
import SDDSServTheme
import SDDSComponents

struct CheckboxTypography: GeneralTypographyConfiguration {
    typealias S = SelectionControlSizeConfiguration
    
    let medium: TypographyToken?
    let small: TypographyToken?
    
    init(medium: TypographyToken?, small: TypographyToken?) {
        self.medium = medium
        self.small = small
    }
    
    func typography(with size: SelectionControlSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSRadioboxSize {
        case .medium:
            return medium
        case .small, .none:
            return small
        }
    }
}

extension CheckboxTypography {
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