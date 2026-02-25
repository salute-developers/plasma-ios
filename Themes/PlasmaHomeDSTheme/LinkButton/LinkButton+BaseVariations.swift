import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct LinkButton {
    public static var l: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.l
        appearance.titleTypography = LinkButtonTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.m
        appearance.titleTypography = LinkButtonTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.s
        appearance.titleTypography = LinkButtonTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xl: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.xl
        appearance.titleTypography = LinkButtonTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.xs
        appearance.titleTypography = LinkButtonTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.xxs
        appearance.titleTypography = LinkButtonTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ButtonAppearance>] = [
        LinkButton.l.variation,
        LinkButton.m.variation,
        LinkButton.s.variation,
        LinkButton.xl.variation,
        LinkButton.xs.variation,
        LinkButton.xxs.variation,
    ]
}

public struct LinkButtonVariation {
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClear, selectedColor: .clearColor)
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.loadingAlpha = CGFloat(0.06)
        return appearance
    }
}
