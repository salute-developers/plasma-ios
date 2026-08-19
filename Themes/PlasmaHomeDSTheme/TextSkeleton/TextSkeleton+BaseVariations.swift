import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextSkeleton {
    public static var `default`: ComponentAppearanceVariation<TextSkeleton, SkeletonAppearance> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonSize.`default`
        appearance.duration = CGFloat(700.0)
        appearance.gradient = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentSecondary), values: [])
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<SkeletonAppearance>] {
        [
            TextSkeleton.default.variation,
        ]
    }
}

public struct TextSkeletonVariation {
    public struct Default {}
}

private extension SkeletonAppearance {
    static var base: SkeletonAppearance {
        var appearance = SkeletonAppearance()
        appearance.duration = CGFloat(700.0)
        appearance.gradient = StatefulFillStyle(defaultValue: .color(.surfaceDefaultTransparentSecondary), values: [])
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        return appearance
    }
}
