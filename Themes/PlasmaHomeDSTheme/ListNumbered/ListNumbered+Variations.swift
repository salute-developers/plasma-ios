import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<ListNumbered, ListAppearance, ListNumberedVariation.S> {
    
    var s: ComponentAppearanceVariation<ListNumbered, ListAppearance> {
        var size =  ListNumberedAnySize(size: appearance.size)
        size.gap = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.listItemAppearance = ListNumberedItem.s.appearance
    
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


public extension ComponentAppearanceVariation<ListNumbered, ListAppearance> {
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

private extension ListAppearance {
    
}
