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
