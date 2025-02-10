import Foundation
import SDDSComponents

struct RadioboxTypography: GeneralTypographyConfiguration {
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
        switch size as? SDDSRadioboxSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small, .none:
            return small
        }
    }
}

extension RadioboxTypography {
    static var label: TypographyConfiguration {
        RadioboxTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var description: TypographyConfiguration {
        RadioboxTypography(
            large: Typographies.bodyMNormal.typography,
            medium: Typographies.bodySNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
