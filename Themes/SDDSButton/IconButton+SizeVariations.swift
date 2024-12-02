import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ButtonAppearanceVariation<IconButton> {
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
    static var large: ButtonAppearanceVariation<IconButton> {
        return ButtonAppearanceVariation().large
    }
    static var medium: ButtonAppearanceVariation<IconButton> {
        return ButtonAppearanceVariation().medium
    }
    static var small: ButtonAppearanceVariation<IconButton> {
        return ButtonAppearanceVariation().small
    }
    static var extraSmall: ButtonAppearanceVariation<IconButton> {
        return ButtonAppearanceVariation().extraSmall
    }
}
