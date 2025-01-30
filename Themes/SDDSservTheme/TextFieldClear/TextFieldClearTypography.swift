import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct TextFieldClearTypography: GeneralTypographyConfiguration {
    let extraSmall: TypographyToken?
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    
    public func typography(with size: TextFieldSizeConfiguration) -> TypographyToken? {
        switch size as? TextFieldClearSize {
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

public extension TextFieldClearTypography {
    static var title: TypographyConfiguration {
        TextFieldClearTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var text: TypographyConfiguration {
        TextFieldClearTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography
        ).asContainer
    }
    
    static var innerTitle: TypographyConfiguration {
        TextFieldClearTypography(
            extraSmall: nil,
            large: nil,
            medium: nil,
            small: nil
        ).asContainer
    }
     
    static var caption: TypographyConfiguration {
        TextFieldClearTypography(
            extraSmall: Typographies.bodyXsNormal.typography,
            large: Typographies.bodyXsNormal.typography,
            medium: Typographies.bodyXsNormal.typography,
            small: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
