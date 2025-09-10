import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Modal, ModalAppearance, ModalVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<Modal, ModalAppearance> {
        var size =  ModalAnySize(size: appearance.size)
        size.closeSize = CGFloat(24.0)
        size.paddingBottom = CGFloat(32.0)
        size.paddingEnd = CGFloat(32.0)
        size.paddingStart = CGFloat(32.0)
        size.paddingTop = CGFloat(32.0)
        size.shadow = ShadowToken.downSoftL
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.closeColor = ColorToken.textDefaultSecondary
    
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


public extension ComponentAppearanceVariation<Modal, ModalAppearance> {
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

private extension ModalAppearance {
    
}
