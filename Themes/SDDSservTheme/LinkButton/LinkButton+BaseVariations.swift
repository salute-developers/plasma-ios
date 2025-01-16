import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct LinkButton {
    public static var l: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.l
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.m
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.s
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.xs
        appearance.subtitleTypography = TextFieldTypography(oneSize: Typographies.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Any] = [
        LinkButton.l,
        LinkButton.m,
        LinkButton.s,
        LinkButton.xs,
    ]
}

public struct LinkButtonVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension ButtonAppearance {
    static var base: ButtonAppearance {
        var appearance = ButtonAppearance()
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: .clearColor, hoveredColor: .clearColor)
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.loadingAlpha = CGFloat(0.06)
        return appearance
    }
}
