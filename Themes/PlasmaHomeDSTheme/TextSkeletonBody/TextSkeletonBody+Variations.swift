import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TextSkeletonBody, SkeletonAppearance, TextSkeletonBodyVariation.L> {
    
    var l: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var size =  TextSkeletonBodyAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonBodyTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextSkeletonBody, SkeletonAppearance, TextSkeletonBodyVariation.M> {
    
    var m: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var size =  TextSkeletonBodyAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonBodyTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextSkeletonBody, SkeletonAppearance, TextSkeletonBodyVariation.S> {
    
    var s: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var size =  TextSkeletonBodyAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonBodyTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextSkeletonBody, SkeletonAppearance, TextSkeletonBodyVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var size =  TextSkeletonBodyAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonBodyTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<TextSkeletonBody, SkeletonAppearance, TextSkeletonBodyVariation.Xxs> {
    
    var xxs: ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
        var size =  TextSkeletonBodyAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonBodyTypography(xxs: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "xxs",
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


public extension ComponentAppearanceVariation<TextSkeletonBody, SkeletonAppearance> {
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
