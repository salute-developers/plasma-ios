import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextSkeletonText {
    public static var l: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonTextSize.l
        appearance.textTypography = TextSkeletonTextTypography(oneSize: AdaptiveTypographyToken.textLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonTextSize.m
        appearance.textTypography = TextSkeletonTextTypography(oneSize: AdaptiveTypographyToken.textMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonTextSize.s
        appearance.textTypography = TextSkeletonTextTypography(oneSize: AdaptiveTypographyToken.textSNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonTextSize.xs
        appearance.textTypography = TextSkeletonTextTypography(oneSize: AdaptiveTypographyToken.textXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SkeletonAppearance>] = [
        TextSkeletonText.l.variation,
        TextSkeletonText.m.variation,
        TextSkeletonText.s.variation,
        TextSkeletonText.xs.variation,
    ]
}

public struct TextSkeletonTextVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension SkeletonAppearance {
    static var base: SkeletonAppearance {
        var appearance = SkeletonAppearance()
        appearance.duration = CGFloat(700.0)
        appearance.gradient = .color(.surfaceDefaultTransparentSecondary)
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        return appearance
    }
}
