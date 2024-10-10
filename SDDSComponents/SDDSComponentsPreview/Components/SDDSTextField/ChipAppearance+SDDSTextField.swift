import Foundation
import SwiftUI
import SDDSServTheme
import SDDSComponents

public extension ChipAppearance {
    static var textField: ChipAppearance {
        ChipAppearance(
            titleColor: .surfaceInverseSolidPrimary.withOpacity(0.96),
            titleTypography: ChipTextFieldTypography.text,
            imageTintColor: Color.clear.token,
            buttonTintColor: Color.clear.token,
            backgroundColor: .surfaceDefaultTransparentSecondary,
            disabledAlpha: 0.5
        )
    }
}

struct ChipTextFieldTypography: GeneralTypographyConfiguration {
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

extension ChipTextFieldTypography {
    static var text: TypographyConfiguration {
        ChipTextFieldTypography(
            large: Typographies.bodyLNormal.typography,
            medium: Typographies.bodyMNormal.typography,
            small: Typographies.bodySNormal.typography,
            extraSmall: Typographies.bodyXsNormal.typography
        ).asContainer
    }
}

#Preview {
    SDDSTextFieldPreview.previews
}
