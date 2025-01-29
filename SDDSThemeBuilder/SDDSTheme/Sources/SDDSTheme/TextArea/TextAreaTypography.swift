import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore

struct TextAreaTypography: GeneralTypographyConfiguration {
    let extraSmall: TypographyToken?
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    
    func typography(with size: TextFieldSizeConfiguration) -> TypographyToken? {
        switch size as? TextAreaSize {
        case .extraSmall:
            return extraSmall
        case .large:
            return large
        case .medium:
            return medium
        case .small:
            return small
        case .none:
            return nil
    }
}

extension TextAreaTypography {
    static var title: TypographyConfiguration {
        TextAreaTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var text: TypographyConfiguration {
        TextAreaTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var innerTitle: TypographyConfiguration {
        TextAreaTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var caption: TypographyConfiguration {
        TextAreaTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var counter: TypographyConfiguration {
        TextAreaTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
