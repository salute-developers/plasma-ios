import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(TextAreaClearSize.extraSmall)
                .titleTypography(TextAreaClearTypography.title)
                .innerTitleTypography(TextAreaClearTypography.innerTitle)
                .textTypography(TextAreaClearTypography.text)
                .captionTypography(TextAreaClearTypography.caption)
                .counterTypography(TextAreaClearTypography.counter)
        )
    }
    var large: Self {
        .init(
            appearance: appearance
                .size(TextAreaClearSize.large)
                .titleTypography(TextAreaClearTypography.title)
                .innerTitleTypography(TextAreaClearTypography.innerTitle)
                .textTypography(TextAreaClearTypography.text)
                .captionTypography(TextAreaClearTypography.caption)
                .counterTypography(TextAreaClearTypography.counter)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(TextAreaClearSize.medium)
                .titleTypography(TextAreaClearTypography.title)
                .innerTitleTypography(TextAreaClearTypography.innerTitle)
                .textTypography(TextAreaClearTypography.text)
                .captionTypography(TextAreaClearTypography.caption)
                .counterTypography(TextAreaClearTypography.counter)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(TextAreaClearSize.small)
                .titleTypography(TextAreaClearTypography.title)
                .innerTitleTypography(TextAreaClearTypography.innerTitle)
                .textTypography(TextAreaClearTypography.text)
                .captionTypography(TextAreaClearTypography.caption)
                .counterTypography(TextAreaClearTypography.counter)
        )
    }
}

public extension TextAreaClear {
    static var extraSmall: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).extraSmall
    }
    static var large: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).large
    }
    static var medium: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).medium
    }
    static var small: ComponentAppearanceVariation<TextAreaClear, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).small
    }
}
