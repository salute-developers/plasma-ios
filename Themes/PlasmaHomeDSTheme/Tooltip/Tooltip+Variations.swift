import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Tooltip, TooltipAppearance, TooltipVariation.M> {
    
    var m: ComponentAppearanceVariation<Tooltip, TooltipAppearance> {
        var size =  TooltipAnySize(size: appearance.size)
        size.contentStartPadding = CGFloat(6.0)
        size.offset = CGFloat(8.0)
        size.paddingBottom = CGFloat(11.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(11.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.tailHeight = CGFloat(8.0)
        size.tailPadding = CGFloat(10.0)
        size.tailWidth = CGFloat(20.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TooltipTypography(m: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
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

public extension GeneralAppearanceVariation<Tooltip, TooltipAppearance, TooltipVariation.S> {
    
    var s: ComponentAppearanceVariation<Tooltip, TooltipAppearance> {
        var size =  TooltipAnySize(size: appearance.size)
        size.contentStartPadding = CGFloat(4.0)
        size.offset = CGFloat(6.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(8.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.tailHeight = CGFloat(6.0)
        size.tailPadding = CGFloat(9.0)
        size.tailWidth = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = TooltipTypography(s: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
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


public extension ComponentAppearanceVariation<Tooltip, TooltipAppearance> {
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

private extension TooltipAppearance {
    
}
