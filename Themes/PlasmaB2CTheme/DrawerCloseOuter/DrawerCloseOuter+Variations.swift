import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<DrawerCloseOuter, DrawerAppearance, DrawerCloseOuterVariation.M> {
    
    var hasShadow: ComponentAppearanceVariation<DrawerCloseOuter, DrawerAppearance> {
        var size =  DrawerCloseOuterAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftL
    
        return .init(
            name: "m.hasShadow",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<DrawerCloseOuter, DrawerAppearance, DrawerCloseOuterVariation.M> {
        var size =  DrawerCloseOuterAnySize(size: appearance.size)
        size.closeIconHeaderPadding = CGFloat(8.0)
        size.closeIconOffsetX = CGFloat(24.0)
        size.closeIconOffsetY = CGFloat(24.0)
        size.paddingBottom = CGFloat(24.0)
        size.paddingEnd = CGFloat(24.0)
        size.paddingStart = CGFloat(24.0)
        size.paddingTop = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
    
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

public extension GeneralAppearanceVariation<DrawerCloseOuter, DrawerAppearance, DrawerCloseOuterVariation.MHasshadow> {
    
    var hasShadow: ComponentAppearanceVariation<DrawerCloseOuter, DrawerAppearance> {
        var size =  DrawerCloseOuterAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftL
    
        return .init(
            name: "m.hasShadow",
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


public extension ComponentAppearanceVariation<DrawerCloseOuter, DrawerAppearance> {
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

private extension DrawerAppearance {
    
}
