import Foundation
import SDDSComponents
import SDDSThemeCore

// MARK: - Size
public extension ButtonAppearanceVariation<LinkButton> {
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
    static var large: ButtonAppearanceVariation<LinkButton> {
        return ButtonAppearanceVariation().large
    }
    static var medium: ButtonAppearanceVariation<LinkButton> {
        return ButtonAppearanceVariation().medium
    }
    static var small: ButtonAppearanceVariation<LinkButton> {
        return ButtonAppearanceVariation().small
    }
    static var extraSmall: ButtonAppearanceVariation<LinkButton> {
        return ButtonAppearanceVariation().extraSmall
    }
}
