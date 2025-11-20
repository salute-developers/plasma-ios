import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DrawerCloseInner {
    public static var m: GeneralAppearanceVariation<DrawerCloseInner, DrawerAppearance, DrawerCloseInnerVariation.M> {
        var appearance = DrawerAppearance.base
        appearance.size = DrawerCloseInnerSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<DrawerAppearance>] = [
        DrawerCloseInner.m.variation,
        DrawerCloseInner.m.hasShadow.variation,
    ]
}

public struct DrawerCloseInnerVariation {
    public struct M {}
    public struct MHasshadow {}
}

private extension DrawerAppearance {
    static var base: DrawerAppearance {
        var appearance = DrawerAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.closeColor = ColorToken.textDefaultSecondary
        appearance.closeIcon = Asset.close24.image
        return appearance
    }
}
