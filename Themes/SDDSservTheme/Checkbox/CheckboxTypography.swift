import Foundation
import SDDSComponents

struct CheckboxTypography: GeneralTypographyConfiguration {
    typealias S = SelectionControlSizeConfiguration
    
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    
    init(large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?) {
        self.large = large
        self.medium = medium
        self.small = small
    }
    
    func typography(with size: SelectionControlSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSCheckboxSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small, .none:
            return small
        }
    }
}

extension CheckboxTypography {
    static var label: TypographyConfiguration {
        CheckboxTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var description: TypographyConfiguration {
        CheckboxTypography(
            large: Typographies.bodyMNormal.typography,
            medium: Typographies.bodySNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
