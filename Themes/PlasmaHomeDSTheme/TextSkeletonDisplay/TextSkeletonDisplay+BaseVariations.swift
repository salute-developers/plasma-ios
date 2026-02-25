import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextSkeletonDisplay {
    public static var l: ComponentAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonDisplaySize.l
        appearance.textTypography = TextSkeletonDisplayTypography(oneSize: AdaptiveTypographyToken.displayLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonDisplaySize.m
        appearance.textTypography = TextSkeletonDisplayTypography(oneSize: AdaptiveTypographyToken.displayMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonDisplaySize.s
        appearance.textTypography = TextSkeletonDisplayTypography(oneSize: AdaptiveTypographyToken.displaySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SkeletonAppearance>] = [
        TextSkeletonDisplay.l.variation,
        TextSkeletonDisplay.m.variation,
        TextSkeletonDisplay.s.variation,
    ]
}

public struct TextSkeletonDisplayVariation {
    public struct L {}
    public struct M {}
    public struct S {}
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
