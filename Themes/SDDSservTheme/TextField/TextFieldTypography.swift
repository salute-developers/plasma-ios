import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextFieldTypography: GeneralTypographyConfiguration {
    let extraSmall: TypographyToken?
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    
    public func typography(with size: TextFieldSizeConfiguration) -> TypographyToken? {
        switch size as? TextFieldSize {
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
}

public extension TextFieldTypography {
    static var title: TypographyConfiguration {
        TextFieldTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var text: TypographyConfiguration {
        TextFieldTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var innerTitle: TypographyConfiguration {
        TextFieldTypography(
            extraSmall: nil,
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
     
    static var caption: TypographyConfiguration {
        TextFieldTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
