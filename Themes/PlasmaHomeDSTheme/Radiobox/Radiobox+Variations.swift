import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Radiobox, RadioboxAppearance, RadioboxVariation.L> {
    
    var l: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var size =  RadioboxAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.horizontalGap = CGFloat(12.0)
        size.lineWidth = CGFloat(2.0)
        size.toggleCheckedIconHeight = CGFloat(10.0)
        size.toggleCheckedIconWidth = CGFloat(10.0)
        size.togglePaddings = CGFloat(1.0)
        size.verticalGap = CGFloat(2.0)
        size.width = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = RadioboxTypography(l: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<Radiobox, RadioboxAppearance, RadioboxVariation.M> {
    
    var m: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var size =  RadioboxAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.horizontalGap = CGFloat(10.0)
        size.lineWidth = CGFloat(2.0)
        size.toggleCheckedIconHeight = CGFloat(10.0)
        size.toggleCheckedIconWidth = CGFloat(10.0)
        size.togglePaddings = CGFloat(1.0)
        size.verticalGap = CGFloat(2.0)
        size.width = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = RadioboxTypography(m: AdaptiveTypographyToken.bodySNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<Radiobox, RadioboxAppearance, RadioboxVariation.S> {
    
    var s: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var size =  RadioboxAnySize(size: appearance.size)
        size.height = CGFloat(18.0)
        size.horizontalGap = CGFloat(8.0)
        size.lineWidth = CGFloat(1.5)
        size.toggleCheckedIconHeight = CGFloat(8.0)
        size.toggleCheckedIconWidth = CGFloat(8.0)
        size.togglePaddings = CGFloat(1.0)
        size.verticalGap = CGFloat(2.0)
        size.width = CGFloat(18.0)

        var appearance = appearance
        appearance.size = size
        appearance.subtitleTypography = RadioboxTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
        appearance.titleTypography = RadioboxTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
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

private extension RadioboxAppearance {
    
}
