import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Overlay {
    public static var `default`: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var appearance = OverlayAppearance.base
        appearance.size = OverlaySize.`default`
        appearance.backgroundColor = ColorToken.overlayDefaultSoft
        appearance.blurRadius = CGFloat(16.0)

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<OverlayAppearance>] = [
        Overlay.default.variation,
    ]
}

public struct OverlayVariation {
    public struct Default {}
}

private extension OverlayAppearance {
    static var base: OverlayAppearance {
        var appearance = OverlayAppearance()
        appearance.backgroundColor = ColorToken.overlayDefaultSoft
        appearance.blurRadius = CGFloat(16.0)
        return appearance
    }
}
