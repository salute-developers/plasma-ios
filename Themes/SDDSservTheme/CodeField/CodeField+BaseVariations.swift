import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CodeField {
    public static var l: GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.L> {
        var appearance = CodeFieldAppearance.base
        appearance.size = CodeFieldSize.l
        appearance.captionTypography = CodeFieldTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.valueTypography = CodeFieldTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: GeneralAppearanceVariation<CodeField, CodeFieldAppearance, CodeFieldVariation.M> {
        var appearance = CodeFieldAppearance.base
        appearance.size = CodeFieldSize.m
        appearance.captionTypography = CodeFieldTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.valueTypography = CodeFieldTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CodeFieldAppearance>] = [
        CodeField.l.variation,
        CodeField.l.segmented.variation,
        CodeField.m.variation,
        CodeField.m.segmented.variation,
    ]
}

public struct CodeFieldVariation {
    public struct L {}
    public struct LSegmented {}
    public struct M {}
    public struct MSegmented {}
}

private extension CodeFieldAppearance {
    static var base: CodeFieldAppearance {
        var appearance = CodeFieldAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidPrimary
        appearance.backgroundColorActivated = ColorToken.surfaceDefaultTransparentSecondary
        appearance.backgroundColorError = ColorToken.surfaceDefaultTransparentNegative
        appearance.captionColor = ColorToken.textDefaultSecondary
        appearance.captionColorError = ColorToken.textDefaultNegative
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.dotColor = ColorToken.surfaceDefaultSolidDefault
        appearance.dotColorError = ColorToken.surfaceDefaultNegative
        appearance.valueColor = ColorToken.textDefaultPrimary
        appearance.valueColorError = ColorToken.textDefaultNegative
        return appearance
    }
}
