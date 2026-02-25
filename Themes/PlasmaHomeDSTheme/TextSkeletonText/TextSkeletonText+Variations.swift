import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TextSkeletonText, SkeletonAppearance, TextSkeletonTextVariation.L> {
    
    var l: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var size =  TextSkeletonTextAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonTextTypography(l: AdaptiveTypographyToken.textLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextSkeletonText, SkeletonAppearance, TextSkeletonTextVariation.M> {
    
    var m: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var size =  TextSkeletonTextAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonTextTypography(m: AdaptiveTypographyToken.textMNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextSkeletonText, SkeletonAppearance, TextSkeletonTextVariation.S> {
    
    var s: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var size =  TextSkeletonTextAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonTextTypography(s: AdaptiveTypographyToken.textSNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextSkeletonText, SkeletonAppearance, TextSkeletonTextVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
        var size =  TextSkeletonTextAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonTextTypography(xs: AdaptiveTypographyToken.textXsNormal.typography).asContainer
    
        return .init(
            name: "xs",
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


public extension ComponentAppearanceVariation<TextSkeletonText, SkeletonAppearance> {
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
