import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct TextSkeleton {
    public static var `default`: GeneralAppearanceVariation<TextSkeleton, SkeletonAppearance, TextSkeletonVariation.Default> {
        var appearance = SkeletonAppearance.base
        appearance.size = TextSkeletonSize.`default`
        appearance.duration = CGFloat(5000.0)
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SkeletonAppearance>] = [
        TextSkeleton.default.variation,
    ]
}

public struct TextSkeletonVariation {
    public struct Default {}
}

private extension SkeletonAppearance {
    static var base: SkeletonAppearance {
        var appearance = SkeletonAppearance()
        appearance.duration = CGFloat(5000.0)
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer
        return appearance
    }
}
