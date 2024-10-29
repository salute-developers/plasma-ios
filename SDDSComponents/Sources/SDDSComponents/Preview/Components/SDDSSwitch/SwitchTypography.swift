import Foundation


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
