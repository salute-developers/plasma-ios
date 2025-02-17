import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct BasicButton {
    public static var l: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.l
        appearance.subtitleTypography = BasicButtonTypography(oneSize: Typographies.bodyLBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: Typographies.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.m
        appearance.subtitleTypography = BasicButtonTypography(oneSize: Typographies.bodyMBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: Typographies.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.s
        appearance.subtitleTypography = BasicButtonTypography(oneSize: Typographies.bodySBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: Typographies.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.xs
        appearance.subtitleTypography = BasicButtonTypography(oneSize: Typographies.bodyXsBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: Typographies.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ButtonAppearance>] = [
        BasicButton.l.variation,
        BasicButton.m.variation,
        BasicButton.s.variation,
        BasicButton.xs.variation,
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
