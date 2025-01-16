import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct BasicButton {
    public static var l: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.l
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodyLBold.typography).asContainer
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.m
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodyMBold.typography).asContainer
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.s
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodySBold.typography).asContainer
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.xs
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodyXsBold.typography).asContainer
        appearance.titleTypography = TextFieldTypography(oneSize: Typographies.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Any] = [
        BasicButton.l,
        BasicButton.m,
        BasicButton.s,
        BasicButton.xs,
    ]
}

public struct BasicButtonVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension ButtonAppearance {
    static var base: ButtonAppearance {
        var appearance = ButtonAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
