import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Checkbox {
    public static var m: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance.base
        appearance.size = CheckboxSize.m
        appearance.subtitleTypography = CheckboxTypography(oneSize: Typographies.bodySNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(oneSize: Typographies.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance.base
        appearance.size = CheckboxSize.s
        appearance.subtitleTypography = CheckboxTypography(oneSize: Typographies.bodyXsNormal.typography).asContainer
        appearance.titleTypography = CheckboxTypography(oneSize: Typographies.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CheckboxAppearance>] = [
        Checkbox.m.variation,
        Checkbox.s.variation,
    ]
}

public struct CheckboxVariation {
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
