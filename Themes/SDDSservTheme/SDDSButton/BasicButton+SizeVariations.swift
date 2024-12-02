import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ButtonAppearanceVariation<BasicButton> {
    var large: Self {
        .init(
            appearance: appearance
                .size(BasicButtonSize.large)
                .titleTypography(BasicButton.titleTypography)
                .subtitleTypography(BasicButton.subtitleTypography)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(BasicButtonSize.medium)
                .titleTypography(BasicButton.titleTypography)
                .subtitleTypography(BasicButton.subtitleTypography)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(BasicButtonSize.small)
                .titleTypography(BasicButton.titleTypography)
                .subtitleTypography(BasicButton.subtitleTypography)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(BasicButtonSize.extraSmall)
                .titleTypography(BasicButton.titleTypography)
                .subtitleTypography(BasicButton.subtitleTypography)
        )
    }
}

public extension BasicButton {
    static var large: ButtonAppearanceVariation<BasicButton> {
        return ButtonAppearanceVariation().large
    }
    static var medium: ButtonAppearanceVariation<BasicButton> {
        return ButtonAppearanceVariation().medium
    }
    static var small: ButtonAppearanceVariation<BasicButton> {
        return ButtonAppearanceVariation().small
    }
    static var extraSmall: ButtonAppearanceVariation<BasicButton> {
        return ButtonAppearanceVariation().extraSmall
    }
}
