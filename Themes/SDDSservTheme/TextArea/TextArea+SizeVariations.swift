import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ComponentAppearanceVariation<TextArea, TextAreaAppearance> {
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.extraSmall)
                .chipAppearance(EmbeddedChip.extraSmall.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
                .captionTypography(TextAreaTypography.caption)
                .counterTypography(TextAreaTypography.counter)
        )
    }
    var large: Self {
        .init(
            appearance: appearance
                .size(TextAreaSize.large)
                .chipAppearance(EmbeddedChip.large.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
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
                .chipAppearance(EmbeddedChip.medium.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
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
                .chipAppearance(EmbeddedChip.small.secondary.appearance)
                .chipGroupAppearance(SDDSChipGroup.dense.appearance)
                .titleTypography(TextAreaTypography.title)
                .innerTitleTypography(TextAreaTypography.innerTitle)
                .textTypography(TextAreaTypography.text)
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
