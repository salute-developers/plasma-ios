import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<TextSkeletonHeader, SkeletonAppearance, TextSkeletonHeaderVariation.H1> {
    
    var h1: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var size =  TextSkeletonHeaderAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonHeaderTypography(h1: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
    
        return .init(
            name: "h1",
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

public extension GeneralAppearanceVariation<TextSkeletonHeader, SkeletonAppearance, TextSkeletonHeaderVariation.H2> {
    
    var h2: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var size =  TextSkeletonHeaderAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonHeaderTypography(h2: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
        return .init(
            name: "h2",
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

public extension GeneralAppearanceVariation<TextSkeletonHeader, SkeletonAppearance, TextSkeletonHeaderVariation.H3> {
    
    var h3: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var size =  TextSkeletonHeaderAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonHeaderTypography(h3: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
    
        return .init(
            name: "h3",
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

public extension GeneralAppearanceVariation<TextSkeletonHeader, SkeletonAppearance, TextSkeletonHeaderVariation.H4> {
    
    var h4: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var size =  TextSkeletonHeaderAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonHeaderTypography(h4: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
    
        return .init(
            name: "h4",
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

public extension GeneralAppearanceVariation<TextSkeletonHeader, SkeletonAppearance, TextSkeletonHeaderVariation.H5> {
    
    var h5: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var size =  TextSkeletonHeaderAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonHeaderTypography(h5: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
    
        return .init(
            name: "h5",
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

public extension GeneralAppearanceVariation<TextSkeletonHeader, SkeletonAppearance, TextSkeletonHeaderVariation.H6> {
    
    var h6: ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
        var size =  TextSkeletonHeaderAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TextSkeletonHeaderTypography(h6: AdaptiveTypographyToken.headerH6Bold.typography).asContainer
    
        return .init(
            name: "h6",
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


public extension ComponentAppearanceVariation<TextSkeletonHeader, SkeletonAppearance> {
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
