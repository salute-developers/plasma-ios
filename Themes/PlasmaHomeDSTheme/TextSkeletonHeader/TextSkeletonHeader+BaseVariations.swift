import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextSkeletonHeader {
    public static var h1: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonHeaderSize.h1
        appearance.textTypography = TextSkeletonHeaderTypography(oneSize: AdaptiveTypographyToken.headerH1Bold.typography).asContainer

        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    public static var h2: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonHeaderSize.h2
        appearance.textTypography = TextSkeletonHeaderTypography(oneSize: AdaptiveTypographyToken.headerH2Bold.typography).asContainer

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonHeaderSize.h3
        appearance.textTypography = TextSkeletonHeaderTypography(oneSize: AdaptiveTypographyToken.headerH3Bold.typography).asContainer

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonHeaderSize.h4
        appearance.textTypography = TextSkeletonHeaderTypography(oneSize: AdaptiveTypographyToken.headerH4Bold.typography).asContainer

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonHeaderSize.h5
        appearance.textTypography = TextSkeletonHeaderTypography(oneSize: AdaptiveTypographyToken.headerH5Bold.typography).asContainer

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var h6: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonHeaderSize.h6
        appearance.textTypography = TextSkeletonHeaderTypography(oneSize: AdaptiveTypographyToken.headerH6Bold.typography).asContainer

        return .init(
            name: "h6",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SkeletonAppearance>] = [
        TextSkeletonHeader.h1.variation,
        TextSkeletonHeader.h2.variation,
        TextSkeletonHeader.h3.variation,
        TextSkeletonHeader.h4.variation,
        TextSkeletonHeader.h5.variation,
        TextSkeletonHeader.h6.variation,
    ]
}

public struct TextSkeletonHeaderVariation {
    public struct H1 {}
    public struct H2 {}
    public struct H3 {}
    public struct H4 {}
    public struct H5 {}
    public struct H6 {}
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
