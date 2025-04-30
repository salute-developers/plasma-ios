import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct BottomSheet {
    public static var Default: ComponentAppearanceVariation<BottomSheet, BottomSheetAppearance> {
        var appearance = BottomSheetAppearance.base
        appearance.size = BottomSheetSize.Default
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.handleColor = ColorToken.surfaceDefaultSolidTertiary
        appearance.handlePlacement = BottomSheetHandlePlacement.auto
        appearance.size = BottomSheetSizeDefault()

        return .init(
            name: "Default",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<BottomSheetAppearance>] = [
    ]
}

public struct BottomSheetVariation {
    public struct Default {}
}

private extension BottomSheetAppearance {
    static var base: BottomSheetAppearance {
        var appearance = BottomSheetAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.handleColor = ColorToken.surfaceDefaultSolidTertiary
        appearance.handlePlacement = BottomSheetHandlePlacement.auto
        appearance.size = BottomSheetSizeDefault()
        return appearance
    }
}
