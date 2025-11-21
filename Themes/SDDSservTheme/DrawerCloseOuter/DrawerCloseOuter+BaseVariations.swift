import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DrawerCloseOuter {
    public static var m: GeneralAppearanceVariation<DrawerCloseOuter, DrawerAppearance, DrawerCloseOuterVariation.M> {
        var appearance = DrawerAppearance.base
        appearance.size = DrawerCloseOuterSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<DrawerAppearance>] = [
        DrawerCloseOuter.m.variation,
        DrawerCloseOuter.m.hasShadow.variation,
    ]
}

public struct DrawerCloseOuterVariation {
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
