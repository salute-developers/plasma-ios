import Foundation
import SwiftUI

@_exported import SDDSservTheme

struct AvatarTypography: GeneralTypographyConfiguration {
    let extraExtraLarge: TypographyToken?
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    
    init(extraExtraLarge: TypographyToken?, large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?) {
        self.extraExtraLarge = extraExtraLarge
        self.large = large
        self.medium = medium
        self.small = small
    }
    
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
            small: Typographies.headerH5Bold.typography
        ).asContainer
    }
}
