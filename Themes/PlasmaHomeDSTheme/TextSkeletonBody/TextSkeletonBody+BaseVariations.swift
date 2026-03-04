import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextSkeletonBody {
    public static var l: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonBodySize.l
        appearance.textTypography = TextSkeletonBodyTypography(oneSize: AdaptiveTypographyToken.bodyLNormal.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonBodySize.m
        appearance.textTypography = TextSkeletonBodyTypography(oneSize: AdaptiveTypographyToken.bodyMNormal.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonBodySize.s
        appearance.textTypography = TextSkeletonBodyTypography(oneSize: AdaptiveTypographyToken.bodySNormal.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonBodySize.xs
        appearance.textTypography = TextSkeletonBodyTypography(oneSize: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    public static var xxs: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonBodySize.xxs
        appearance.textTypography = TextSkeletonBodyTypography(oneSize: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer

        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SkeletonAppearance>] = [
        TextSkeletonBody.l.variation,
        TextSkeletonBody.m.variation,
        TextSkeletonBody.s.variation,
        TextSkeletonBody.xs.variation,
        TextSkeletonBody.xxs.variation,
    ]
}

public struct TextSkeletonBodyVariation {
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
    public struct Xxs {}
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
