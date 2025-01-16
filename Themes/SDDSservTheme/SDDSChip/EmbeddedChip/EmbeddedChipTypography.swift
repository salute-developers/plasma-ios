import Foundation
import SwiftUI
import SDDSComponents

public struct EmbeddedChipTypography: GeneralTypographyConfiguration {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    
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

public extension EmbeddedChipTypography {
    static var title: TypographyConfiguration {
        EmbeddedChipTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}
