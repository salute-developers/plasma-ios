import SwiftUI
@_exported import SDDSThemeCore

public struct OverlayAppearance {
    public var backgrtoundColor: ColorToken
    public var blurRadius: CGFloat
    
    public init(backgrtoundColor: ColorToken = .clearColor, blurRadius: CGFloat = 0) {
        self.backgrtoundColor = backgrtoundColor
        self.blurRadius = blurRadius
    }
}

extension OverlayAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: OverlayAppearance.self, fallback: OverlayAppearance())
    }
}
