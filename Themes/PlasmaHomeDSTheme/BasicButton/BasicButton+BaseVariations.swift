import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct BasicButton {
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
    
    public static let all: [Variation<ButtonAppearance>] = [
        BasicButton.m.variation,
        BasicButton.s.variation,
    ]
}

public struct BasicButtonVariation {
    public struct M {}
    public struct S {}
}

private extension ButtonAppearance {
    static var base: ButtonAppearance {
        var appearance = ButtonAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        return appearance
    }
}
