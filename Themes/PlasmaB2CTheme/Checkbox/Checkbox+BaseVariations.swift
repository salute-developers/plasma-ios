import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Checkbox {
    public static var l: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance.base
        appearance.size = CheckboxSize.l
        appearance.subtitleTypography = CheckboxTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance.base
        appearance.size = CheckboxSize.m
        appearance.subtitleTypography = CheckboxTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance.base
        appearance.size = CheckboxSize.s
        appearance.subtitleTypography = CheckboxTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CheckboxAppearance>] = [
        Checkbox.l.variation,
        Checkbox.m.variation,
        Checkbox.s.variation,
    ]
}

public struct CheckboxVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension CheckboxAppearance {
    static var base: CheckboxAppearance {
        var appearance = CheckboxAppearance()
        appearance.disabledAlpha = CGFloat(0.4)
        appearance.subtitleColor = ColorToken.textDefaultSecondary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
