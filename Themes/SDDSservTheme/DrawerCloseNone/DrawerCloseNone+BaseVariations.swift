import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct DrawerCloseNone {
    public static var m: GeneralAppearanceVariation<DrawerCloseNone, DrawerAppearance, DrawerCloseNoneVariation.M> {
        var appearance = DrawerAppearance.base
        appearance.size = DrawerCloseNoneSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<DrawerAppearance>] = [
        DrawerCloseNone.m.variation,
        DrawerCloseNone.m.hasShadow.variation,
    ]
}

public struct DrawerCloseNoneVariation {
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
