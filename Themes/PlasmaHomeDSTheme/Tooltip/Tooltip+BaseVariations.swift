import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Tooltip {
    public static var m: ComponentAppearanceVariation<Tooltip, TooltipAppearance> {
        var appearance = TooltipAppearance.base
        appearance.size = TooltipSize.m
        appearance.textTypography = TooltipTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<Tooltip, TooltipAppearance> {
        var appearance = TooltipAppearance.base
        appearance.size = TooltipSize.s
        appearance.textTypography = TooltipTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<TooltipAppearance>] = [
        Tooltip.m.variation,
        Tooltip.s.variation,
    ]
}

public struct TooltipVariation {
    public struct M {}
    public struct S {}
}

private extension TooltipAppearance {
    static var base: TooltipAppearance {
        var appearance = TooltipAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.contentStartColor = ColorToken.textDefaultSecondary
        appearance.shadow = ShadowToken.downHardM
        appearance.textColor = ColorToken.textDefaultPrimary
        return appearance
    }
}
