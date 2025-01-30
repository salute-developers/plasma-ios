/* This file is code generated. */

import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ComponentAppearanceVariation<IconButton, ButtonAppearance> {
    var large: Self {
        .init(
            appearance: appearance
                .size(IconButtonSize.large)
        )
    }
    var medium: Self {
        .init(
            appearance: appearance
                .size(IconButtonSize.medium)
        )
    }
    var small: Self {
        .init(
            appearance: appearance
                .size(IconButtonSize.small)
        )
    }
    var extraSmall: Self {
        .init(
            appearance: appearance
                .size(IconButtonSize.extraSmall)
        )
    }
}

public extension IconButton {
    static var large: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).large
    }
    static var medium: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).medium
    }
    static var small: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).small
    }
    static var extraSmall: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        return ComponentAppearanceVariation(appearance: ButtonAppearance()).extraSmall
    }
}
