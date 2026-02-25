import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance, TextSkeletonDisplayVariation.L> {
    
    var l: ComponentAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance> {
        var size =  TextSkeletonDisplayAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonDisplayTypography(l: AdaptiveTypographyToken.displayLNormal.typography).asContainer
    
        return .init(
            name: "l",
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

public extension GeneralAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance, TextSkeletonDisplayVariation.M> {
    
    var m: ComponentAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance> {
        var size =  TextSkeletonDisplayAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonDisplayTypography(m: AdaptiveTypographyToken.displayMNormal.typography).asContainer
    
        return .init(
            name: "m",
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

public extension GeneralAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance, TextSkeletonDisplayVariation.S> {
    
    var s: ComponentAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance> {
        var size =  TextSkeletonDisplayAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonDisplayTypography(s: AdaptiveTypographyToken.displaySNormal.typography).asContainer
    
        return .init(
            name: "s",
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


public extension ComponentAppearanceVariation<TextSkeletonDisplay, SkeletonAppearance> {
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
