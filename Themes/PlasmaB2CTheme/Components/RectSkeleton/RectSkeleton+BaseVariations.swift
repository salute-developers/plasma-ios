import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct RectSkeleton {
    public static var `default`: GeneralAppearanceVariation<RectSkeleton, SkeletonAppearance, RectSkeletonVariation.Default> {
        var appearance = SkeletonAppearance.base
        appearance.size = RectSkeletonSize.`default`
        appearance.duration = CGFloat(5000.0)
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<SkeletonAppearance>] = [
        RectSkeleton.default.variation,
    ]
}

public struct RectSkeletonVariation {
    public struct Default {}
}

private extension SkeletonAppearance {
    static var base: SkeletonAppearance {
        var appearance = SkeletonAppearance()
        appearance.duration = CGFloat(5000.0)
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        return appearance
    }
}
