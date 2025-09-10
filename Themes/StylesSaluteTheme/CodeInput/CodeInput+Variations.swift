import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<CodeInput, CodeInputAppearance, CodeInputVariation.L> {
    
    var l: ComponentAppearanceVariation<CodeInput, CodeInputAppearance> {
        var size =  CodeInputAnySize(size: appearance.size)
        size.captionPadding = CGFloat(40.0)
        size.dotSize = CGFloat(24.0)
        size.groupSpacing = CGFloat(36.0)
        size.itemHeight = CGFloat(92.0)
        size.itemSpacing = CGFloat(12.0)
        size.itemWidth = CGFloat(56.0)
        size.strokeWidth = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.captionTypography = CodeInputTypography(l: AdaptiveTypographyToken.headerH3Normal.typography).asContainer
        appearance.codeTypography = CodeInputTypography(l: AdaptiveTypographyToken.displayLBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<CodeInput, CodeInputAppearance, CodeInputVariation.M> {
    
    var m: ComponentAppearanceVariation<CodeInput, CodeInputAppearance> {
        var size =  CodeInputAnySize(size: appearance.size)
        size.captionPadding = CGFloat(28.0)
        size.dotSize = CGFloat(16.0)
        size.groupSpacing = CGFloat(28.0)
        size.itemHeight = CGFloat(60.0)
        size.itemSpacing = CGFloat(8.0)
        size.itemWidth = CGFloat(36.0)
        size.strokeWidth = CGFloat(1.5)

        var appearance = appearance
        appearance.size = size
        appearance.captionTypography = CodeInputTypography(m: AdaptiveTypographyToken.headerH4Normal.typography).asContainer
        appearance.codeTypography = CodeInputTypography(m: AdaptiveTypographyToken.displayMBold.typography).asContainer
    
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

public extension GeneralAppearanceVariation<CodeInput, CodeInputAppearance, CodeInputVariation.S> {
    
    var s: ComponentAppearanceVariation<CodeInput, CodeInputAppearance> {
        var size =  CodeInputAnySize(size: appearance.size)
        size.captionPadding = CGFloat(24.0)
        size.dotSize = CGFloat(12.0)
        size.groupSpacing = CGFloat(16.0)
        size.itemHeight = CGFloat(44.0)
        size.itemSpacing = CGFloat(4.0)
        size.itemWidth = CGFloat(26.0)
        size.strokeWidth = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
        appearance.captionTypography = CodeInputTypography(s: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.codeTypography = CodeInputTypography(s: AdaptiveTypographyToken.displaySBold.typography).asContainer
    
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


public extension ComponentAppearanceVariation<CodeInput, CodeInputAppearance> {
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

private extension CodeInputAppearance {
    
}
