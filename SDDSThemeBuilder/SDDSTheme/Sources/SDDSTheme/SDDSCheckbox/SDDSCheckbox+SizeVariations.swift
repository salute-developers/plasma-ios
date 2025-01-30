import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension AppearanceVariation<CheckboxAppearance> {
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSCheckbox.medium.appearance.size)
                .titleTypography(CheckboxTypography.label)
                .subtitleTypography(CheckboxTypography.description)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSCheckbox.small.appearance.size)
                .titleTypography(CheckboxTypography.label)
                .subtitleTypography(CheckboxTypography.description)
        )
    }
}

public extension SDDSCheckbox {
    static var medium: AppearanceVariation<CheckboxAppearance> {
        return AppearanceVariation(appearance: CheckboxAppearance()).medium
    }
    
    static var small: AppearanceVariation<CheckboxAppearance> {
        return AppearanceVariation(appearance: CheckboxAppearance()).small
    }
}
