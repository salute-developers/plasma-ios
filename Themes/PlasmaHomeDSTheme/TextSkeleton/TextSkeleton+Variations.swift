import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TextSkeleton, SkeletonAppearance, TextSkeletonVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<TextSkeleton, SkeletonAppearance> {
        var size =  TextSkeletonAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.duration = CGFloat(700.0)
        appearance.gradient = .color(.surfaceDefaultTransparentSecondary)
        appearance.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    
        return .init(
            name: "default",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<TextSkeleton, SkeletonAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension SkeletonAppearance {
    
}
