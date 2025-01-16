import Foundation
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

// MARK: - Size
public extension ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.large)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
                .captionTypography(TextAreaTypography.caption)
                .counterTypography(TextAreaTypography.counter)
        )
    }
    
    var medium: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.medium)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
                .captionTypography(TextAreaTypography.caption)
                .counterTypography(TextAreaTypography.counter)
        )
    }
    
    var small: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.small)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
                .captionTypography(TextAreaTypography.caption)
                .counterTypography(TextAreaTypography.counter)
        )
    }
    
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.extraSmall)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
                .captionTypography(TextAreaTypography.caption)
                .counterTypography(TextAreaTypography.counter)
        )
    }
}

public extension TextAreaClear {
    static var large: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).large
    }
    
    static var medium: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).medium
    }
    
    static var small: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).medium
    }
    
    static var extraSmall: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).extraSmall
    }
}
