import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSServTheme
import SDDSComponents

struct TextAreaClearTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
    func typography(with size: TextAreaSizeConfiguration) -> TypographyToken? {
        switch size as? TextAreaSize {
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

extension TextAreaClearTypography {
    static var title: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var text: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var innerTitle: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: nil
        ).asContainer
    }
    
    static var caption: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
    
    static var counter: TypographyConfiguration {
        TextAreaTypography(
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
