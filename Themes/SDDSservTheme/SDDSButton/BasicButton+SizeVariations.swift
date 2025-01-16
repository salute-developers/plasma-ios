/* This file is code generated. */

import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
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
    static var large: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).large
    }
    static var medium: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).medium
    }
    static var small: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).small
    }
    static var extraSmall: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).extraSmall
    }
}
