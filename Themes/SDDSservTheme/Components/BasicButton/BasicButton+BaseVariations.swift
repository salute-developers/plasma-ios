import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct BasicButton {
    public static var l: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.l
        appearance.subtitleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.m
        appearance.subtitleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.s
        appearance.subtitleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.xl
        appearance.subtitleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.xs
        appearance.subtitleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<BasicButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = BasicButtonSize.xxs
        appearance.subtitleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.titleTypography = BasicButtonTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ButtonAppearance>] = [
        BasicButton.l.variation,
        BasicButton.m.variation,
        BasicButton.s.variation,
        BasicButton.xl.variation,
        BasicButton.xs.variation,
        BasicButton.xxs.variation,
    ]
}

public struct BasicButtonVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xl {}
    public struct Xs {}
    public struct Xxs {}
}

private extension ButtonAppearance {
    static var base: ButtonAppearance {
        var appearance = ButtonAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
