import Foundation
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

// MARK: - Size
public extension ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.extraSmall)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
                .textAfterTypography(TextAreaTypography.text)
                .textBeforeTypography(TextAreaTypography.text)
                .captionTypography(TextAreaTypography.caption)
                .counterTypography(TextAreaTypography.counter)
        )
    }
    var large: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.large)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
                .textAfterTypography(TextAreaTypography.text)
                .textBeforeTypography(TextAreaTypography.text)
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
                .textAfterTypography(TextAreaTypography.text)
                .textBeforeTypography(TextAreaTypography.text)
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
                .textAfterTypography(TextAreaTypography.text)
                .textBeforeTypography(TextAreaTypography.text)
                .captionTypography(TextAreaTypography.caption)
                .counterTypography(TextAreaTypography.counter)
        )
    }
}

public extension TextArea {
    static var extraSmall: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).extraSmall
    }
    static var large: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).large
    }
    static var medium: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).medium
    }
    static var small: ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
        return ComponentAppearanceVariation(appearance: TextAreaAppearance()).small
    }
}
