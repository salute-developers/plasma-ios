import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Divider, DividerAppearance, DividerVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<Divider, DividerAppearance> {
        var size =  DividerAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentTertiary
        appearance.shape = CircleDrawer() as PathDrawer
        appearance.thickness = CGFloat(1.0)
    
        return .init(
            name: "default",
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


public extension ComponentAppearanceVariation<Divider, DividerAppearance> {
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

private extension DividerAppearance {
    
}
