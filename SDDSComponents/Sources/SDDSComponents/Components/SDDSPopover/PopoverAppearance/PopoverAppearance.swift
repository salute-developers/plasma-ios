import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct PopoverAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var shadow: ShadowToken
    public var size: PopoverSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        shadow: ShadowToken = ShadowToken(),
        size: PopoverSizeConfiguration = ZeroPopoverSize()
    ) {
        self.backgroundColor = backgroundColor
        self.shadow = shadow
        self.size = size
    }
    
    public static func == (lhs: PopoverAppearance, rhs: PopoverAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PopoverAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: PopoverAppearance.self, fallback: PopoverAppearance())
    }
}
