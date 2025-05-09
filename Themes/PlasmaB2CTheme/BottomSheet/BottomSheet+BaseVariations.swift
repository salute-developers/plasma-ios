import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct BottomSheet {
    
    public static let all: [Variation<BottomSheetAppearance>] = [
    ]
}

public struct BottomSheetVariation {
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
