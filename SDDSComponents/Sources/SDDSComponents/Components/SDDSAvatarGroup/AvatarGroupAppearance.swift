import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct AvatarGroupAppearance {
    public var size: AvatarGroupSizeConfiguration
    public var avatarAppearance: AvatarAppearance
    
    public init(
        size: AvatarGroupSizeConfiguration = ZeroAvatarGroupSize(),
        avatarAppearance: AvatarAppearance = AvatarAppearance()
    ) {
        self.size = size
        self.avatarAppearance = avatarAppearance
    }
}

public struct ZeroAvatarGroupSize: AvatarGroupSizeConfiguration {
    public var maxDisplayingAvatarCount: Int { 0 }
    public var borderWidth: CGFloat { 0 }
    public var spacing: CGFloat { 0 }
    public var debugDescription: String {
        "ZeroAvatarGroupSize"
    }
    
    public init() {}
}

extension AvatarGroupAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: AvatarGroupAppearance.self, fallback: AvatarGroupAppearance())
    }
}

