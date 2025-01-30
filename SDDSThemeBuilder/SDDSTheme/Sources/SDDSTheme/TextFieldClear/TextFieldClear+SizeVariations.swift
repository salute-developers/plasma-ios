import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(TextFieldSize.extraSmall)
                .chipAppearance(EmbeddedChip.extraSmall.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
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
                .chipAppearance(EmbeddedChip.large.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
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
                .chipAppearance(EmbeddedChip.medium.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
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
                .chipAppearance(EmbeddedChip.small.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
                .titleTypography(TextFieldTypography.title)
                .innerTitleTypography(TextFieldTypography.innerTitle)
                .textTypography(TextFieldTypography.text)
                .textAfterTypography(TextFieldTypography.text)
                .textBeforeTypography(TextFieldTypography.text)
                .captionTypography(TextFieldTypography.caption)
        )
    }
}

public extension TextFieldClear {
    static var extraSmall: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).extraSmall
    }
    static var large: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).large
    }
    static var medium: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).medium
    }
    static var small: ComponentAppearanceVariation<TextFieldClear, TextFieldAppearance> {
        return ComponentAppearanceVariation(appearance: TextFieldAppearance()).small
    }
}
