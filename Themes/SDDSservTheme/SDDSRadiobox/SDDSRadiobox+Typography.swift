import Foundation
import SDDSServTheme
import SDDSComponents

public struct RadioboxTypography: GeneralTypographyConfiguration {
    typealias S = SelectionControlSizeConfiguration
    
    let medium: TypographyToken?
    let small: TypographyToken?
    
    public init(medium: TypographyToken?, small: TypographyToken?) {
        self.medium = medium
        self.small = small
    }
    
    public func typography(with size: SelectionControlSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSRadioboxSize {
        case .medium:
            return medium
        case .small, .none:
            return small
        }
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
            medium: Typographies.bodySNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
