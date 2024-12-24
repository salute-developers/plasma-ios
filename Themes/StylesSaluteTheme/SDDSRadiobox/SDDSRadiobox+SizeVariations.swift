import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension AppearanceVariation<RadioboxAppearance> {
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSRadiobox.medium.appearance.size)
                .titleTypography(RadioboxTypography.label)
                .subtitleTypography(RadioboxTypography.description)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSRadiobox.small.appearance.size)
                .titleTypography(RadioboxTypography.label)
                .subtitleTypography(RadioboxTypography.description)
        )
    }
}

public extension SDDSRadiobox {
    static var medium: AppearanceVariation<RadioboxAppearance> {
        return AppearanceVariation(appearance: RadioboxAppearance()).medium
    }
    
    static var small: AppearanceVariation<RadioboxAppearance> {
        return AppearanceVariation(appearance: RadioboxAppearance()).small
    }
}
