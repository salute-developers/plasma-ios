import Foundation
import SwiftUI
import SDDSServTheme
import SDDSComponents
import SDDSThemeCore

public extension ChipAppearance {
    static var `default`: ChipAppearance {
        .init(
            titleColor: ColorToken.textInversePrimary,
            titleTypography: ChipTypography.title,
            imageTintColor: ColorToken.textInversePrimary,
            buttonTintColor: ColorToken.textInversePrimary,
            backgroundColor: ColorToken.backgroundInversePrimary,
            disabledAlpha: 0.5
        )
    }
}

public struct ChipTypography: GeneralTypographyConfiguration {
    public let large: TypographyToken?
    public let medium: TypographyToken?
    public let small: TypographyToken?
    public let extraSmall: TypographyToken?
    
    public func typography(with size: ChipSizeConfiguration) -> TypographyToken? {
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

public extension ChipTypography {
    static var title: TypographyConfiguration {
        ChipTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
