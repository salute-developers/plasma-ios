import Foundation
import SwiftUI

@_exported import SDDSservTheme
@_exported import SDDSThemeCore

struct TextFieldTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    func typography(with size: TextFieldSizeConfiguration) -> TypographyToken? {
        switch size as? SDDSTextFieldSize {
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

extension TextFieldTypography {
    static var title: TypographyConfiguration {
        TextFieldTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var text: TypographyConfiguration {
        TextFieldTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var innerTitle: TypographyConfiguration {
        TextFieldTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: nil
        ).asContainer
    }
    
    static var caption: TypographyConfiguration {
        TextFieldTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
