import SwiftUI
import SDDSThemeCore

public struct OverlayAppearance {
    public var backgroundColor: ColorToken
    public var blurRadius: CGFloat
    public var size: OverlaySizeConfiguration
    
    public init(backgroundColor: ColorToken = .clearColor, blurRadius: CGFloat = 0) {
        self.backgroundColor = backgroundColor
        self.blurRadius = blurRadius
        self.size = ZeroOverlaySize()
    }
}

public struct ZeroOverlaySize: OverlaySizeConfiguration {
    public var debugDescription: String {
        "ZeroOverlaySize"
    }
}

extension OverlayAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: OverlayAppearance.self, fallback: OverlayAppearance())
    }
}
