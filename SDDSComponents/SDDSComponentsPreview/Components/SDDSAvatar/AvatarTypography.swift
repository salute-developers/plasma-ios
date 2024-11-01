import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct AvatarTypography: GeneralTypographyConfiguration {
    let extraExtraLarge: TypographyToken?
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    
    func typography(with size: AvatarSizeConfiguration) -> TypographyToken? {
        switch size as? DefaultAvatarSize {
        case .extraExtraLarge:
            return extraExtraLarge
        case .large:
            return large
        case .medium:
            return medium
        case .small:
            return small
        case .scalable, .none:
            return nil
        }
    }
}

extension AvatarTypography {
   static var title: TypographyConfiguration {
        return AvatarTypography(
            extraExtraLarge: Typographies.headerH2Bold.typography,
            large: Typographies.headerH4Bold.typography,
            medium: Typographies.headerH5Bold.typography,
            small: Typographies.textXsBold.typography
        ).asContainer
    }
}
