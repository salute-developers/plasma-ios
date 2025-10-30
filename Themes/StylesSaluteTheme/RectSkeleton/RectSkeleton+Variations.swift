import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<RectSkeleton, SkeletonAppearance, RectSkeletonVariation.Default> {
    
    var `default`: AppearanceVariation<SkeletonAppearance> {
        var appearance = appearance
        appearance.gradient = GradientToken.surfaceDefaultSkeletonGradient
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var lighter: AppearanceVariation<SkeletonAppearance> {
        var appearance = appearance
        appearance.gradient = GradientToken.surfaceDefaultSkeletonDeepGradient
        
        return .init(
            name: "lighter",
            appearance: appearance
        )
    }
    var variation: Variation<SkeletonAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.lighter,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<RectSkeleton, SkeletonAppearance> {
    var `default`: AppearanceVariation<SkeletonAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var lighter: AppearanceVariation<SkeletonAppearance> {
        return .init(
            name: "lighter",
            appearance: appearance.lighter
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.lighter,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension SkeletonAppearance {
    
    var `default`: SkeletonAppearance {
        var appearance = self
        appearance.gradient = GradientToken.surfaceDefaultSkeletonGradient
        return appearance
    }
    
    var lighter: SkeletonAppearance {
        var appearance = self
        appearance.gradient = GradientToken.surfaceDefaultSkeletonDeepGradient
        return appearance
    }
    
}
