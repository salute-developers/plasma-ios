import Foundation
import SwiftUI
import SDDSServTheme
import SDDSComponents
import SDDSThemeCore

public extension ChipAppearance {
    static var `default`: ChipAppearance {
        .init(
            titleColor: Color.white.token,
            titleTypography: ChipTypography.title,
            imageTintColor: Color.white.token,
            buttonTintColor: Color.gray.token,
            disabledAlpha: 0.5
        )
    }
}

struct ChipTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    func typography(with size: ChipSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSChipSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small, .none:
            return small
        case .extraSmall:
            return extraSmall
        }
    }
}

extension ChipTypography {
    static var title: TypographyConfiguration {
        ChipTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
