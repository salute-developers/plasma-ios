import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public struct LinkButton {
    public static var l: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.l
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodyLBold.typography).asContainer
=======
        appearance.subtitleTypography = LinkButtonTypography(oneSize: Typographies.bodyLBold.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodyLBold.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.m
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodyMBold.typography).asContainer
=======
        appearance.subtitleTypography = LinkButtonTypography(oneSize: Typographies.bodyMBold.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodyMBold.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.s
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodySBold.typography).asContainer
=======
        appearance.subtitleTypography = LinkButtonTypography(oneSize: Typographies.bodySBold.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodySBold.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<LinkButton, ButtonAppearance> {
        var appearance = ButtonAppearance.base
        appearance.size = LinkButtonSize.xs
<<<<<<< HEAD
<<<<<<< HEAD
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodyXsBold.typography).asContainer
=======
        appearance.subtitleTypography = LinkButtonTypography(oneSize: Typographies.bodyXsBold.typography).asContainer
>>>>>>> eae55595 (feat: added variations support in demo app)
=======
        appearance.titleTypography = LinkButtonTypography(oneSize: Typographies.bodyXsBold.typography).asContainer
>>>>>>> c1d5e653 (chore: added fixes)

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ButtonAppearance>] = [
        LinkButton.l.variation,
        LinkButton.m.variation,
        LinkButton.s.variation,
        LinkButton.xs.variation,
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClear)
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.loadingAlpha = CGFloat(0.06)
        return appearance
    }
}
