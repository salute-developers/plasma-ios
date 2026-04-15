import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<BottomSheet, BottomSheetAppearance, BottomSheetVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<BottomSheet, BottomSheetAppearance> {
        var size =  BottomSheetAnySize(size: appearance.size)
        size.handleHeight = CGFloat(4.0)
        size.handleOffset = CGFloat(6.0)
        size.handlePathDrawer = CircleDrawer() as PathDrawer
        size.handleWidth = CGFloat(48.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(16.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.handleColor = ColorToken.surfaceDefaultSolidTertiary
        appearance.handlePlacement = BottomSheetHandlePlacement.auto
        appearance.size = BottomSheetSizeDefault()
    
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


public extension ComponentAppearanceVariation<BottomSheet, BottomSheetAppearance> {
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

private extension BottomSheetAppearance {
    
}
