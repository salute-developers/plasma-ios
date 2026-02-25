import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Overlay {
    public static var `default`: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var appearance = OverlayAppearance.base
        appearance.size = OverlaySize.`default`
        appearance.backgroundColor = .color(.overlayOnDarkSoft)
        appearance.blurRadius = CGFloat(16.0)

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    public static var directionBottom: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var appearance = OverlayAppearance.base
        appearance.size = OverlaySize.directionBottom
        appearance.backgroundColor = .gradient(GradientToken.overlayDefaultGradientDown)

        return .init(
            name: "directionBottom",
            appearance: appearance
        )
    }
    public static var directionTop: ComponentAppearanceVariation<Overlay, OverlayAppearance> {
        var appearance = OverlayAppearance.base
        appearance.size = OverlaySize.directionTop
        appearance.backgroundColor = .gradient(GradientToken.overlayDefaultGradientUp)

        return .init(
            name: "directionTop",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<OverlayAppearance>] = [
        Overlay.default.variation,
        Overlay.directionBottom.variation,
        Overlay.directionTop.variation,
    ]
}

public struct OverlayVariation {
    public struct Default {}
    public struct Directionbottom {}
    public struct Directiontop {}
}

private extension OverlayAppearance {
    static var base: OverlayAppearance {
        var appearance = OverlayAppearance()
        appearance.backgroundColor = .color(.clearColor)
        return appearance
    }
}
