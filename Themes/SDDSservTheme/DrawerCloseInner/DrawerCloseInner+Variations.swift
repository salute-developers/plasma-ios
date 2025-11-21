import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<DrawerCloseInner, DrawerAppearance, DrawerCloseInnerVariation.M> {
    
    var hasShadow: ComponentAppearanceVariation<DrawerCloseInner, DrawerAppearance> {
        var size =  DrawerCloseInnerAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.shadow = ShadowToken.downSoftL
    
        return .init(
            name: "m.hasShadow",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<DrawerCloseInner, DrawerAppearance, DrawerCloseInnerVariation.M> {
        var size =  DrawerCloseInnerAnySize(size: appearance.size)
        size.closeIconHeaderPadding = CGFloat(8.0)
        size.closeIconOffsetX = CGFloat(0.0)
        size.closeIconOffsetY = CGFloat(0.0)
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

public extension GeneralAppearanceVariation<DrawerCloseInner, DrawerAppearance, DrawerCloseInnerVariation.MHasshadow> {
    
    var hasShadow: ComponentAppearanceVariation<DrawerCloseInner, DrawerAppearance> {
        var size =  DrawerCloseInnerAnySize(size: appearance.size)

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


public extension ComponentAppearanceVariation<DrawerCloseInner, DrawerAppearance> {
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
