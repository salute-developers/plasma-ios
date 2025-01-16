/* This file is code generated. */

import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(LinkButtonSize.large)
                .titleTypography(LinkButton.titleTypography)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(LinkButtonSize.medium)
                .titleTypography(LinkButton.titleTypography)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(LinkButtonSize.small)
                .titleTypography(LinkButton.titleTypography)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(LinkButtonSize.extraSmall)
                .titleTypography(LinkButton.titleTypography)
        )
    }
}

public extension LinkButton {
    static var large: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).large
    }
    static var medium: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).medium
    }
    static var small: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).small
    }
    static var extraSmall: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).extraSmall
    }
}
