// MARK: - Size
import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension AppearanceVariation<SwitchAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(SDDSSwitchSize.large)
                .titleTypography(SwitchTypography.label)
                .titleTypography(SwitchTypography.description)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(SDDSSwitchSize.medium)
                .titleTypography(SwitchTypography.label)
                .titleTypography(SwitchTypography.description)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(SDDSSwitchSize.small)
                .titleTypography(SwitchTypography.label)
                .titleTypography(SwitchTypography.description)
        )
    }
}

public extension SDDSSwitch {
    static var large: AppearanceVariation<SwitchAppearance> {
        return AppearanceVariation(appearance: SwitchAppearance()).large
    }
    
    static var medium: AppearanceVariation<SwitchAppearance> {
        return AppearanceVariation(appearance: SwitchAppearance()).medium
    }
    
    static var small: AppearanceVariation<SwitchAppearance> {
        return AppearanceVariation(appearance: SwitchAppearance()).small
    }
}
