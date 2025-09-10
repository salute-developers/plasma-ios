import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<ScrollBar, ScrollbarAppearance, ScrollBarVariation.M> {
    
    var m: ComponentAppearanceVariation<ScrollBar, ScrollbarAppearance> {
        var size =  ScrollBarAnySize(size: appearance.size)
        size.shape = DefaultPathDrawer() as PathDrawer as PathDrawer
        size.width = CGFloat(4.0)

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

public extension GeneralAppearanceVariation<ScrollBar, ScrollbarAppearance, ScrollBarVariation.S> {
    
    var s: ComponentAppearanceVariation<ScrollBar, ScrollbarAppearance> {
        var size =  ScrollBarAnySize(size: appearance.size)
        size.shape = DefaultPathDrawer() as PathDrawer as PathDrawer
        size.width = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
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


public extension ComponentAppearanceVariation<ScrollBar, ScrollbarAppearance> {
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

private extension ScrollbarAppearance {
    
}
