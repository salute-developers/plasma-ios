import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(TextFieldSize.extraSmall)
                .titleTypography(TextFieldTypography.title)
                .innerTitleTypography(TextFieldTypography.innerTitle)
                .textTypography(TextFieldTypography.text)
                .textAfterTypography(TextFieldTypography.text)
                .textBeforeTypography(TextFieldTypography.text)
                .captionTypography(TextFieldTypography.caption)
        )
    }
    var large: Self {
        .init(
            appearance: appearance
                .size(TextFieldSize.large)
                .titleTypography(TextFieldTypography.title)
                .innerTitleTypography(TextFieldTypography.innerTitle)
                .textTypography(TextFieldTypography.text)
                .textAfterTypography(TextFieldTypography.text)
                .textBeforeTypography(TextFieldTypography.text)
                .captionTypography(TextFieldTypography.caption)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(TextFieldSize.medium)
                .titleTypography(TextFieldTypography.title)
                .innerTitleTypography(TextFieldTypography.innerTitle)
                .textTypography(TextFieldTypography.text)
                .textAfterTypography(TextFieldTypography.text)
                .textBeforeTypography(TextFieldTypography.text)
                .captionTypography(TextFieldTypography.caption)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(TextFieldSize.small)
                .titleTypography(TextFieldTypography.title)
                .innerTitleTypography(TextFieldTypography.innerTitle)
                .textTypography(TextFieldTypography.text)
                .textAfterTypography(TextFieldTypography.text)
                .textBeforeTypography(TextFieldTypography.text)
                .captionTypography(TextFieldTypography.caption)
        )
    }
}

public extension SDDSComponents.TextField {
    static var extraSmall: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).extraSmall
    }
    static var large: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).large
    }
    static var medium: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).medium
    }
    static var small: ComponentAppearanceVariation<SDDSComponents.TextField, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).small
    }
}
